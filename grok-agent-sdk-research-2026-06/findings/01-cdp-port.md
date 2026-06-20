# CDP + Auto-Port + Persistent Profile Research (cdp-port agent area) - 2026-06-19

**Focus**: Real Chrome/Edge via --remote-debugging-port (CDP), automatic free-port / DevToolsActivePort discovery, persistent logged-in profiles, stealth, for Python + Playwright/browser-use stack.

All research done via gh CLI searches + direct clones + code reads (no assumptions). Clones in this directory.

## Key Repos Inspected

### 1. SawyerHood/dev-browser (strongest auto-port + attach logic)
- Stars: ~6k, actively updated (2026-06-19).
- Core file: daemon/src/browser-manager.ts
- **Auto port discovery**:
  - DISCOVERY_PORTS = [9222..9229]
  - readDevToolsActivePort(): reads standard locations per OS:
    - Windows: %LOCALAPPDATA%\Google\Chrome\User Data\DevToolsActivePort (and Beta, SxS, Chromium, Brave)
    - macOS / Linux equivalents.
  - parseDevToolsActivePort(contents):
    - Line 1 = port number
    - Line 2 = /devtools/browser/<guid>
    - Returns ws://<host>:<port><path>
  - autoConnect(name):
    - First tries readDevToolsActivePort()
    - Then probes ports 9222-9229 via /json/version -> webSocketDebuggerUrl
    - Falls back to readDevToolsActivePort(expectedPort) on 404
  - Supports "auto" endpoint and explicit ws:// or http://
- Connects via chromium.connectOverCDP(endpoint)
- Also supports launching its own persistent context (dedicated profile dir).
- Good error messages guiding user to enable remote debugging or launch with --remote-debugging-port.

**Relevance**: Best concrete implementation of the "find the actual port after port=0 or user-launched Chrome" pattern. Directly solves our auto-port gap.

### 2. Sunwood-ai-labs/logged-in-google-chrome-skill
- Explicit pattern for persistent logged-in Chrome + Playwright CDP attach.
- Scripts:
  - launch_logged_in_chrome.ps1: launches real Chrome with dedicated --user-data-dir + --remote-debugging-port=9222
  - check_cdp_port.ps1: verifies the endpoint is alive
  - close_logged_in_chrome.ps1
- Rules from the skill:
  - Launch real headed Chrome first with dedicated profile.
  - User does manual login.
  - Then: chromium.connectOverCDP("http://localhost:<port>")
  - Never point at the main %LOCALAPPDATA%\Google\Chrome\User Data for automation.
- Matches Chrome 136+ reality: dedicated dir required for remote debugging on real profiles.

**Relevance**: Exact "one-time login into dedicated profile, then attach forever" flow we need for credentials/persistent auth.

### 3. Kaliiiiiiiiii-Vinyzu/CDP-Patches
- Python package for patching CDP leaks at OS level (Input domain).
- Addresses pageX/pageY == screenX/screenY detection (crbug fixed in future Chrome but still relevant).
- Dispatches real OS-level mouse/keyboard events for headful browsers.
- Works with Playwright (sync/async), Selenium, etc.
- Note in README: some leaks are being fixed upstream in Chrome ~v142+; still useful for certain detectors and Select elements.

**Relevance**: Stealth layer when using real Chrome headful or when browser-use/Playwright signals are still detected.

## Other Confirmed via gh Searches
- microsoft/playwright, playwright-mcp, playwright-python, playwright-cli: already covered by official-mcp and synthesis.
- mediar-ai/playwright-mcp-orchestrator and pm990320/ultimate-playwright-mcp: multi-agent tab isolation (covered in research-multi-agent).
- No single "magic auto-port launcher" dominates; the pattern is consistent: launch Chrome yourself (or let user launch) with --remote-debugging-port (or 0), then parse DevToolsActivePort or probe /json/version.

## Recommended Implementation for Grok Agent SDK (Browser Module)

1. **Port discovery (Python equivalent of dev-browser logic)**:
   `python
   import socket, json, urllib.request, os, platform
   from pathlib import Path

   DISCOVERY_PORTS = list(range(9222, 9230))

   def find_devtools_active_port_candidates():
       home = Path.home()
       system = platform.system()
       if system == "Windows":
           base = home / "AppData/Local"
           candidates = [
               base / "Google/Chrome/User Data/DevToolsActivePort",
               base / "Google/Chrome Beta/User Data/DevToolsActivePort",
               # ... Chromium, Brave, etc.
           ]
       # macOS and Linux similar
       return [c for c in candidates if c.exists()]

   def parse_devtools_active_port(path: Path) -> str | None:
       try:
           lines = path.read_text().strip().splitlines()
           port = int(lines[0])
           ws_path = lines[1]
           if ws_path.startswith("/devtools/browser/"):
               return f"ws://127.0.0.1:{port}{ws_path}"
       except Exception:
           pass
       return None

   def discover_cdp_endpoint():
       # 1. Try DevToolsActivePort
       for cand in find_devtools_active_port_candidates():
           ep = parse_devtools_active_port(cand)
           if ep: return ep
       # 2. Probe common ports
       for p in DISCOVERY_PORTS:
           url = f"http://127.0.0.1:{p}/json/version"
           try:
               with urllib.request.urlopen(url, timeout=0.8) as r:
                   data = json.loads(r.read())
                   return data["webSocketDebuggerUrl"]
           except Exception:
               continue
       return None
   `

2. **Launch dedicated profile (persistent auth, Chrome 136+ safe)**:
   - Use subprocess to start:
     chrome.exe --remote-debugging-port=9222 --user-data-dir="C:\Users\...\grok-agent\profiles\work" --no-first-run --no-default-browser-check "about:blank"
   - Or let user launch manually once.
   - Store profile path/alias in keyring only.

3. **Attach**:
   - browser-use: Browser(cdp_url=discovered_endpoint) or from_system_chrome(user_data_dir=...)
   - Or direct: playwright.chromium.connect_over_cdp(endpoint)
   - Patchright if extra stealth needed.

4. **Stealth**:
   - Prefer real Chrome channel + dedicated profile (max stealth).
   - CDP-Patches (Python) for OS-level input on headful sessions when needed.
   - Avoid classic playwright-stealth alone against 2026 detectors.

5. **Multi-agent**:
   - Use dedicated profiles per agent or tab isolation (targetId/groupId) on shared context (see ultimate-playwright-mcp research).

## Gaps the SDK Must Still Implement
- Robust Python port finder + DevToolsActivePort reader (above sketch).
- Profile manager that creates/copies dedicated dirs safely (exclude heavy caches for Chrome 136+).
- One-time headed login flow + keyring alias storage.
- Fallback: if no DevToolsActivePort and no probed port, clear error + instructions.
- Optional: launch helper that tries port=0, then reads the written DevToolsActivePort.

## Sources
- Direct clones + code reads in research-agents/cdp-port/ (dev-browser, logged-in-google-chrome-skill, CDP-Patches).
- gh CLI searches for "DevToolsActivePort", "remote-debugging-port", "chrome-with-playwright", CDP patches, etc.
- Cross-referenced with synthesis and official-mcp findings.

*Produced by orchestrator after repeated bare finish_task from cdp-port agent. All data from actual GitHub inspection.*
