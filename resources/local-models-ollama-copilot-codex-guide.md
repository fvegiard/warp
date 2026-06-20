# 🦙 Local Models + Ollama with GitHub Copilot CLI & OpenAI Codex CLI
## The Complete Pro Dev Guide
> Compiled from official GitHub Docs + OpenAI Codex Docs | 2026-06-19T16:25:41.264Z
> Covers: BYOK / Bring Your Own Key, Ollama, OSS mode, offline mode, provider config

---

## 📋 TABLE OF CONTENTS
1. How It All Works (Architecture)
2. Installing Ollama
3. Pulling the Right Models for Coding
4. GitHub Copilot CLI + Ollama (BYOK)
5. Persisting Ollama as Default in Copilot CLI
6. OpenAI Codex CLI + Ollama (OSS mode)
7. Codex CLI config.toml — Full Provider Setup
8. Profiles — Switch Between Ollama / OpenAI / Codex
9. Offline Mode (Air-gapped)
10. Model Requirements & Best Local Models
11. Troubleshooting
12. Full Environment Variable Reference

---

## 1. 🏗️ How It All Works

There are TWO separate CLI tools — each can use Ollama:

| Tool | Who makes it | Config file | Key flag |
|---|---|---|---|
| **GitHub Copilot CLI** | GitHub/Microsoft | env vars | `COPILOT_PROVIDER_BASE_URL` |
| **OpenAI Codex CLI** | OpenAI | `~/.codex/config.toml` | `--oss` or `model_provider` |

Both use Ollama's OpenAI-compatible API at `http://localhost:11434/v1`.
Ollama speaks the OpenAI Chat Completions format — so either tool can talk to it natively.

### Critical model requirements (BOTH tools):
- ✅ Must support **tool calling** (function calling)
- ✅ Must support **streaming**
- ✅ Recommended: **128k+ token context window**
- ❌ Models without tool calling will return an error

---

## 2. 📦 Installing Ollama

### macOS
```bash
brew install ollama
# OR download from ollama.com
```

### Linux
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

### Windows
Download from: https://ollama.com/download/windows

### Start Ollama server
```bash
ollama serve
# Server runs at http://localhost:11434
# Verify: curl http://localhost:11434/api/tags
```

---

## 3. 🧠 Pulling the Right Models for Coding

Not all Ollama models support tool calling. Use these proven ones:

### Best models for Copilot CLI / Codex CLI (tool calling + coding):

```bash
# Best overall for coding + tool calling (128k context)
ollama pull qwen2.5-coder:32b

# Lighter/faster variant
ollama pull qwen2.5-coder:14b
ollama pull qwen2.5-coder:7b

# Meta Llama 3.1 — solid tool calling
ollama pull llama3.1:70b
ollama pull llama3.1:8b

# DeepSeek Coder — excellent at code
ollama pull deepseek-coder-v2:16b

# Mistral with tool support
ollama pull mistral-nemo

# Phi-4 (Microsoft, compact but powerful)
ollama pull phi4

# Command-R (Cohere, strong tool use)
ollama pull command-r
```

### Verify a model supports tool calling
```bash
# Check model info
ollama show qwen2.5-coder:32b --modelfile | grep -i tool
# OR just try it — both CLIs will return an error if tools unsupported
```

### List your pulled models
```bash
ollama list
```

---

## 4. 🔗 GitHub Copilot CLI + Ollama (BYOK)

Official docs: docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/use-byok-models

### Method A — Environment variables (per session)

```bash
# Point Copilot CLI at your local Ollama
export COPILOT_PROVIDER_BASE_URL=http://localhost:11434
export COPILOT_MODEL=qwen2.5-coder:32b

# No API key needed for local Ollama
# COPILOT_PROVIDER_API_KEY is NOT required for localhost

# Launch (local)
copilot

# Launch (cloud sandbox with local model backend)
# NOTE: --cloud uses GitHub infra but model calls route to your URL
copilot --cloud
```

### Method B — OpenAI-compatible endpoint (Ollama uses /v1 path)

```bash
export COPILOT_PROVIDER_BASE_URL=http://localhost:11434/v1
export COPILOT_PROVIDER_TYPE=openai   # default, can omit
export COPILOT_MODEL=qwen2.5-coder:14b
copilot
```

> 💡 Tip: Ollama accepts BOTH `http://localhost:11434` and `http://localhost:11434/v1`

### All supported providers in Copilot CLI:

| Provider type | Services |
|---|---|
| `openai` (default) | OpenAI, **Ollama**, vLLM, Foundry Local, any OpenAI-compat endpoint |
| `azure` | Azure OpenAI Service |
| `anthropic` | Anthropic Claude models |

### Method C — Full offline mode (no GitHub servers at all)
```bash
export COPILOT_PROVIDER_BASE_URL=http://localhost:11434
export COPILOT_MODEL=qwen2.5-coder:32b
export COPILOT_OFFLINE=true   # disables ALL GitHub server contact
copilot
```
> ⚠️ Offline mode only truly air-gaps if your provider is local. Remote base URLs still send data over the network.

### Connecting to remote OpenAI (for comparison)
```bash
export COPILOT_PROVIDER_BASE_URL=https://api.openai.com/v1
export COPILOT_PROVIDER_API_KEY=sk-your-openai-key
export COPILOT_MODEL=gpt-5.5
copilot
```

### Azure OpenAI
```bash
export COPILOT_PROVIDER_BASE_URL=https://YOUR-RESOURCE.openai.azure.com/openai/deployments/YOUR-DEPLOYMENT
export COPILOT_PROVIDER_TYPE=azure
export COPILOT_PROVIDER_API_KEY=your-azure-api-key
export COPILOT_MODEL=YOUR-DEPLOYMENT-NAME
copilot
```

### Anthropic Claude (your own API key)
```bash
export COPILOT_PROVIDER_TYPE=anthropic
export COPILOT_PROVIDER_BASE_URL=https://api.anthropic.com
export COPILOT_PROVIDER_API_KEY=sk-ant-your-key
export COPILOT_MODEL=claude-opus-4-5
copilot
```

---

## 5. 💾 Persisting Ollama as Default in Copilot CLI

Add to your shell profile (~/.zshrc, ~/.bashrc, ~/.profile):

```bash
# ~/.zshrc or ~/.bashrc
# --- GitHub Copilot CLI — Local Ollama Default ---
export COPILOT_PROVIDER_BASE_URL=http://localhost:11434
export COPILOT_MODEL=qwen2.5-coder:32b

# Optional: alias to quickly switch models
alias copilot-local='COPILOT_PROVIDER_BASE_URL=http://localhost:11434 COPILOT_MODEL=qwen2.5-coder:32b copilot'
alias copilot-openai='COPILOT_PROVIDER_BASE_URL=https://api.openai.com/v1 COPILOT_PROVIDER_API_KEY=$OPENAI_API_KEY COPILOT_MODEL=gpt-5.5 copilot'
alias copilot-codex='COPILOT_PROVIDER_BASE_URL=https://api.openai.com/v1 COPILOT_PROVIDER_API_KEY=$OPENAI_API_KEY COPILOT_MODEL=gpt-5.3-codex-spark copilot'
```

Reload:
```bash
source ~/.zshrc
```

---

## 6. 🤖 OpenAI Codex CLI + Ollama (OSS Mode)

Official docs: developers.openai.com/codex/config-advanced

### Install Codex CLI
```bash
# macOS/Linux (standalone)
curl -fsSL https://chatgpt.com/codex/install.sh | sh

# npm
npm install -g @openai/codex

# Homebrew
brew install codex
```

### Method A — --oss flag (quickest)

The `--oss` flag tells Codex to use the built-in Ollama provider automatically:
```bash
# Validates Ollama is running, uses default oss_provider from config
codex --oss

# With a specific model
codex --oss --model qwen2.5-coder:32b

# Non-interactive (scripted)
codex exec --oss --model qwen2.5-coder:32b "Fix all TypeScript errors in this repo"
```

### Method B — config.toml provider setup (persistent)

Edit `~/.codex/config.toml`:
```toml
# Default model to use
model = "qwen2.5-coder:32b"

# Set default OSS provider
oss_provider = "ollama"   # or "lmstudio"

# Use Ollama as the active provider
model_provider = "local_ollama"

[model_providers.local_ollama]
name = "Ollama (local)"
base_url = "http://localhost:11434/v1"
# No env_key needed for local Ollama (no auth required)
```

Then just run:
```bash
codex
# or
codex --oss
```

### Method C — Multiple providers in config.toml

```toml
# ~/.codex/config.toml

# Default: use Ollama locally
model = "qwen2.5-coder:32b"
model_provider = "local_ollama"
oss_provider = "ollama"

# --- Provider definitions ---
[model_providers.local_ollama]
name = "Ollama (local)"
base_url = "http://localhost:11434/v1"

[model_providers.lmstudio]
name = "LM Studio (local)"
base_url = "http://localhost:1234/v1"
# No auth needed for local LM Studio

[model_providers.openai_direct]
name = "OpenAI (my key)"
base_url = "https://api.openai.com/v1"
env_key = "OPENAI_API_KEY"   # reads from env var

[model_providers.proxy]
name = "LLM Proxy"
base_url = "http://proxy.example.com/v1"
env_key = "OPENAI_API_KEY"

[model_providers.azure]
name = "Azure OpenAI"
base_url = "https://YOUR_PROJECT.openai.azure.com/openai"
env_key = "AZURE_OPENAI_API_KEY"
query_params = { api-version = "2025-04-01-preview" }
wire_api = "responses"

[model_providers.anthropic_direct]
name = "Anthropic (my key)"
base_url = "https://api.anthropic.com"
env_key = "ANTHROPIC_API_KEY"
```

### Override provider per run (no config change)
```bash
# Use specific model from Ollama
codex -c model_provider='"local_ollama"' -m qwen2.5-coder:14b

# Use OpenAI for this run only
codex -c model_provider='"openai_direct"' -m gpt-5.5

# Using env var override at runtime
OPENAI_API_KEY=sk-xxx codex --model gpt-5.5 -c model_provider='"openai_direct"'
```

---

## 7. 📄 Codex CLI config.toml — Full Pro Setup

```toml
# ~/.codex/config.toml
# Complete pro dev setup with Ollama as default + fallbacks

# ── Model defaults ──────────────────────────────────────────
model = "qwen2.5-coder:32b"
model_provider = "local_ollama"
oss_provider = "ollama"
model_reasoning_effort = "high"      # none | low | medium | high | xhigh
personality = "pragmatic"            # friendly | pragmatic | none

# ── Approval & Sandbox ──────────────────────────────────────
approval_policy = "on-request"       # untrusted | on-request | never
sandbox_mode = "workspace-write"     # read-only | workspace-write | danger-full-access

# ── Web search ──────────────────────────────────────────────
web_search = "cached"                # cached | live | disabled

# ── TUI ─────────────────────────────────────────────────────
[tui]
animations = true
notifications = true
notification_method = "auto"         # auto | osc9 | bel
alternate_screen = true

# ── Shell environment passthrough ───────────────────────────
[shell_environment_policy]
inherit = "core"                     # none | core
include_only = ["PATH", "HOME", "VIRTUAL_ENV", "NODE_ENV"]

# ── Features ────────────────────────────────────────────────
[features]
shell_snapshot = true
multi_agent = true
memories = false
unified_exec = true
undo = true

# ── Provider definitions ─────────────────────────────────────
[model_providers.local_ollama]
name = "Ollama (local)"
base_url = "http://localhost:11434/v1"

[model_providers.lmstudio]
name = "LM Studio"
base_url = "http://localhost:1234/v1"

[model_providers.openai_direct]
name = "OpenAI (direct)"
base_url = "https://api.openai.com/v1"
env_key = "OPENAI_API_KEY"

[model_providers.anthropic_direct]
name = "Anthropic Claude"
base_url = "https://api.anthropic.com"
env_key = "ANTHROPIC_API_KEY"

# ── Sandbox network config ───────────────────────────────────
[sandbox_workspace_write]
network_access = false               # true to allow outbound
exclude_tmpdir_env_var = false
exclude_slash_tmp = false
```

---

## 8. 🎛️ Profiles — Switch Between Ollama / OpenAI / Codex

Create named profile files in ~/.codex/:

### ~/.codex/ollama.config.toml
```toml
model = "qwen2.5-coder:32b"
model_provider = "local_ollama"
model_reasoning_effort = "high"
approval_policy = "on-request"
```

### ~/.codex/openai.config.toml
```toml
model = "gpt-5.5"
model_provider = "openai_direct"
model_reasoning_effort = "high"
approval_policy = "on-request"
```

### ~/.codex/fast.config.toml
```toml
model = "qwen2.5-coder:7b"
model_provider = "local_ollama"
model_reasoning_effort = "low"
approval_policy = "never"
sandbox_mode = "workspace-write"
```

### ~/.codex/review.config.toml
```toml
model = "gpt-5.5"
model_provider = "openai_direct"
model_reasoning_effort = "xhigh"
approval_policy = "on-request"
```

### Use profiles
```bash
codex --profile ollama                    # use local Ollama
codex --profile openai                    # use OpenAI API
codex --profile fast                      # fast local model, no prompts
codex --profile review "review this PR"  # deep code review
```

### Shell aliases for fast switching
```bash
# ~/.zshrc
alias cx='codex --profile ollama'
alias cx-fast='codex --profile fast'
alias cx-review='codex --profile review'
alias cx-openai='codex --profile openai'
alias cx-exec='codex exec --profile ollama'
```

---

## 9. ✈️ Offline Mode

### Copilot CLI — full offline
```bash
export COPILOT_PROVIDER_BASE_URL=http://localhost:11434
export COPILOT_MODEL=qwen2.5-coder:32b
export COPILOT_OFFLINE=true
copilot
```

### Codex CLI — offline/local-only
Codex CLI doesn't have a single OFFLINE flag but you achieve it by:
1. Using a local provider (Ollama)
2. Setting `sandbox_mode = "workspace-write"` with `network_access = false`
3. Disabling web search: `web_search = "disabled"`
4. Disabling analytics: `[analytics] enabled = false`

```toml
# ~/.codex/offline.config.toml
model = "qwen2.5-coder:32b"
model_provider = "local_ollama"
web_search = "disabled"

[sandbox_workspace_write]
network_access = false

[analytics]
enabled = false
```
```bash
codex --profile offline
```

---

## 10. 🏆 Model Requirements & Best Local Models

### Hard requirements (both CLIs will error without these):
| Requirement | Why |
|---|---|
| **Tool calling / function calling** | Both CLIs use tools to read/write files, run shell commands |
| **Streaming** | Required for real-time TUI output |
| **128k+ context** recommended | Large codebases need big context windows |

### Recommended Ollama models for coding (ranked):

| Model | Size | Tool calling | Context | Best for |
|---|---|---|---|---|
| `qwen2.5-coder:32b` | ~20GB | ✅ | 128k | Best all-around coding agent |
| `qwen2.5-coder:14b` | ~9GB | ✅ | 128k | Great balance speed/quality |
| `llama3.1:70b` | ~40GB | ✅ | 128k | Strong reasoning + code |
| `llama3.1:8b` | ~5GB | ✅ | 128k | Fast, good for simple tasks |
| `deepseek-coder-v2:16b` | ~10GB | ✅ | 128k | Excellent code generation |
| `qwen2.5-coder:7b` | ~4.5GB | ✅ | 128k | Fastest local option |
| `phi4` | ~9GB | ✅ | 16k | Compact Microsoft model |
| `mistral-nemo` | ~7GB | ✅ | 128k | Good tool calling |

### ❌ Models that DON'T work (no tool calling):
- llama2 (all versions)
- codellama (most versions)
- stable-code
- starcoder (most versions)

---

## 11. 🔧 Troubleshooting

### "Model does not support tool calling"
```bash
# Switch to a model with tool support
ollama pull qwen2.5-coder:14b
export COPILOT_MODEL=qwen2.5-coder:14b
# OR for Codex:
codex --oss --model qwen2.5-coder:14b
```

### "Connection refused" / Ollama not running
```bash
# Start Ollama
ollama serve
# Verify it's up
curl http://localhost:11434/api/tags
```

### Copilot CLI doctor
```bash
copilot help providers   # see all provider examples
```

### Codex CLI doctor
```bash
codex doctor             # full diagnostic report
codex doctor --json      # machine-readable output
```

### Check which model/provider is active
```bash
# Inside Copilot CLI session
/settings

# Inside Codex CLI session
/model                   # view and switch model
```

### Reset provider to GitHub default (Copilot CLI)
```bash
unset COPILOT_PROVIDER_BASE_URL
unset COPILOT_PROVIDER_API_KEY
unset COPILOT_MODEL
unset COPILOT_OFFLINE
copilot   # now uses GitHub-hosted models
```

---

## 12. 📋 Full Environment Variable Reference

### GitHub Copilot CLI
| Variable | Required | Description |
|---|---|---|
| `COPILOT_PROVIDER_BASE_URL` | Yes | Base URL of your model provider (e.g. `http://localhost:11434`) |
| `COPILOT_MODEL` | Yes | Model identifier (e.g. `qwen2.5-coder:32b`) |
| `COPILOT_PROVIDER_TYPE` | No | `openai` (default), `azure`, or `anthropic` |
| `COPILOT_PROVIDER_API_KEY` | No | API key (not needed for local Ollama) |
| `COPILOT_OFFLINE` | No | Set `true` to disable all GitHub server contact |
| `COPILOT_GITHUB_TOKEN` | No | PAT for GitHub auth (alternative to browser login) |
| `GH_TOKEN` | No | GitHub token (fallback) |
| `GITHUB_TOKEN` | No | GitHub token (lowest priority fallback) |

### OpenAI Codex CLI
| Variable | Description |
|---|---|
| `OPENAI_API_KEY` | Your OpenAI API key |
| `CODEX_HOME` | Override config/state directory (default: `~/.codex`) |
| `CODEX_NON_INTERACTIVE` | Set `1` for unattended installs |
| `VISUAL` / `EDITOR` | Editor used when pressing Ctrl+G in TUI |
| `CODEX_ACCESS_TOKEN` | Access token (pipe to `codex login --with-access-token`) |
| `CODEX_REMOTE_TOKEN` | Bearer token for remote app-server auth |

---

## 13. ⚡ Quick Start Cheatsheet

```bash
# 1. Start Ollama
ollama serve &
ollama pull qwen2.5-coder:32b

# 2A. GitHub Copilot CLI with Ollama
export COPILOT_PROVIDER_BASE_URL=http://localhost:11434
export COPILOT_MODEL=qwen2.5-coder:32b
copilot

# 2B. OpenAI Codex CLI with Ollama
codex --oss --model qwen2.5-coder:32b

# 2C. Codex CLI with config.toml (persistent)
cat >> ~/.codex/config.toml << 'EOF'
model = "qwen2.5-coder:32b"
model_provider = "local_ollama"
oss_provider = "ollama"
[model_providers.local_ollama]
name = "Ollama"
base_url = "http://localhost:11434/v1"
EOF
codex   # now always uses Ollama

# 3. Switch model mid-session (both CLIs)
/model   # opens model picker inside the session

# 4. Verify it's working
codex doctor
```

---
*Sources: docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/use-byok-models*
*+ developers.openai.com/codex/config-advanced + developers.openai.com/codex/cli/reference*
*Generated: Fri Jun 19 2026*
