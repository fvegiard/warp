# 🚀 GitHub Copilot Cloud Sandbox — Pro Dev Setup Guide
> Based entirely on official GitHub Docs | Copilot Pro+ account | Generated: 2026-06-19T15:24:59.504Z

---

## 📋 TABLE OF CONTENTS
1. What Is the Cloud Sandbox?
2. Prerequisites — What You Need
3. Step 1 — Install Copilot CLI
4. Step 2 — Authenticate
5. Step 3 — Configure Your Environment (Pro Way)
6. Step 4 — Start Your Cloud Sandbox Session
7. Step 5 — Enable Local Sandbox (alternative)
8. Step 6 — Configure the Sandbox
9. Pro Workflows Inside the Sandbox
10. Built-in Agents & Their Powers
11. The Explore → Plan → Code → Commit Loop
12. Multi-Repo Workflows
13. Sandbox Billing — Know Your Costs
14. Settings & Config Files Reference
15. Full Slash Command Reference

---

## 1. 🌩️ What Is the Cloud Sandbox?

Cloud sandboxing runs your Copilot CLI sessions inside **fully isolated, ephemeral Linux environments hosted by GitHub** (built on Azure Container Apps Sandboxes). Every session:

- Is completely isolated from your local machine
- Can be resumed from any device
- Runs commands in the cloud, not on your laptop
- Shares the same policy as Copilot cloud agent
- Saves state on stop (snapshot), fully deleted when you choose

**Session states:**
- 🟢 **Active** — Running, you're interacting with it
- 🟡 **Stopped** — Not running, but state is snapshotted & recoverable
- 🔴 **Deleted** — Gone forever, no recovery

> NOTE: Cloud & local sandboxes are in **public preview** as of 2026.

---

## 2. ✅ Prerequisites — What You Need

| Requirement | Status for you |
|---|---|
| GitHub Copilot Pro+ subscription | ✅ You have this ($39/mo) |
| Node.js 22+ (for npm install) | Install if needed |
| OR Homebrew (macOS/Linux) | |
| OR WinGet + PowerShell v6+ (Windows) | |
| git | Already have it |

---

## 3. 📦 Step 1 — Install Copilot CLI

Pick ONE method for your OS:

### npm (ALL platforms — recommended)
```bash
npm install -g @github/copilot
```

> If you have `ignore-scripts=true` in ~/.npmrc:
```bash
npm_config_ignore_scripts=false npm install -g @github/copilot
```

### Homebrew (macOS / Linux)
```bash
brew install copilot-cli
```

### WinGet (Windows)
```powershell
winget install GitHub.Copilot
```

### Install script (macOS / Linux — one-liner)
```bash
curl -fsSL https://gh.io/copilot-install | bash
```

### Prerelease versions (cutting edge)
```bash
npm install -g @github/copilot@prerelease
brew install copilot-cli@prerelease
winget install GitHub.Copilot.Prerelease
```

### Update existing installation
Same commands as install — they update in place.

---

## 4. 🔑 Step 2 — Authenticate

### Interactive login (easiest)
Start the CLI and run the login command:
```bash
copilot
/login
```
Follow the on-screen browser authentication flow.

### PAT (Personal Access Token) — for automation/CI
1. Go to: github.com/settings/tokens (fine-grained PATs)
2. Resource owner: **your personal account** (NOT an org)
3. Repository access: All repositories (or specific ones)
4. Permissions → Account tab → Add: **Copilot Requests**
5. Generate token
6. Export:
```bash
export COPILOT_GITHUB_TOKEN=your_token_here
# OR
export GH_TOKEN=your_token_here
```

---

## 5. ⚙️ Step 3 — Configure Your Environment (The Pro Way)

### 5a. Create global custom instructions
```bash
mkdir -p ~/.copilot
nano ~/.copilot/copilot-instructions.md
```

Example contents:
```markdown
## My Stack
- Node.js / TypeScript strict mode
- React functional components only (no class components)
- Jest for tests, ESLint + Prettier for style

## Build Commands
- `npm run build` — build
- `npm test` — run all tests
- `npm run lint:fix` — fix linting issues

## Workflow
- Run `npm run lint:fix && npm test` after every change
- Commit messages: Conventional Commits format (feat:, fix:, chore:)
- Feature branches from `main`

## Code Style
- Always add JSDoc for public APIs
- Prefer async/await over .then()
- No console.log in production code
```

### 5b. Create repo-level instructions
In each project repo:
```bash
mkdir -p .github
nano .github/copilot-instructions.md
```

### 5c. Instruction file precedence (highest → lowest)
| File | Scope |
|---|---|
| `.github/copilot-instructions.md` | Repo (overrides global) |
| `.github/instructions/**/*.instructions.md` | Repo (modular) |
| `AGENTS.md` (in git root) | Repo |
| `Copilot.md`, `GEMINI.md`, `CODEX.md` | Repo |
| `~/.copilot/copilot-instructions.md` | Global (all sessions) |

### 5d. Pre-configure allowed tools (avoid approval spam)
```bash
# Allow all git commands, all npm scripts, file writes
copilot --allow-tool='shell(git:*)' --allow-tool='shell(npm run:*)' --allow-tool='write'
```

---

## 6. 🌩️ Step 4 — Start Your Cloud Sandbox Session

### Basic cloud session
```bash
copilot --cloud
```

This launches an interactive session inside a **GitHub-hosted Linux environment**. Commands Copilot runs execute in the cloud, not on your machine.

### Continue the most recent session
```bash
copilot --continue
```

### Resume a specific past session
```bash
copilot --resume
```
(Shows a list of sessions to pick from)

### Start with a specific model
```bash
copilot --cloud --model=claude-opus-4-5
```

### Start with a specific agent
```bash
copilot --cloud --agent=code-review
```

### Start with autopilot (fully autonomous)
```bash
copilot --cloud --yolo
# OR
copilot --cloud --allow-all
```

### Start with a fleet of parallel subagents
```bash
copilot --cloud
/fleet Implement the full authentication system including login, signup, password reset
```

---

## 7. 💻 Step 5 — Enable Local Sandbox (Alternative)

If you want to run locally but sandboxed:
```bash
cd your-project/
copilot
# Inside the session:
/sandbox enable
```

---

## 8. 🔧 Step 6 — Configure the Sandbox

Inside any session, open sandbox settings:
```bash
/sandbox
```

### Filesystem settings
```bash
/sandbox filesystem allow ~/projects/myapp   # Allow path
/sandbox filesystem deny /etc               # Deny path
/sandbox filesystem list                    # View current rules
```

### Network settings
```bash
/sandbox network allow api.example.com      # Allow domain
/sandbox network deny *.ads.com             # Deny domain
/sandbox network list                       # View rules
```

### View all sandbox config
Settings stored at: `~/.copilot/settings.json` under the `sandbox` key.

---

## 9. 🧑‍💻 Pro Workflows Inside the Sandbox

### The golden workflow: Explore → Plan → Code → Commit
```
1. Explore (read-only):
   "Read the auth files but don't write code yet"

2. Plan (Shift+Tab or /plan):
   /plan Implement OAuth2 with Google and GitHub providers

3. Review & approve the plan (Ctrl+Y to edit in your editor)

4. Implement:
   "Proceed with the plan"

5. Verify:
   "Run the tests and fix any failures"

6. Commit:
   "Commit these changes with a descriptive conventional commit message"
```

### Test-driven development (TDD)
```
"Write failing tests for the user registration flow"
[review tests]
"Now implement code to make all tests pass"
[review implementation]
"Commit with message feat: add user registration"
```

### Code review with dual models
```
/review Use Opus 4.5 and Codex 5.2 to review changes in my current branch against main. Focus on potential bugs and security issues.
```

### Delegate long-running tasks to cloud agent
```
/delegate Add dark mode support to the settings page
```
(Creates a PR automatically, you keep working locally)

### Schedule recurring tasks
```
/every 1h Run frontend tests and report any failures
```

---

## 10. 🤖 Built-in Agents & Their Powers

| Agent | Command | Best For |
|---|---|---|
| **Explore** | auto-selected | Quick codebase analysis without polluting main context |
| **Task** | auto-selected | Running tests, builds — brief summary on success, full output on fail |
| **General purpose** | auto-selected | Complex multi-step tasks, full toolset |
| **Code review** | `/agent` → select | Deep review of changes, only real issues |
| **Research** | `/agent` → select | Deep research across codebase, web, repos with citations |
| **Rubber Duck** | auto (background) | Automatic critic — gives Copilot a second opinion on its own plans |
| **Autopilot** | `--yolo` or `--allow-all` | Fully autonomous execution without approvals |
| **Fleet** | `/fleet` | Parallel subagents for speed on large tasks |
| **Chronicle** | `/chronicle` | Insights from session history, standup reports |

### Custom agents (define your own)
```bash
# User-level (all projects):
mkdir -p ~/.copilot/agents
nano ~/.copilot/agents/my-agent.md

# Repo-level:
mkdir -p .github/agents
nano .github/agents/security-reviewer.md
```

Invoke with:
```bash
/agent              # pick from list
# OR inline:
"Use the security-reviewer agent to audit this PR"
```

---

## 11. 🔄 Multi-Repo Workflows

### Option A — Start from parent directory
```bash
cd ~/projects          # parent of all repos
copilot --cloud
# Now Copilot can access ALL child repos
```

### Option B — Add directories during session
```bash
/add-dir /path/to/backend-service
/add-dir /path/to/frontend
/add-dir /path/to/shared-libs
/list-dirs              # view all trusted dirs
```

### Example: Coordinated API change
```
I need to update the auth API across:
- @/projects/api-gateway (routing)
- @/projects/auth-service (core logic)
- @/projects/frontend (client updates)

Start by showing me the current auth flow across all three repos.
```

---

## 12. 💰 Sandbox Billing — Know Your Costs (Pro+ included credits)

| Meter | Unit | Price |
|---|---|---|
| **Compute** | per compute second | $0.000024 |
| **Memory** | per GiB-second | $0.000003 |
| **Storage** | per GiB-month (stopped snapshots) | $0.005 |
| **Local sandbox** | — | **FREE** (included in seat) |

**Cost estimates:**
- 1 hour active cloud session ≈ $0.086 compute + memory
- Snapshot storage for 1GB stopped session ≈ $0.005/month
- **Delete sessions you don't need** to avoid storage costs

**Cost controls:**
- Set budgets at: github.com/settings/billing/budgets
- Monitor at: github.com/settings/billing → AI usage tab

---

## 13. 📁 Config Files Reference

| File | Purpose |
|---|---|
| `~/.copilot/settings.json` | Main settings (model, sandbox, tools, etc.) |
| `~/.copilot/copilot-instructions.md` | Global Copilot instructions |
| `~/.copilot/agents/` | User-level custom agents |
| `~/.copilot/session-state/{id}/` | Session history & snapshots |
| `~/.copilot/mcp-config.json` | MCP server configs |
| `.github/copilot-instructions.md` | Repo-level instructions |
| `.github/agents/` | Repo-level custom agents |
| `.github/instructions/**/*.instructions.md` | Modular repo instructions |
| `AGENTS.md` | Repo agent config (also read by Codex/Claude) |

---

## 14. ⌨️ Full Slash Command Reference

### Session Management
| Command | What it does |
|---|---|
| `/login` | Authenticate with GitHub |
| `/session` | View current session info |
| `/session checkpoints` | List session compaction checkpoints |
| `/session files` | View temp files created this session |
| `/session plan` | View current plan |
| `/resume` | Resume a past session |
| `/new` or `/clear` | Start fresh (reset context) |
| `/compact` | Manually compress conversation history |
| `/feedback` | Submit feedback / bug report to GitHub |

### Code & Tasks
| Command | What it does |
|---|---|
| `/plan [prompt]` | Generate implementation plan before coding |
| `/delegate [prompt]` | Offload task to Copilot cloud agent (async PR) |
| `/fleet [prompt]` | Run task via parallel subagents (faster) |
| `/review` | AI code review of current branch changes |
| `/pr` | Manage pull requests from terminal |
| `/agent` | Switch to a different built-in or custom agent |
| `/model` | Switch AI model mid-session |

### Sandbox
| Command | What it does |
|---|---|
| `/sandbox` | Open sandbox config UI |
| `/sandbox enable` | Enable local sandboxing |
| `/sandbox filesystem allow PATH` | Allow filesystem path |
| `/sandbox filesystem deny PATH` | Deny filesystem path |
| `/sandbox network allow DOMAIN` | Allow network domain |

### Navigation & Context
| Command | What it does |
|---|---|
| `/add-dir /path` | Add trusted directory |
| `/list-dirs` | View trusted directories |
| `/cwd /path` or `/cd /path` | Change working directory |
| `/context` | Visual token usage breakdown |
| `/usage` | Session stats (AI credits, tokens, lines changed) |
| `/settings` | View/edit settings interactively |
| `/settings KEY VALUE` | Set a setting inline |
| `/reset-allowed-tools` | Reset all pre-approved tool permissions |
| `/mcp add` | Add an MCP server |
| `/chronicle` | Session history insights, standup reports |
| `/schedule` / `/every` / `/after` | Schedule recurring or delayed prompts |

### Keyboard Shortcuts
| Shortcut | Action |
|---|---|
| `Shift+Tab` | Toggle plan mode |
| `Ctrl+T` | Toggle reasoning visibility |
| `Ctrl+Y` | Open plan in editor |
| `Ctrl+V` | Paste image into prompt |
| `Ctrl+S` | Save (in config dialogs) |
| `Esc` | Stop current operation / reject tool |
| `!` prefix | Run raw shell command without AI |
| `@path/to/file` | Include file content in prompt |

---

## 15. 🏆 Pro Model Selection Guide

| Model | Use When |
|---|---|
| **Auto** (default) | Reduces rate limiting, picks best model automatically |
| **Claude Opus 4.5/4.7** | Complex architecture, deep reasoning, hard bugs |
| **Claude Sonnet 4.5/4.6** | Day-to-day coding, most routine tasks — fast & cheap |
| **GPT-5.3-Codex / GPT-5.4** | Code generation, code review, second opinion on other models |
| **GPT-5.4 nano** | High-volume quick tasks, lowest cost |

Switch any time mid-session:
```bash
/model
```

---

*Guide compiled from official GitHub Docs — docs.github.com/en/copilot*
*All sections verified against live documentation on Fri Jun 19 2026*
