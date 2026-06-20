# Python-native Playwright MCP Servers Research (2026)

**Agent**: research-python-mcp  
**Date**: 2026-06-19  
**Focus**: Python MCP servers exposing Playwright for AI agents (Grok SDK stack: Python + xai-sdk + Playwright + keyring).  
**Hard requirements evaluated**:
- Real Chrome/Edge via `--remote-debugging-port` (CDP attach) for logged-in profile reuse.
- Auto port selection / fallback.
- Accessibility tree / structured snapshots preferred over screenshots (token efficiency).
- Multi-tab / tab isolation.
- Persistent auth / profile reuse.
- Pure Python or excellent Python bindings (stdio or HTTP MCP).
- Actively maintained 2026 projects only.

## Top Candidates (cloned & inspected)

### 1. souhailmerroun-recyclebin/mcp-browser
- **Stars**: 0 | **Last push**: 2026-06-03 | **Updated**: 2026-06-06
- **Type**: FastMCP Python server + Node persistent CDP daemon.
- **Key strengths**:
  - 30+ `pw_*` tools (goto, click, fill, snapshot, tabs, act, etc.).
  - `pw_snapshot`: compact actionable element map (token-efficient alternative to full DOM).
  - Persistent CDP daemon (`cdp_daemon.js`) holds one `connectOverCDP` and reuses across calls (huge perf win).
  - Strict tab discipline: never hijacks tab 0 (user's active tab); every tool takes `page_index` or `page_url`.
  - `pw_act` for batch multi-step in one round-trip.
  - Designed for autonomous agent fleets doing forms, jobs, profiles.
  - Real Chrome via `--remote-debugging-port=9222` (Arc auto, or manual launch).
- **Weaknesses**:
  - No built-in auto port selection (hardcoded 9222 for browser, 9224 for daemon). Caller must manage.
  - Requires Node runtime alongside Python.
  - Low visibility (0 stars) — very new / niche.
- **Recommended usage snippet** (MCP client config):
  ```json
  {
    "mcpServers": {
      "mcp-browser": {
        "command": "/path/to/venv/bin/python",
        "args": ["-m", "server"],
        "cwd": "/path/to/mcp-browser",
        "env": { "MCP_PLAYWRIGHT_RUNTIME": "/path/to/mcp-browser/playwright-runtime" }
      }
    }
  }
  ```
- **Score for our use case**: **9/10** — closest architectural match for persistent real-browser CDP + snapshot + multi-tab discipline.

### 2. alexrwilliam/playwright-mcp-server
- **Stars**: 5 | **Last push**: 2026-03-11 | **Updated**: 2026-05-09
- **Type**: Full Python FastMCP + Playwright (stdio + HTTP).
- **Key strengths**:
  - Explicit CDP attach: `--cdp-endpoint`, runtime `recreate_context(cdp_endpoint=..., cdp_use_existing_context=True)`.
  - Strong profile support: `--user-data-dir`, `--channel chrome` (real Chrome/Edge).
  - Stealth / anti-detect presets (pixelscan, clearance-safe) + fine-grained fingerprint controls.
  - Response budgeting + artifacts: `--max-response-chars`, overflow to files with previews (excellent token control).
  - Accessibility snapshots with pruning (`get_accessibility_snapshot`), multi-page management (list/switch/close).
  - Stealth hardening auto-applied in headless; init scripts, permission shaping.
  - Token-aware outputs for evaluate, network, snapshots, etc.
- **Weaknesses**:
  - Port management left to caller (pass full endpoint URL).
  - More complex config surface (many flags for stealth/fingerprint).
  - Smaller community signal (5 stars).
- **Recommended usage snippet**:
  ```bash
  playwright-mcp stdio --cdp-endpoint --channel chrome --user-data-dir /path/to/profile
  # or
  playwright-mcp stdio --max-response-chars 6000 --artifact-dir /tmp/artifacts
  ```
  Runtime switch:
  ```python
  recreate_context(cdp_endpoint="http://127.0.0.1:1234/json/version", cdp_use_existing_context=True)
  ```
- **Score for our use case**: **9/10** — best-in-class for CDP + stealth + budgeting + Python. Ideal reference or direct server.

### 3. Ray-0906/Browser_mcp
- **Stars**: 0 | **Last push**: 2025-12 | **Updated**: 2025-12 (some 2026 mentions in broader search)
- **Type**: Python MCP (mcp.server stdio) + optional FastAPI; Playwright backend.
- **Key strengths**:
  - `connect_cdp` + `create_session` with auto-detect of local debug browser (falls back to managed Playwright).
  - Explicit `launch_visible_chrome` helper (spawns Chrome/Edge with `--remote-debugging-port` + user-data-dir).
  - `get_accessibility_tree`, `inspect_elements`, `find_click_targets`, `click_by_text`.
  - Token-safe defaults: screenshots return resource_uri (not always inline base64); truncated content options.
  - Good docs for Windows/macOS/Linux Chrome launch commands.
- **Weaknesses**:
  - Less "pure MCP server" polish than the FastMCP ones.
  - Auto port is manual (you choose port and pass it); no dynamic fallback in code.
  - Older last push relative to 2026 peers.
- **Recommended usage snippet**:
  ```python
  # MCP tool calls
  create_session()  # auto-detects CDP at 9222
  # or
  connect_cdp(cdp_url="http://localhost:9223", create_new_page=True)
  ```
  Launch helper:
  ```python
  launch_visible_chrome(cdp_port=9223, user_data_dir="C:\\temp\\edge-debug", auto_connect=True)
  ```
- **Score for our use case**: **8/10** — excellent for "BYO logged-in browser" + a11y + fallback. Slightly less production-MCP feel.

### 4. ma-pony/mcp-playwright (PyPI: mcp-playwright)
- **Stars**: 10 | **Last push**: 2025-06-03 | **Updated**: 2026-05-07
- **Type**: Pure Python FastMCP server, published on PyPI.
- **Key strengths**:
  - Clean session model: `create_browser_session` / `close_browser_session`, multi-engine.
  - Full Playwright primitives (navigate, click, fill, screenshot, JS, etc.).
  - Easy Claude Desktop / MCP client integration.
  - Good engineering (lifecycle, resources, types).
- **Weaknesses**:
  - Session-based (new browser per session), not designed around attaching to existing user profile via CDP.
  - No prominent CDP / `--remote-debugging-port` or user-data-dir attach in core tools.
  - Screenshots + text extraction rather than strong a11y/snapshot emphasis.
  - Last real code push mid-2025 (maintenance signal weaker for 2026).
- **Recommended usage snippet** (Claude Desktop):
  ```json
  { "mcpServers": { "playwright": { "command": "mcp-playwright" } } }
  ```
- **Score for our use case**: **5/10** — solid Python FastMCP reference, but misses the core "attach to logged-in real browser" requirement.

### Reference (not Python-native server)
- **microsoft/playwright-mcp** (Node, 34k+ stars, very active 2026):
  - Gold standard for accessibility snapshots, multi-tab, persistent profiles (`--user-data-dir`), headed by default, `--extension` for real tabs.
  - Use as spec / inspiration for tool surface and snapshot format.
  - Not suitable as our Python server, but the patterns (snapshot refs, storage state, CDP-friendly) are authoritative.

## Summary Ranking for Our Project (Python + real Chrome CDP + persistent auth + a11y + token efficiency)

1. **souhailmerroun-recyclebin/mcp-browser** (9/10) — Persistent CDP daemon + snapshot + tab discipline. Closest operational match.
2. **alexrwilliam/playwright-mcp-server** (9/10) — Best CDP + stealth + budgeting + Python. Strongest reference impl + usable server.
3. **Ray-0906/Browser_mcp** (8/10) — Great CDP auto-detect + launch helper + a11y. Good for "attach to visible profile".
4. ma-pony (5/10) and official Microsoft (reference only).

## Gaps & Recommendations for Our Grok SDK Integration

- **Port handling**: None of the servers implement robust auto port selection/fallback. Our launcher must:
  - Try 9222, 9223, ... or use OS free port.
  - Launch Chrome/Edge with `--remote-debugging-port=$PORT --user-data-dir=...`.
  - Pass the resulting endpoint to the MCP server.
- **Profile / keyring**: Use keyring (or secure store) to resolve per-user profile paths. Never hardcode secrets. Pass resolved `--user-data-dir` or CDP URL.
- **Multi-tab safety**: Prefer servers that isolate "worker" tabs (souhail's "tab 0 is sacred" rule is excellent). Wrap with our own tab manager if needed.
- **Token efficiency**: Prefer a11y/snapshot tools (`pw_snapshot`, `get_accessibility_tree`, aria) + response budgeting (alexrwilliam artifacts). Default to non-inline screenshots.
- **Hybrid approach**: We can run the best Python MCP server as stdio subprocess from our SDK, or HTTP for isolation. Provide a thin Python client wrapper that handles port discovery, profile resolution, and CDP launch.
- **Stealth**: For high-WAF sites, support CDP attach to real headed profile (max stealth) + presets from alexrwilliam.

## Files Inspected
- mcp-browser/: README, server.py, _cdp.py, cdp_daemon.js, pw_snapshot.py
- playwright-mcp-server/: server.py (CDP attach, budgeting, stealth, multi-page), cdp_patch.py
- browser-mcp-ray/: tools.py (connect_cdp, create_session, get_accessibility_tree), browser_service.py (CDP + launch helper + a11y)
- ma-pony-mcp-playwright/: server.py, browser_manager.py (session model)

All research confined to `./research-agents/python-mcp/`.
