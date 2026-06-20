# Browser Automation Research - Synthesis Report (2026-06-19)

**Goal**: Identify best headless browser automation for Grok-powered AI coding agent SDK.
**Constraints**:
- Real Chrome/Edge via `--remote-debugging-port` (CDP) + dedicated profile (persistent logins).
- Auto port selection / fallback.
- Prefer accessibility tree / structured snapshots over screenshots (token efficiency).
- Python primary stack (xai-sdk + Playwright + keyring).
- Multi-tab isolation desirable.
- Actively maintained 2026 projects.

## Ranked Shortlist (TOP 4)

| Rank | Repo | Stars (2026) | Lang | Key Strengths | Weaknesses | Score (1-10) for our use case |
|------|------|--------------|------|---------------|------------|-------------------------------|
| 1 | browser-use/browser-use | ~99k | Python | Direct `from_system_chrome(profile)`, CDP via `cdp_use`, hybrid DOM+screenshots, persistent profiles, agent loop, CHROME_DEBUG_PORT=9242 fallback logic, actively evolving (Rust core) | Every step = LLM call (cost), larger per-viewport snapshots | 9.5 |
| 2 | microsoft/playwright-mcp | ~34k | TS (Node) | Canonical a11y snapshots (ariaSnapshot), official `--cdp http://... --reuse-session`, persistent profiles, `--headless`, multi-tab tools, MCP stdio/HTTP | Not Python-native (subprocess or bridge needed), single-agent by default (orchestrator projects exist) | 8.5 |
| 3 | echo-lumen/cdp-browser-mcp (browser-autopilot) | low | TS (Node) | Pure CDP Accessibility tree, **full page** in 1 call, **3.3-4.6x fewer tokens** than Playwright MCP, compact `[N] role "name"` indexing, tabs support | Node MCP only, no official Python, early/low stars | 7.5 |
| 4 | browserbase/stagehand (+ stagehand-python) | ~23k TS / 500 Py | TS + Py SDK | CDP-native v3 (dropped Playwright layer for speed), act/extract/agent + caching/self-healing, computer-use support | TS-first (Py SDK secondary), cloud bias (Browserbase), caching shines on repeats | 7.0 |

**Others reviewed** (lower fit): Skyvern (vision-heavy), Talox, agent-browser, playwright-mcp-orchestrator (early), CowAgent docs patterns, etc.

## Winner(s) Detailed Setup

### Primary Recommendation: browser-use (Python)

**Why**: Matches our stack exactly. Provides high-level agent + low-level `Browser` / `BrowserSession` with CDP attach to real logged-in Chrome profile.

#### 1. Launch Chrome with dedicated profile + CDP (auto-port pattern)
From `browser_use/browser/profile.py`:
```python
CHROME_DEBUG_PORT = 9242  # avoids 9222 conflict
```
Example launch (or let browser-use handle):
```bash
# macOS
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --remote-debugging-port=9242 \
  --user-data-dir="$HOME/.grok-agent/chrome-profile" \
  --no-first-run --no-default-browser-check "about:blank"

# Windows (PowerShell)
& "C:\Program Files\Google\Chrome\Application\chrome.exe" `
  --remote-debugging-port=9242 `
  --user-data-dir="$env:USERPROFILE\.grok-agent\chrome-profile"
```

browser-use already:
- Copies real profile safely (skips locks).
- Disables many automation signals.
- Uses non-default port.

#### 2. Attach from Python (persistent login)
```python
# examples/browser/real_browser.py (adapted)
from browser_use import Agent, Browser
import asyncio

async def main():
    browser = Browser.from_system_chrome(
        profile_directory="C:\\Users\\fvegi\\AppData\\Local\\Google\\Chrome\\User Data\\Default"  # or copied dedicated
        # or: cdp_url="http://127.0.0.1:9242"
    )
    agent = Agent(
        llm=...,  # your xai-sdk wrapper or ChatGoogle etc.
        task="...",
        browser=browser,
    )
    await agent.run()

asyncio.run(main())
```

`BrowserSession` also accepts `cdp_url=...` directly for lower-level control.

#### 3. Accessibility snapshots
browser-use uses DOM watchdogs + accessibility-derived structured state (not raw screenshots by default). You can request `page.screenshot()` as fallback.

#### 4. Persistent auth / profile reuse
- Log in once in the `--user-data-dir`.
- Copy or point `from_system_chrome` / `user_data_dir` at it.
- browser-use copies transient files safely on launch.

### Secondary: Playwright MCP (for standardized a11y tools)

Use when you want the canonical MCP tool surface or to run alongside other MCP clients.

**Launch Chrome** (same as above, non-default port + dedicated dir).

**Connect via CDP** (from Python Playwright or MCP config):
```json
// MCP client config
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest", "--cdp", "http://127.0.0.1:9242", "--reuse-session"]
    }
  }
}
```

Python direct (no MCP):
```python
from playwright.sync_api import sync_playwright
with sync_playwright() as p:
    browser = p.chromium.connect_over_cdp("http://127.0.0.1:9242")
    context = browser.contexts[0]  # reuse existing
    page = context.pages[0] if context.pages else context.new_page()
    # Use page.accessibility.snapshot() or Playwright locators + aria
```

**Accessibility snapshot** (Playwright style):
- `browser_snapshot` tool or `page.accessibility.snapshot()` / `ariaSnapshot()`.

**Multi-tab**: Supported via `browser_tabs`, `new_tab`, etc.

## Gaps We Must Implement

1. **Auto free-port finder (Python)**  
   browser-use hardcodes 9242. We need robust `find_free_port(start=9222, max_tries=20)` + fallback, and pass to launch / `cdp_url`.

2. **Secure profile + credential bridge**  
   - Never hardcode paths in code.  
   - Use `keyring` + one-time "import creds" flow that seeds the dedicated `--user-data-dir`.  
   - Encrypt / protect profile dir on disk.

3. **xai-sdk vision fallback integration**  
   When a11y tree is insufficient (canvas, heavy JS, CAPTCHAs), fall back to screenshot + xai vision call. Need clean abstraction.

4. **Tab isolation for concurrent agents**  
   Official Playwright MCP is single-agent. Look at `playwright-mcp-orchestrator` patterns or run separate contexts / separate Chrome instances per session.

5. **Stealth / anti-bot hardening**  
   browser-use has good defaults. We should audit and extend (user-agent rotation, proxy, CDP fingerprinting).

6. **Pure CDP compact snapshotter (optional extreme token win)**  
   If we want cdp-browser-mcp style full-page indexed AX in Python, port or wrap `Accessibility.getFullAXTree` + compression logic.

## Minimal Working Snippets

**Launch + attach (Python + browser-use style)**:
```python
import subprocess, time, socket
from contextlib import closing

def free_port(start=9222):
    for p in range(start, start+20):
        with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as s:
            if s.connect_ex(('127.0.0.1', p)) != 0:
                return p
    raise RuntimeError("no free port")

port = free_port()
profile = r"C:\Users\fvegi\.grok-agent\chrome-profile"

# one-time: user logs in here
subprocess.Popen([
    r"C:\Program Files\Google\Chrome\Application\chrome.exe",
    f"--remote-debugging-port={port}",
    f"--user-data-dir={profile}",
    "--no-first-run", "--no-default-browser-check", "about:blank"
])

time.sleep(2)
cdp_url = f"http://127.0.0.1:{port}"

# then
from browser_use import Browser, Agent
browser = Browser(cdp_url=cdp_url)   # or from_system_chrome
# ... agent = Agent(..., browser=browser)
```

**Playwright Python CDP attach**:
```python
from playwright.sync_api import sync_playwright
browser = p.chromium.connect_over_cdp(cdp_url)
ctx = browser.contexts[0]
page = ctx.new_page() if not ctx.pages else ctx.pages[0]
snap = page.accessibility.snapshot()  # or aria snapshot equivalent
```

## Recommendation for Implementation Team

**Start with browser-use as the core browser controller** for Python-native persistent-profile CDP attach.

**Layer Playwright MCP** (or direct Playwright `connect_over_cdp`) when standardized MCP tools or a11y snapshots are preferred for certain agent modes.

**Add**:
- Port auto-selection utility.
- Keyring-seeded dedicated profile management.
- Optional vision fallback path using xai-sdk.
- Concurrency / tab isolation strategy.

This combination gives the best 2026 balance of token efficiency, persistent auth, and Python control.

---
*Generated by synthesis agent. All clones and findings are in ./research-agents/synthesis/.*
