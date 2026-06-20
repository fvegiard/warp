# Alternatives to Playwright MCP for AI Agent Browser Automation (mid-2026)

**Context**: Survey for Grok-powered SDK agent (Python primary) needing:
- Real Chrome/Edge via `--remote-debugging-port` (CDP attach to logged-in profile)
- Port auto-selection / fallback (avoid 9222 conflicts)
- Structured/a11y snapshots preferred over screenshots (token efficiency)
- Multi-tab / isolation support
- Persistent auth / profile reuse (import creds once)
- Pure Python or excellent Python SDK
- Actively maintained in 2026

Inspected (cloned + code/docs review):
- **browser-use** (Python, ~83-95k stars)
- **Skyvern** (Python + TS SDK, ~22k stars)
- **Stagehand** (TS core + Python SDK, ~23k stars)

## Head-to-Head Comparison

| Axis                        | browser-use                                      | Skyvern                                              | Stagehand (Browserbase)                              |
|-----------------------------|--------------------------------------------------|------------------------------------------------------|------------------------------------------------------|
| **Architecture**            | Local-first (Python SDK + MCP stdio/HTTP). Optional cloud. | Hybrid: self-host (Docker+PG) or Skyvern Cloud.     | TS core; Python SDK is client. Strong Browserbase cloud. Local launch supported. |
| **CDP / Real Chrome attach**| Excellent. `cdp_url` + `BrowserSession(..., is_local=True)`. Example `using_cdp.py`. | Strong. `browser_address`, `cdp-connect` mode, header support, local PBS port rewrite, fallbacks. | Good local via chrome-launcher + WS. Cloud via Browserbase contexts. Python uses `connect_over_cdp`. |
| **Port handling**           | Defaults to 9242 to avoid 9222. Profile transient file guards. | Explicit port config + resolution (9222 container vs host-published). | You choose port or let launcher pick; WS poll with timeout. |
| **Profile / Persistent Auth**| `user_data_dir` in BrowserProfile. Defaults `~/.config/browseruse/profiles/default`. Copy existing Chrome profile. | **Browser Profiles** (bp_): first-class. Create from `persist_browser_session=true` run or session. Reuse on workflows/sessions. 2026 MCP/CLI for profiles. | `userDataDir` local + Browserbase `contextId` + `persist` for cloud reuse. Good for multi-agent sharing. |
| **Structured vs Vision**    | `browser_get_state` returns interactive elements (a11y/DOM) + optional screenshot. Vision opt-in. | a11y + computer vision. Strong on dynamic/CAPTCHA. MCP observe for refs. | a11y snapshots + coords under act/observe. CUA paths are vision-heavy. |
| **MCP Surface**             | Dedicated MCP server (stdio via uvx). Tools: navigate/click/type/get_state/extract/screenshot + tabs/sessions + high-level agent. | 75+ tools MCP (sessions, act/extract/observe, tabs/frames, creds, workflows, profiles). Cloud or local. | MCP server is Browserbase-hosted (powered by Stagehand). Stagehand agent() can consume *other* MCPs. |
| **Python Support**          | Native first-class (core lib + CLI + MCP). | Excellent native SDK + CLI + MCP. | Good SDK (async client to remote or local PW bridge). Not full in-process MCP server. |
| **Multi-tab / Isolation**   | Explicit tab mgmt in MCP + SDK. Parallel agents examples. | Sessions + tabs + frames in MCP. Cloud sessions for isolation. | Tab handling + cloud sessions. |
| **Last 2026 Activity**      | Active June 2026 (MCP/CLI/agent work).          | Very active (changelogs, profile/MCP features).     | Active (releases, WebMCP, integrations).            |
| **License / Ops**           | Open core (cloud optional). AGPL considerations for deep embed. | AGPL-3.0. Cloud easiest for profiles/stealth.       | MIT. Cloud (Browserbase) for best persistence/scaling. |
| **Best For**                | Direct Playwright-MCP-like control + attach to existing logged-in Chrome profile + Python. | Persistent auth via profiles + rich MCP + workflows + vision fallback. | Agentic CUA workflows + MCP-as-tools + TS/Python hybrid. |

## Recommendations for Our Use Case

1. **Primary recommendation: browser-use**
   - Closest to "Playwright MCP style" with direct structured control.
   - Easiest path to attach to a real logged-in Chrome profile (`cdp_url` + `user_data_dir`).
   - Native Python + full local MCP server.
   - Excellent port/profile handling.
   - Score: **9.5/10**

2. **Strong complement / alternative: Skyvern**
   - If you need heavy workflow orchestration, credentials vault integration, or cloud-managed stealth + profiles.
   - 75+ MCP tools + browser profiles are production-grade for repeated authenticated tasks.
   - Score: **8.5/10** (slightly heavier for pure "attach to my desktop Chrome" vs browser-use).

3. **Use Stagehand when**:
   - You want computer-use agent (CUA) models (OpenAI/Anthropic).
   - You are okay with Browserbase cloud for auth/context reuse, or are already in a TS-heavy stack.
   - You want to layer external MCP tools *into* the browser agent.
   - Score: **7.5/10** (great engine, but profile attach less direct for "import existing Chrome login" on local).

## Other Mentions (not cloned in depth)
- Several thin browser-use MCP wrappers (Saik0s, kontext-security, JovaniPink, etc.) — mostly HTTP/stdio proxies around browser-use. Use the official one.
- No dominant "puppeteer-mcp" or "selenium-mcp" 2026 projects that matched the structured/a11y + Python + CDP + profile bar as well as the above three.
- Pure testing frameworks (Playwright test, Selenium Grid) were deprioritized unless they had strong agent/MCP/CDP angles (they didn't in 2026 searches).

## Next Steps Suggested
- Prototype with **browser-use** first: launch real Chrome with `--remote-debugging-port=9222` (or their 9242), point `cdp_url`, use `user_data_dir` for a dedicated profile, drive via Python SDK or their MCP.
- Evaluate Skyvern in parallel if workflow/credential management or cloud scaling is needed.
- Consider Stagehand if CUA models or external MCP tool use becomes a requirement.

All artifacts in `./research-agents/alternatives/<name>/findings.md` + source clones.
