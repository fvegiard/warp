# Multi-Agent / Concurrent Browser MCP Research Findings (2026)

**Agent:** research-multi-agent  
**Date:** 2026-06-19  
**Focus:** Playwright MCP solutions enabling multiple AI agents (Claude, Cursor, etc.) to share ONE real Chrome profile (cookies, logins via `--remote-debugging-port` / `connectOverCDP`) while providing tab isolation.

## Top Recommendations

### 1. ultimate-playwright-mcp (pm990320/ultimate-playwright-mcp) — **Best Match** (Score: 9/10)
- **Stars:** ~3 (npm 177 weekly), **Last update:** 2026-04 (active npm 0.2.1 Apr 3 2026)
- **Key Strengths:**
  - Connects to real Chrome via CDP (`--remote-debugging-port=9222` + `--user-data-dir`).
  - **Single shared BrowserContext**: All agents share cookies/logins (log in once).
  - **Tab isolation via `targetId`** (per-tab) + `groupId` (per-agent tab groups).
  - `browser_snapshot` uses accessibility tree (aria + role refs `e1/e2...` style, Playwright `_snapshotForAI` + `ariaSnapshot`).
  - Persistent tab-group registry (`~/.ultimate-playwright-mcp/tab-groups.json`).
  - Companion Chrome extension for visual tab groups (optional).
  - Tools: `browser_tabs` (with `targetId`/`groupId`), `browser_navigate`, `browser_snapshot`, `browser_click` etc., `browser_tab_group`.
  - MCP stdio (works with Claude Desktop, Cursor, any MCP client). Python can drive via MCP client or subprocess.
- **Weaknesses:**
  - Small community / low stars.
  - Requires user to launch Chrome with CDP + non-default profile (Chrome 136+ ignores on default profile).
  - No built-in auto-port fallback (user or wrapper handles port selection).
  - Tab groups persist across restarts but visual groups need extension.
- **Recommended Usage Snippet (MCP config for Cursor/Claude):**
  ```json
  {
    "mcpServers": {
      "ultimate-playwright": {
        "command": "npx",
        "args": ["ultimate-playwright-mcp", "--cdp-endpoint", "http://localhost:9222"]
      }
    }
  }
  ```
  Launch Chrome first:
  ```
  chrome.exe --remote-debugging-port=9222 --user-data-dir=C:\temp\chrome-debug
  ```
  Agent flow: `browser_tab_group({action:"create", name:"agent-A"})` → `browser_tabs({action:"new", groupId})` → get `targetId` → pass `targetId` to all subsequent tools.
- **Fit for our needs:** Excellent. One real profile, many agents, tab isolation, accessibility snapshots, persistent auth.

### 2. playwright-mcp-tabbed (songofhawk/playwright-mcp-tabbed) — **Strong Alternative** (Score: 8/10)
- **Stars:** 0 (new Mar/Apr 2026), **Last update:** 2026-04
- **Key Strengths:**
  - Explicit `tab_index` or stable `tab_id` on nearly every tool for concurrent agents.
  - **One shared browser context** → shared logins/cookies.
  - `browser_snapshot` (accessibility tree with `root_selector` + `max_chars` for token efficiency).
  - Includes "Agent Skill" for multi-tab orchestration (main agent creates tabs, assigns `tab_id` to sub-agents).
  - Tools mirror official Playwright MCP naming.
  - Designed for deterministic parallel agent behavior (Cursor/Claude Code).
- **Weaknesses:**
  - Very low visibility/stars.
  - Uses Playwright directly (launches or manages context); CDP attach to pre-existing logged-in Chrome is less emphasized than ultimate.
  - No groupId abstraction; relies on explicit index/id routing.
  - No auto-port logic shown.
- **Recommended Usage:** Add as MCP server. Main agent does `browser_tabs({action:"new"})` to get `tab_id`, passes to sub-agents. Prefer `tab_id` over index to avoid races.
- **Fit:** Very good for shared context + tab targeting. Slightly less "attach to my real Chrome" focus than ultimate.

### 3. playwright-mcp-orchestrator (mediar-ai/playwright-mcp-orchestrator) — **Conceptual Strong** (Score: 7/10)
- **Stars:** 9, **Last update:** 2026-03 (early dev, last push mid-Mar)
- **Key Strengths:**
  - Explicitly targets the exact problem: multiple agents, **one Chrome** (`--remote-debugging-port`), **shared profile**, tab isolation.
  - Delegates to official `@playwright/mcp` (inherits all official tools/updates).
  - Validates `connectOverCDP` multiple times to same browser works; each gets own tabs.
  - Good docs on Chrome setup, profile copy, and why alternatives fail.
- **Weaknesses:**
  - Very early / minimal code in repo (mostly architecture README).
  - Not a full standalone server yet; more of a research/orchestration layer.
  - No concrete tabId/groupId implementation visible in the clone.
  - Low maintenance signal after initial push.
- **Fit:** Great vision. Monitor for progress; if it matures it could be ideal (reuse official MCP + add routing).

## Other Inspected Repos (Lower Fit)

- **filhocf/multi-playwright-mcp** (and forks): `sessionId` param → spawns separate inner `@playwright/mcp` instances, each with own Chromium. Supports `PLAYWRIGHT_USER_DATA_DIR` for per-session persistent profiles. **Not shared single browser** — multiple processes. Score: 4/10 (good isolation, poor for "one real profile, no repeated logins").
- **Mokecy/playwright-mcp-parallel**: `browser_connect` to real Chrome CDP to extract auth, then `instance_create` clones cookies/localStorage into new isolated Chromiums. Uses `page_*` prefixed tools + `instanceId`. Auth cloning, not live shared context. Score: 5/10 (auth reuse works, but separate instances).
- **sailaoda/concurrent-browser-mcp**: Multi-instance manager (`browser_create_instance`). Focus on concurrency + cleanup. Tools include screenshots + `browser_get_markdown`; less emphasis on accessibility tree or CDP attach to golden profile. Score: 3/10.
- **martin-lzh/playwright-mcp-parallel** (fork): Adds `instanceId` + create/list/close tools on top of Playwright. Similar to above.

## Key Technical Patterns Extracted (2026)

1. **Isolation Mechanisms:**
   - `targetId` (unique per tab, returned by `browser_tabs({action:"new"})`).
   - `groupId` / tab groups (logical scoping per agent while sharing BrowserContext).
   - `tab_index` / `tab_id` (per-tool parameter; routes without shared "current tab" race).
   - `sessionId` (spawns fully separate browser instances — stronger isolation, weaker sharing).

2. **CDP / Real Profile Sharing:**
   - Launch: `chrome --remote-debugging-port=9222 --user-data-dir=/path/to/golden-profile` (non-default dir required on Chrome 136+).
   - Connect: `chromium.connectOverCDP('http://localhost:9222')` (or ws endpoint).
   - Multiple Playwright connections can share the same `BrowserContext` (cookies, storage, logins).
   - Chrome only allows one debugger per tab → tab-per-agent or careful routing.

3. **Accessibility / Snapshots (token-efficient):**
   - `browser_snapshot` → aria tree or Playwright role/aria snapshots with element refs (e1, ax1, aria-ref=...).
   - Prefer over `browser_take_screenshot`.
   - Some servers support `root_selector` + `max_chars` to limit payload.

4. **Port Handling:**
   - None of the inspected projects implement automatic port selection/fallback inside the MCP server.
   - Expect user/wrapper to pick free port, start Chrome with it, and pass `--cdp-endpoint` or equivalent.
   - Official Playwright MCP has some `--cdp` attach support in CLI (merged 2026).

5. **Persistent Auth:**
   - Golden `/user-data-dir` copied or reused.
   - For multi-instance wrappers: export cookies/localStorage from connected Chrome, inject into new contexts.
   - Tab-grouped single-context approaches (ultimate, tabbed) keep auth naturally shared.

6. **Python Usability:**
   - All are MCP servers (stdio or SSE/HTTP).
   - Python agents can use `mcp` client SDKs, `subprocess` + stdio, or HTTP clients.
   - Tool surface is the contract — no native Python Playwright needed for the MCP path.

## Official Upstream Notes (Microsoft Playwright / playwright-mcp)
- PR #39703 (Mar 2026): Proposed `tabId` for multi-agent tab isolation in core MCP tools. Closed by maintainers ("give it two browsers").
- PR #1535 / #1478: Merged multi-tab support over single connection for extension bridge (protocol v2, tabId routing, multi-client HTTP Streamable).
- Issues #893, #1294, #1594: Community reports of parallel Claude agents fighting over tabs; profile lock contention.
- Recommendation from maintainers: run multiple MCP servers or use isolated profiles. Community responded with the forks above.
- Chrome M144+ remote debugging via `chrome://inspect` has partial support gaps in `connectOverCDP`.

## Summary Recommendation for Our Project (Python + xai-sdk + real logged-in Chrome)
- **Primary:** `ultimate-playwright-mcp` — closest to "one real browser, many agent sessions, accessibility snapshots, persistent shared profile".
- **Secondary:** `playwright-mcp-tabbed` — clean tab routing + shared context.
- **Watch:** `playwright-mcp-orchestrator` if it gains traction (leverages official MCP).
- **Avoid for our constraints:** Pure multi-instance wrappers that launch separate Chromiums (lose single-profile live sharing).
- **Port/Profile Strategy:** Launch Chrome externally with chosen port + golden profile (script with fallback port logic). Pass endpoint to MCP. Use tab targeting/grouping for agents.
- **Next Steps for Team:** 
  - Prototype with ultimate-playwright-mcp against a logged-in profile.
  - Wrap port selection + Chrome launch in a small Python helper if needed.
  - Evaluate token usage of accessibility snapshots vs screenshots in real agent loops.
  - Check Python MCP client compatibility (stdio transport).

All clones are under `./research-agents/multi-agent/`. Full READMEs and key source (cdp.ts, pw-session.ts, tab-groups.ts, etc.) inspected for CDP, targetId, context sharing, and snapshot code.
