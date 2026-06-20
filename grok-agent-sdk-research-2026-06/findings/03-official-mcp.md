# Official Microsoft Playwright MCP - Research Findings

**Repo**: microsoft/playwright-mcp  
**Stars**: 34,115 (as of 2026-06-19)  
**Last push / update**: 2026-06-10 (v0.0.76 released; active maintenance confirmed with commits through June 2026)  
**Primary language**: TypeScript / Node.js 18+  
**License**: Apache-2.0  
**Homepage**: https://www.npmjs.com/package/@playwright/mcp  
**Clone location**: ./research-agents/official-mcp/playwright-mcp

## Key Features (from README + source inspection)

- **MCP server** providing browser automation via Playwright for LLMs / agents.
- **Primary interaction model**: Structured accessibility snapshots (browser_snapshot) — token-efficient, no vision models required by default. Screenshots optional via browser_take_screenshot or --caps=vision.
- **MCP protocol support**: stdio (default) + HTTP/SSE standalone server via `--port`.
- **Built-in tools** (core + tabs + more):
  - Navigation: browser_navigate, back/forward/reload.
  - Interaction: click, type, hover, drag, fill_form, select, press_key, handle_dialog.
  - Snapshot & vision: browser_snapshot (preferred, supports depth/boxes), browser_take_screenshot.
  - Tabs: browser_tabs (list / new / close / select) — explicit multi-tab support.
  - Network: browser_network_requests / request (with filtering).
  - Console, evaluate, run_code_unsafe (arbitrary JS in server process — RCE risk, opt-in).
  - Storage: cookies, storage-state save/restore.
  - PDF, tracing, video (some opt-in via caps).
- **Headed / Headless**: Headed by default (visible). Use `--headless` to run headless.
- **Browser selection**: `--browser chrome|firefox|webkit|msedge` (or channel via launchOptions).
- **CDP / connect_over_cdp support**:
  - `--cdp-endpoint <ws://...>`: Connect to existing Chromium/Edge instance started with `--remote-debugging-port`.
  - `--cdp-header`, `--cdp-timeout` (default 30s).
  - `--extension`: Connect via Playwright browser extension to existing tabs (Chrome/Edge).
- **Persistent profile / user-data-dir**:
  - Default: Persistent profile stored in platform cache (`ms-playwright/mcp-{channel}-{workspace-hash}`).
  - `--user-data-dir <path>`: Override for custom / shared logged-in profile.
  - `--isolated`: Fresh in-memory session each time (use with `--storage-state` for initial auth).
  - `--storage-state <path>`: Load cookies/localStorage into isolated context.
  - **Important note**: A persistent profile can only be used by one browser instance at a time. Concurrent sessions on same workspace/profile will conflict — use `--isolated` or distinct `--user-data-dir` for multi-agent.
- **Port handling**: `--port <number>` for standalone SSE/HTTP transport (e.g. 8931). No automatic port selection or fallback logic observed in CLI or docs. User must choose or manage conflicts.
- **Stealth / anti-detection**: No dedicated stealth flags or plugins advertised. Can pass `launchOptions` (args, userAgent, etc.) or `contextOptions` via config/CLI for basic evasion. Relies on standard Playwright.
- **Other config**: `--no-sandbox`, executable path, proxy, viewport, init scripts, allowed/blocked origins, secrets redaction, output-dir, timeouts, snapshot-mode (full/none), etc.
- **Programmatic usage** (Node):
  ```js
  import { createConnection } from '@playwright/mcp';
  const connection = await createConnection({
    browser: {
      browserName: 'chromium',
      userDataDir: '/path/to/profile',  // or omit for default persistent
      launchOptions: { headless: false, channel: 'chrome' },
      cdpEndpoint: 'ws://localhost:9222'  // for attach to existing
    }
  });
  ```
- **Docker**: Official image `mcr.microsoft.com/playwright/mcp` (headless Chromium only in container examples). Supports `--port`, `--no-sandbox`, etc.
- **Security note**: Not a security boundary. Use client-level permissions, secrets file, allowed origins, etc.

## Multi-tab / Multi-agent / Isolation

- Dedicated `browser_tabs` tool for tab management within one browser context.
- Persistent profile warning: "A persistent profile can only be used by one browser instance at a time".
- For parallel agents: `--isolated` + `--storage-state`, or separate `--user-data-dir` per agent/session.
- No built-in tab isolation primitives beyond standard browser contexts/tabs; isolation is via profile or isolated mode.
- Recent activity (2026) includes ongoing releases, registry publishing, config/schema updates — actively maintained.

## Python Support & Integration for Grok Agent SDK

- **No native Python package**. The server is Node.js (npx @playwright/mcp or local install).
- Integration paths for Python + xai-sdk + Playwright stack:
  1. Run MCP server as subprocess / sidecar (stdio or HTTP on fixed port) and use a Python MCP client library (e.g. mcp or custom SSE client).
  2. For tighter control: Use Python `playwright` directly with `browser_type.connect_over_cdp("http://localhost:9222")` or `launch_persistent_context(user_data_dir=...)` — bypassing MCP entirely for document/vision RAG flows.
  3. Hybrid: Use MCP for high-level agentic loops (snapshot-driven), fall back to direct Playwright for performance-critical or Python-native steps.
- MCP shines for "persistent state + rich introspection + iterative reasoning" per official docs; for high-throughput coding agents they recommend Playwright CLI + SKILLS instead (lower token overhead).

## Suitability for Our Use Case (Grok-powered SDK, 2026)

**Requirements match**:
- ✅ Real Chrome/Edge via --remote-debugging-port / CDP (`--cdp-endpoint`).
- ✅ Persistent auth / profile reuse (`--user-data-dir`, default persistent, storage-state, extension).
- ✅ Accessibility snapshots primary (token-efficient, Playwright MCP style).
- ✅ Multi-tab support (`browser_tabs`).
- ⚠️ Automatic port selection/fallback: Not built-in for the MCP server port. Manage manually or wrap launcher.
- ⚠️ Python-native: Indirect (subprocess/HTTP + MCP client or direct Playwright Python).
- ✅ Actively maintained 2026 project.

**Pros**:
- Official Microsoft project, high quality, 34k+ stars, frequent updates.
- Excellent snapshot-first design — ideal for agent document processing / web research without vision bloat.
- Strong CDP + persistent profile support for "attach once, stay logged in".
- Tab management and network/console tools useful for RAG/auth flows.
- Config file + env var support for reproducible setups.
- Docker image available.

**Cons / Gaps**:
- Node.js server; adds process/bridge complexity in pure-Python Grok SDK.
- No auto-port fallback (risk of 9222/8931 collisions; must implement selection/wrapper).
- No dedicated stealth/anti-bot toolkit (pass raw launch args if needed).
- Persistent profile concurrency limit — plan isolation strategy for multi-session agents.
- `run_code_unsafe` is powerful but dangerous; avoid in untrusted setups.
- For pure Python control, direct Playwright Python + connect_over_cdp may be simpler/faster than full MCP.

## Recommended Flags / Setup for Persistent Logged-in Chrome Sessions (No Re-login)

**Preferred for real logged-in profile (attach to user's Chrome)**:
1. Launch Chrome/Edge with debugging:
   ```
   chrome.exe --remote-debugging-port=9222 --user-data-dir="C:\Users\you\AppData\Local\Google\Chrome\User Data\Default"
   ```
   (Use port 0 for OS-assigned, then read the port from DevToolsActivePort.)

2. Start MCP pointing at it:
   ```
   npx @playwright/mcp@latest --cdp-endpoint ws://localhost:9222 --browser chrome
   ```
   Or in MCP client config:
   ```json
   {
     "mcpServers": {
       "playwright": {
         "command": "npx",
         "args": ["@playwright/mcp@latest", "--cdp-endpoint", "ws://localhost:9222"]
       }
     }
   }
   ```

**For MCP-managed persistent profile (MCP handles login state)**:
```
npx @playwright/mcp@latest --user-data-dir "C:\path\to\my-mcp-profile" --browser chrome
```
- First run: log in manually (headed).
- Subsequent runs: state persists.
- Override default location per workspace.

**For isolated + pre-auth**:
```
npx @playwright/mcp@latest --isolated --storage-state auth.json
```

**Headless example**:
```
npx @playwright/mcp@latest --headless --browser chrome
```

**Standalone server (for IDE workers / no display)**:
```
npx @playwright/mcp@latest --port 8931 --headless
```
Then connect client to `http://localhost:8931/mcp`.

**Config file** for complex setups (CDP headers, launch args, etc.):
```
npx @playwright/mcp@latest --config path/to/config.json
```

**Python bridge sketch** (high-level):
- Spawn the above command.
- Use Python MCP client (stdio or SSE) to call tools like `browser_snapshot`, `browser_tabs`, `browser_navigate`.
- For vision RAG: optionally `--caps=vision` or direct screenshots + your own vision pipeline.
- For performance: consider direct `from playwright.sync_api import sync_playwright; p.chromium.connect_over_cdp(...)` for critical paths.

## Score for Our Use Case (Grok Agent SDK + Python + real Chrome + snapshots + persistent auth)

**8 / 10**

Excellent match on core needs (CDP attach, persistent profiles, snapshots, tabs, 2026 maintenance). Main deductions for lack of native Python and missing auto-port fallback (both solvable with small wrappers). Strong official choice; pair with direct Playwright Python where MCP overhead is undesirable.

## Sources
- GitHub: https://github.com/microsoft/playwright-mcp (cloned & inspected)
- Official docs & README (extracted 2026-06)
- npm package + playwright-core bundled MCP implementation
- Recent commits/PRs (June 2026 releases, registry publish, config updates)
- Cross-referenced with Playwright main repo for CDP/profile primitives.

---
*Research agent: research-official-mcp (child). Date: 2026-06-19.*
