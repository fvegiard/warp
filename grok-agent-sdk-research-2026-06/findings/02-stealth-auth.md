# Stealth & Persistent Auth Research for Headless Browser Automation (2026)

**Agent**: research-stealth-auth  
**Date**: 2026-06-19  
**Focus**: Real Chrome/Edge CDP attachment, persistent logged-in profiles, anti-detection/stealth, port handling, Python/MCP integration, once-only credential import for AI agent SDK use case.

## Executive Summary & Recommendations

**Top recommendations for Grok SDK (Python + Playwright + keyring)**:

1. **Primary stealth engine**: **Patchright** (or rebrowser-playwright) as drop-in `from patchright.sync_api import ...`.  
   - Fixes `Runtime.enable` CDP leak + command flag leaks that `playwright-stealth` + `puppeteer-extra` cannot hide from Kasada/Cloudflare/DataDome.  
   - Passes Brotector, CreepJS, Sannysoft, Browserscan, Akamai, etc. in 2026.  
   - Use with `channel="chrome"` + `launch_persistent_context`.

2. **Profile / persistent auth strategy**:
   - **Preferred**: `launch_persistent_context(user_data_dir=..., channel="chrome")` for full state (cookies, IndexedDB, extensions, Service Workers).
   - **CDP attach for "use my real logged-in Chrome"**: Chrome 136+ blocks `--remote-debugging-port` on the *default* user data dir.  
     - One-time: copy `Default/` (exclude heavy Cache/) to a debug dir (e.g. `~/.chrome-debug/Default`).  
     - Launch real Chrome: `--remote-debugging-port=9222 --user-data-dir=debug-dir --profile-directory=Default`.  
     - Connect: `playwright.chromium.connectOverCDP("http://localhost:9222")` or MCP `--cdp-endpoint`.  
     - See: `ssv445/chrome-with-playwright` launch.sh pattern (highly recommended starting point).
   - Lighter alternative: `storage_state` JSON for cookies+localStorage only (faster, but loses some fidelity).

3. **Port selection / fallback**:
   - Use `--remote-debugging-port=0` for OS-chosen free port.
   - Parse `DevToolsActivePort` file or stdout "DevTools listening on ws://...".
   - Playwright `connectOverCDP` now supports channel names (auto-resolves via DevToolsActivePort).
   - MCP server: `--cdp-endpoint http://localhost:9222` (or dynamic port).
   - Implement retry + fallback in SDK launcher.

4. **MCP / structured snapshots**:
   - **@playwright/mcp** (official Microsoft) is the gold standard for 2026 AI agents:
     - Default: `browser_snapshot` → accessibility tree (token-efficient, Playwright aria snapshots with `[ref=eN]`).
     - `--vision` or caps for screenshots when needed.
     - Full tab support, persistent profiles, `--user-data-dir`, `--cdp-endpoint`.
     - Tools are deterministic and LLM-friendly.
   - Python MCP servers (FastMCP + Patchright) are viable for custom tool surfaces.

5. **Credential / OAuth once-only import**:
   - First run (headed): launch with target profile dir, perform login/OAuth (manually or via injected keyring secrets).
   - Subsequent runs: reuse the same `--user-data-dir` or CDP attach.
   - Store profile path (or alias) in keyring or config; never commit the dir.
   - For multi-account: one dir per account/session. Use named sessions.
   - Warn users: Chrome locks profiles (SingletonLock/lockfile). Concurrent use needs `--isolated` or separate dirs. Profile copy is required post-Chrome 136 for CDP on real sessions.
   - keyring usage: store OAuth client secrets or initial login creds, *not* the full cookie jar (the browser profile is the jar).

6. **Stealth best practices (2026)**:
   - Prefer **Patchright** (or rebrowser) over pure `playwright-stealth`.
   - Real Chrome channel (`channel="chrome"`) + persistent context > bundled Chromium.
   - `no_viewport=True`, realistic UA + viewport + locale + timezone + geolocation.
   - Human-like timing (random delays, bezier mouse if using extra layers).
   - Avoid `headless=True` for first login or Cloudflare-heavy flows; use `--headless=new` if needed.
   - For extreme cases: residential proxies + geo-consistent fingerprint + humanizer.

**Overall score for our use case**: Patchright + official Playwright MCP + chrome-with-playwright launcher pattern = **9.5/10**. Covers CDP attach to real profiles, stealth, snapshots, Python, persistent auth.

---

## Detailed Findings per Repository / Pattern

### 1. Patchright (core + Python) – Kaliiiiiiiiii-Vinyzu
- **Repo**: https://github.com/Kaliiiiiiiiii-Vinyzu/patchright (driver) + patchright-python
- **Stars**: ~2789 (driver), ~1388 (python) – actively maintained into 2026.
- **Last activity**: 2026 commits visible.
- **Key strengths**:
  - Source-level patches for `Runtime.enable` leak (biggest CDP detection vector for Kasada/Cloudflare).
  - Disables Console API leak; tweaks default args (`--disable-blink-features=AutomationControlled`, removes automation flags).
  - Drop-in: `from patchright.sync_api import sync_playwright`.
  - Passes: Cloudflare, Kasada, Akamai, DataDome, CreepJS, Sannysoft, Browserscan, Brotector (with CDP-Patches), etc.
  - Supports closed shadow roots, XPath in them, isolated/main context choice.
- **Best usage for persistent real profile**:
  ```python
  from patchright.sync_api import sync_playwright
  with sync_playwright() as p:
      ctx = p.chromium.launch_persistent_context(
          user_data_dir="/path/to/profile",
          channel="chrome",   # real Chrome, not bundled
          headless=False,     # or True after initial login
          no_viewport=True,
          # no custom UA/headers for fingerprint consistency
      )
      page = ctx.pages()[0] or ctx.new_page()
  ```
- **Weaknesses**: Only Chromium. Some Playwright tests still fail (expected for stealth forks). Console disabled (use JS loggers if needed).
- **Score**: 10/10 for stealth + Python persistent profile.

### 2. rebrowser-playwright (Python + patches)
- **Repo**: https://github.com/rebrowser/rebrowser-playwright-python + rebrowser-patches
- **Stars**: ~100+ python, 1k+ patches – maintained.
- **Key strengths**: Similar `Runtime.enable` fix (addBinding / isolated / enable-disable modes via env). Drop-in replacement. Focus on rebrowser-bot-detector.
- **Usage**: Same import swap. Env `REBROWSER_PATCHES_RUNTIME_FIX_MODE=addBinding`.
- **Relation**: Complementary/alternative to Patchright. Choose based on which detector set you face.
- **Score**: 9/10.

### 3. chrome-with-playwright (ssv445) – CDP + real profile launcher
- **Repo**: https://github.com/ssv445/chrome-with-playwright
- **Stars**: low but extremely targeted and current (2026).
- **Problem it solves**: Chrome >=136 refuses remote debugging on the *default* user data dir for security. You must use a separate dir.
- **Pattern** (gold for "attach to my logged-in Chrome"):
  1. One-time copy:
     ```bash
     rsync -a --exclude='Cache' --exclude='Code Cache' --exclude='Service Worker' \
       ~/Library/Application\ Support/Google/Chrome/Default/ \
       ~/.chrome-debug/Default/
     ```
  2. Launch (launch.sh):
     - `--remote-debugging-port=9222 --remote-debugging-address=127.0.0.1 --user-data-dir=~/.chrome-debug --profile-directory=Default`
     - Disables on-device AI models + background networking.
     - If already debugging, just activate.
  3. Connect:
     - Playwright: `chromium.connectOverCDP("http://localhost:9222")`
     - MCP: `--cdp-endpoint http://localhost:9222`
  - Includes macOS .app wrapper and status.sh.
- **Notes**: Login once in the debug Chrome (cookies encrypted per data-dir). Profile is independent of main Chrome.
- **Score**: 10/10 for the exact CDP + persistent real-profile requirement.

### 4. Official @playwright/mcp (Microsoft)
- **Repo**: part of microsoft/playwright (packages/playwright-core/src/tools/mcp)
- **Stars**: Playwright overall 90k+.
- **Key features for agents**:
  - Default tool: `browser_snapshot` → structured a11y tree with `[ref=eN]` (excellent token efficiency).
  - `--vision` / caps for screenshots + coordinate input.
  - `--cdp-endpoint`, `--user-data-dir`, `--headless`, `--browser=chrome|msedge`, tab tools, storage state.
  - Persistent profile by default (cache dir per workspace/channel).
  - Profile lock detection (throws if in use; use `--isolated`).
  - SSE mode for headed on headless hosts.
  - Full tab management, network, console, PDF, etc.
- **CLI examples**:
  ```bash
  npx @playwright/mcp@latest --cdp-endpoint http://localhost:9222
  npx @playwright/mcp@latest --user-data-dir ~/.my-agent-profile --headless
  ```
- **Python integration**: Use the MCP server as-is (npx) or build custom FastMCP wrapper around Patchright + Playwright MCP tools.
- **Score**: 9.5/10 – canonical for structured snapshot agent use.

### 5. Other notable patterns & repos (2026)
- **HArars/browser-stealthkit-mcp** (Python FastMCP + Playwright): storage_state save/load, snapshot, tabs, console/network logs. Good for custom tool surface.
- **brian-ln/stealth-browser-mcp**, **playwright-stealth-mcp-server** (npm): puppeteer-extra-plugin-stealth + playwright-extra; env `STEALTH_MODE=true`; persistent sessions; screenshot/video support. Weaker than Patchright against modern detectors.
- **cloak-browser-mcp**, **stealth-agent-browser-mcp**: source-patched Chromium or rebrowser + hybrid vision. Strong for hard anti-bot but heavier.
- **Python FastMCP + playwright-stealth examples** (AlterLab blog, etc.): Show lifespan-managed browser + stealth_async + markdownify. Useful reference but not production stealth.
- **Multi-account isolation**: Separate persistent dirs per account + consistent proxy+TZ+locale per dir. Parallel via separate processes or careful context management.

### 6. Critical 2026 Platform Changes
- Chrome 136+ (and later): `--remote-debugging-port` + default profile = blocked. Must copy or use non-default `--user-data-dir`. This is the dominant pattern now (chrome-with-playwright, browser-use issues, etc.).
- Profile locks: SingletonLock / lockfile. SDK must detect and surface clear error + `--isolated` guidance.
- Cookie encryption: per user-data-dir path. Copying profile requires re-login in the new dir for some sites.
- Detection surface: `Runtime.enable` timing + CDP artifacts are primary leaks now. Pure JS stealth is insufficient.

### 7. Credential / OAuth Once-Only Flow (Recommended for SDK Users)
```python
# First-time / re-auth (headed)
profile_dir = keyring.get_password("myapp", "browser_profile") or "~/.agent-profiles/work"
# user launches:
#   chrome --remote-debugging-port=9222 --user-data-dir=profile_dir
#   (or SDK helper that does the copy + launch)
# Perform OAuth/login manually or seed with keyring-stored creds.
# Close browser.

# Normal agent run (headless or CDP)
browser = playwright.chromium.connectOverCDP("http://localhost:9222")  # or launch_persistent_context
# or use @playwright/mcp --cdp-endpoint / --user-data-dir
```
- Store only the profile path (or alias) + any initial secrets in keyring.
- Never commit profile directories.
- Provide SDK helper: `ensure_profile(profile_name)` that does copy if needed + first-run guidance.
- Support named sessions for multi-account / parallel agents.

### 8. Port Auto-Selection Implementation Sketch
```python
# Launch Chrome with free port
proc = subprocess.Popen([
    chrome_exe,
    f"--remote-debugging-port=0",
    f"--user-data-dir={udir}",
    ...
], stdout=PIPE)
# Parse stdout or DevToolsActivePort for actual ws://... or port
# Then: playwright.chromium.connectOverCDP(f"http://localhost:{port}")
```
Official Playwright now supports channel resolution via DevToolsActivePort for `connectOverCDP("chrome")` etc.

---

## Concrete Setup Commands / Snippets for SDK

**Install**:
```bash
pip install patchright playwright
patchright install chrome   # or chromium
```

**Persistent stealth profile (recommended)**:
```python
from patchright.sync_api import sync_playwright
with sync_playwright() as p:
    ctx = p.chromium.launch_persistent_context(
        "profiles/work",
        channel="chrome",
        headless=True,   # after initial login
        no_viewport=True,
    )
```

**CDP attach to real logged-in session (post-Chrome 136)**:
```bash
# One-time setup (or SDK helper)
mkdir -p ~/.chrome-debug/Default
cp -R ~/Library/Application\ Support/Google/Chrome/Default/* ~/.chrome-debug/Default/  # or rsync excluding caches
# Launch
google-chrome --remote-debugging-port=9222 --user-data-dir=~/.chrome-debug --profile-directory=Default
# Connect
playwright.chromium.connectOverCDP("http://localhost:9222")
```

**MCP usage (for agent hosts)**:
```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest", "--cdp-endpoint", "http://localhost:9222"]
    }
  }
}
```

**Python FastMCP custom server skeleton** (for full control):
```python
from mcp.server.fastmcp import FastMCP
from patchright.async_api import async_playwright
from playwright_stealth import stealth_async  # fallback only

mcp = FastMCP("agent-browser")
browser = None

@mcp.lifespan()
async def lifespan():
    global browser
    p = await async_playwright().start()
    browser = await p.chromium.launch_persistent_context("profile", channel="chrome")
    yield
    await browser.close()

@mcp.tool()
async def browse(url: str) -> str:
    page = await browser.new_page()
    await stealth_async(page)  # optional
    await page.goto(url)
    # return snapshot or markdown
    ...
```

---

## Scores (1-10 for our exact requirements)

- Patchright + launch_persistent_context + chrome channel: **10**
- chrome-with-playwright CDP launcher pattern: **10**
- Official @playwright/mcp (snapshots + cdp-endpoint + profiles): **9.5**
- rebrowser-playwright: **9**
- Classic playwright-stealth + extra: **6** (insufficient vs 2026 detectors)
- Pure storage_state without full profile: **5** (loses fidelity for real sessions)

## References / Sources Used
- Patchright README + patches (Runtime.enable, command flags).
- rebrowser-patches docs.
- chrome-with-playwright launch.sh + README (Chrome 136+ workaround).
- Microsoft Playwright MCP source (program.ts, browserFactory.ts, cdpRelay.ts, chromium.ts connectOverCDP + DevToolsActivePort).
- Official docs + tests/mcp/* (cdp.spec.ts, profile-lock, user-data-dir behavior).
- Web results on Chrome remote-debugging-port changes, browser-use issues, persistent profile articles.
- Various 2026 MCP stealth wrappers (HArars, cloak, etc.).

## Next Steps for Synthesis Agent
- Cross-reference with sibling agents (e.g., pure MCP tools, Python SDK wrappers, proxy handling).
- Standardize on Patchright + official MCP or custom FastMCP + the chrome-debug copy launcher.
- Implement SDK helpers for: profile ensure/copy, auto-port CDP launch, once-only login flow, keyring-backed profile aliases.
- Add docs + warnings for Chrome profile locking and post-136 requirements.

This research is self-contained under `./research-agents/stealth-auth/`. All clones are shallow for inspection only.
