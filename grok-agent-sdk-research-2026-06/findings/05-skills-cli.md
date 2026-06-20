# Skills / CLI Browser Automation Research — Findings (skills-cli agent)

**Date:** 2026-06-19  
**Focus:** Token-efficient CLI + "skills" patterns for AI coding agents (Claude Code, Cursor, Gemini CLI, Codex, etc.), especially Playwright-based, with emphasis on:
- Real Chrome/Edge via `--remote-debugging-port` (CDP) for logged-in profile reuse
- Automatic port selection / fallback
- Accessibility snapshots + element refs (vs screenshots)
- Persistent sessions / profiles / multi-tab
- Ease of calling from Python (our primary stack)

## Executive Summary

The 2026 state-of-the-art for agent browser automation splits into two philosophies:

1. **Fixed concise CLI commands exposed as "skills"** (Microsoft's official `@playwright/cli`, pw-skill, etc.) — tiny skill definitions (~68–850 tokens), command-driven, snapshot + `eN` refs, named sessions, attach to real browsers.
2. **Dynamic codegen skills** (lackeyjb/playwright-skill and Python port) — agent writes full Playwright scripts on demand and executes them. More flexible, higher per-task token cost for the generated code, but minimal fixed schema.

**Strong recommendation for our Grok Agent SDK:**  
Adopt a **CLI/skill layer in addition to (or in front of) raw MCP or direct Playwright**. Use concise CLI commands for the hot path (high-frequency actions inside large code contexts). Use the excellent attach + launch patterns from the community for reliable real-Chrome CDP + auto-port. Provide a thin Python facade that shells out (or wraps) so our Python + xai-sdk agents get the token efficiency without losing control.

---

## 1. microsoft/playwright-cli (official)

- **Repo:** https://github.com/microsoft/playwright-cli
- **Stars:** ~11,225
- **Last push (from search):** 2026-06-10
- **Primary language:** TypeScript (thin wrapper over playwright-core)
- **License:** Apache-2.0
- **Key docs:** README + skills/playwright-cli/ references (session-management, storage-state, etc.)

### Key Strengths (for our use case)
- Explicitly designed for **coding agents** (Claude Code, Copilot, etc.) that prefer CLI+skills over MCP for token efficiency.
- **Token efficiency claim:** Skill definition ~68 tokens vs ~3,500+ for Playwright MCP tools. Page data is never forced into LLM context; agents get compact snapshots with element refs (`e15`, `e21`).
- Full command surface: `open`, `goto`, `click <ref>`, `fill <ref>`, `snapshot`, `screenshot`, `tab-*`, `state-save/load`, `cookie-*`, `route`, `eval`, `tracing`, `video`, etc.
- **Sessions:** `-s=<name>` (or `PLAYWRIGHT_CLI_SESSION`) for isolation. Multi-tab via `tab-list / tab-new / tab-select`.
- **Persistence:** `--persistent` on open or `--profile=...`; `state-save` / `state-load` for cookies + storage.
- **Attach to real browser:** `playwright-cli attach --cdp=chrome` (channel) or `--cdp=http://...` (explicit WS). Supports `--extension`.
- Accessibility snapshots + element refs (Playwright-style).
- Monitoring dashboard: `playwright-cli show`.
- Skills installation: `playwright-cli install --skills` for richer agent context; or skills-less (agent reads `--help`).

### Weaknesses / Gaps
- **No built-in auto-port-fallback launcher** for a dedicated debug profile. You must manage ports yourself or reuse community launch scripts.
- Attaching to the user's **default profile** on Chrome 136+ is fragile (origin gate + `DevToolsActivePort` discovery). Bare `--cdp=chrome` often needs extra `--remote-allow-origins=*` + `chrome://inspect` toggle, or falls back to reading `DevToolsActivePort` manually.
- The actual CLI logic lives in the Playwright monorepo (`playwright/packages/playwright/src/mcp/terminal`); this repo is mostly the thin client + skills packaging.
- Node.js only; we call it from Python via subprocess.

### Recommended Usage Snippet (agent or Python)
```bash
# Launch or reuse a named persistent session (human or agent)
playwright-cli -s=work open https://example.com --persistent

# Look before you act (accessibility snapshot with refs)
playwright-cli -s=work snapshot

# Act with element refs
playwright-cli -s=work click e15
playwright-cli -s=work fill e22 "user@example.com"
playwright-cli -s=work press Enter

# Attach to already-running real Chrome (logged-in profile)
# First ensure remote debugging is enabled in the target browser
playwright-cli attach --cdp=chrome -s=work
# or with explicit endpoint discovered from DevToolsActivePort
playwright-cli attach --cdp="ws://127.0.0.1:55267/devtools/browser/..." -s=work
```

**Score for our use case: 9/10**  
Excellent core model and token story. Needs companion port/attach launcher for production-grade real-Chrome reuse.

---

## 2. cskwork/attach-to-browser-skill + dev-browser

- **Repo:** https://github.com/cskwork/attach-to-browser-skill
- **Stars:** 0 (very new, 2026-06)
- **Last push:** 2026-06
- **Focus:** Safely automate the user's **real, already-logged-in** Chrome/Edge (default profile, SSO/2FA) using either `dev-browser --connect` (primary) or `playwright-cli attach` (fallback).

### Key Strengths
- **Primary path: dev-browser --connect** — auto-discovers the logged-in default profile's `DevToolsActivePort` (port + `/devtools/browser/<GUID>`), builds the full WS URL, falls back to scanning 9222–9229. Avoids the fragile manual steps.
- Bundled **cross-platform launchers** that solve auto-port + reuse correctly:
  - `scripts/launch-debug-chrome.sh` (macOS/Linux)
  - `scripts/launch-debug-chrome.ps1` (Windows)
  - Logic: reuse if profile already serving CDP; scan upward for free port; pinned port errors if taken by non-CDP process; handles `--remote-allow-origins=*`; uses isolated `--user-data-dir` for deterministic dedicated debug profile.
- Excellent safety model: snapshot before every action; user must log in; never submit without explicit approval; prefer least-privilege cleanup.
- Documents the exact Chrome 136+ gotchas and the two reliable attach routes (channel vs explicit WS from `DevToolsActivePort`).

### Weaknesses
- Small / new project (but the patterns are high-quality and directly address our #1 pain point).
- Still Node + external tools (dev-browser, playwright-cli).

### Critical Launch Logic (excerpt from launch-debug-chrome.sh)
```bash
# Reuse if already up on chosen port, else scan for free or reuse existing CDP
# Handles DevToolsActivePort, lsof / Get-NetTCPConnection, setsid / Start-Process
# Prints PORT=... and WS=... then optionally does playwright-cli attach
```

**Score for our use case: 10/10** (for the attach + reliable port/profile part). We should vendor or reimplement the launch logic in Python for our SDK.

---

## 3. lackeyjb/playwright-skill (and Python port)

- **Repo:** https://github.com/lackeyjb/playwright-skill (JS) + https://github.com/akaihola/playwright-py-skill (Python)
- **Stars:** ~2.7k (JS version)
- **Last push:** late 2025 / early 2026
- **Pattern:** Claude Code "Skill" — agent writes custom Playwright code on the fly and executes it via a universal runner (`run.js` or Python `run.py` with PEP 723).

### Key Strengths
- Extremely flexible: any automation, not limited to pre-baked commands.
- Visible browser by default (`headless: false`).
- Progressive disclosure: concise `SKILL.md` + optional full `API_REFERENCE.md`.
- Python-native version exists (akaihola) — uses `uv run` + inline dependency pinning (`playwright==1.57.0`).
- Good for "describe intent → generate + run + screenshot" loops.

### Weaknesses for us
- Generates full scripts (higher token cost for the generated code vs tiny CLI commands).
- Each invocation is more like "write and execute a test" than a tight command loop.
- Still launches fresh browsers by default (headless or headed); attach patterns are not the primary focus (you can add them yourself).
- For persistent logged-in default profile + auto-port, you still need the attach/launch discipline from #2.

**Score for our use case: 6/10**  
Useful as a complementary "full script" escape hatch. Not the primary token-efficient command surface we want for high-frequency agent actions inside large contexts.

---

## 4. doubleg0re/pw-skill

- **Repo:** https://github.com/doubleg0re/pw-skill
- **Stars:** 0
- **Last push:** 2026-04
- **Positioning:** Playwright CLI Skill for Claude Code. Persistent via CDP, named sessions, modular skills (~850 tokens per skill), full flow engine (`pw seq`), extensions (`rary`).

### Notable Ideas
- Explicit comparison table: MCP (~3,500 tokens always loaded) vs pw-skill (~850 per skill, loaded on demand).
- `pw` vs `pwi` (persistent vs one-shot).
- Flow engine + extensions for complex sequences.
- CLI commands usable by both humans and agents.

**Score:** 7/10 — interesting patterns, but less mature / lower visibility than the official CLI.

---

## 5. xicv/browser-automation-skill

- **Repo:** https://github.com/xicv/browser-automation-skill
- **Stars:** 0
- **Active 2026 (Phase 14 shipped recently)**
- Multi-adapter router: chrome-devtools-mcp / playwright-cli / playwright-lib / obscura.
- Heavy investment in caching (per-archetype selector cache, fingerprint rescue, local-VLM rescue), telemetry, audit, oblivious-success detection, MCP server mode.
- Credentials in OS keychain + strict local storage.
- 44 verbs + per-action audit.

**Score:** 7/10 for advanced agent robustness features. The multi-adapter + cache rescue ideas are worth stealing even if we don't adopt the whole thing.

---

## Evaluation Against Our Hard Requirements

| Requirement                        | Official playwright-cli | attach-to-browser + dev-browser launchers | Dynamic skills (lackeyjb) | Notes |
|------------------------------------|-------------------------|-------------------------------------------|---------------------------|-------|
| Real Chrome/Edge + CDP (logged-in profile) | Yes (attach --cdp)     | Excellent (dev-browser auto-discover + launchers) | Possible but not primary | Use attach + launch scripts |
| Auto port selection / fallback     | Manual or external     | Yes (scan, reuse, pinned error)          | Manual                    | Steal the .sh/.ps1 logic |
| Accessibility snapshots + refs     | Yes (snapshot → eN refs) | Yes (snapshotForAI, domCua, cua)        | Depends on generated code | Strong in CLI path |
| Multi-tab                          | Yes (tab-*)            | Yes (listPages / tab-*)                  | Yes (in generated code)   | Good |
| Persistent auth / profile reuse    | --persistent + state-* + attach | Dedicated debug profile + attach to default | State management in code | Combine CLI + launchers |
| Python callable                    | subprocess + thin wrapper | Same + Python port of launch logic      | Direct via uv run         | Easiest path: subprocess to CLI |
| Token efficiency                   | Excellent (~68 token skill) | Same (via playwright-cli)               | Medium (full script)      | CLI wins for hot path |

---

## Concrete Recommendation for Grok Agent SDK (Python)

1. **Primary surface: concise CLI commands (playwright-cli or thin Python equivalent)**
   - Expose a small set of methods: `open`, `goto`, `snapshot`, `click(ref)`, `fill(ref, text)`, `tab_*`, `state_save/load`, etc.
   - Return compact structured output (snapshot YAML/JSON with refs + optional metadata).
   - This keeps context usage low when the agent is also holding large codebases + reasoning.

2. **Real-browser attach + reliable launch**
   - Port/adapt the `launch-debug-chrome.sh` + `.ps1` logic into Python (or call the scripts).
   - Support both:
     - Dedicated debug profile (isolated `--user-data-dir`, auto-port or pinned, deterministic).
     - Attach to user's default logged-in profile (via dev-browser `--connect` if available, or explicit `DevToolsActivePort` discovery + full WS URL).
   - Always require the user to enable remote debugging (or flip the toggle) — never script around it.
   - On Chrome 136+: document `--remote-allow-origins=*` + toggle requirement.

3. **Persistence & multi-session**
   - Named sessions (`-s=...` or env).
   - `--persistent` / `--profile` + `state-save/load`.
   - Multi-tab support exposed.

4. **Hybrid strategy**
   - Default to CLI/skill commands for speed + token efficiency.
   - Offer an escape hatch: "run custom Playwright snippet" that writes a temp script (Python or JS) and executes it (inspired by lackeyjb + akaihola patterns).
   - Optionally expose a Playwright MCP server for long-running exploratory loops where rich introspection outweighs token cost.

5. **Python integration pattern (sketch)**
```python
# pseudo
from grok_browser_cli import BrowserSession

sess = BrowserSession(session="work", persistent=True)
# auto-launches or attaches using the port/profile logic
sess.goto("https://example.com")
snap = sess.snapshot()           # returns structured snapshot + element refs
sess.click("e15")
sess.fill("e22", "user@example.com")
sess.state_save("auth.json")
```

6. **Security / UX**
   - Snapshot before every mutating action.
   - User must log in; never ask for passwords/2FA in the agent.
   - Clear session management (`close`, `kill-all`, `delete-data`).
   - Prefer least-privilege cleanup.

---

## Sources & Further Reading (in this checkout)

- `microsoft-playwright-cli/README.md`
- `microsoft-playwright-cli/skills/playwright-cli/references/session-management.md`
- `microsoft-playwright-cli/skills/playwright-cli/references/storage-state.md`
- `attach-to-browser-skill/SKILL.md`
- `attach-to-browser-skill/reference/dev-browser.md`
- `attach-to-browser-skill/reference/commands.md`
- `attach-to-browser-skill/scripts/launch-debug-chrome.sh` + `.ps1`
- `lackeyjb-playwright-skill/skills/playwright-skill/SKILL.md`

Search results also surfaced `doubleg0re/pw-skill`, `xicv/browser-automation-skill`, and various skill directories (antigravity, mdskills, skilery) that are mostly thin wrappers or marketplaces around the above.

---

## Final Score Summary

- **microsoft/playwright-cli**: 9/10 — the foundation
- **cskwork/attach-to-browser-skill + launchers**: 10/10 — solves the hardest real-world attach/port problems
- **lackeyjb + Python skill**: 6/10 — complementary flexibility
- **doubleg0re/pw-skill**: 7/10 — good ideas, lower maturity
- **xicv/browser-automation-skill**: 7/10 — advanced robustness features worth borrowing

**Overall recommendation: Build a Python SDK that wraps the official CLI command surface + the proven attach/launch patterns.** This gives us the best token efficiency, real-Chrome CDP reuse, auto-port reliability, and human+agent parity while staying easy to call from our Python Grok agents.
