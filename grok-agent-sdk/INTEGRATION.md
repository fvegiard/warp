# Grok Agent SDK – Warp Integration Points

This document defines the **contract** between the Grok Agent SDK and the Warp terminal / Oz platform.

It is the single source of truth for how the two systems will interoperate. All future implementation must follow these points exactly (NO DRIFT).

## 1. Location & Discovery

- The SDK lives at: `grok-agent-sdk/` (sibling to the research folder).
- It is **not** inside `crates/` or `app/`.
- Warp agents discover it via:
  - Python import path when running inside an Oz environment that has the SDK installed, **or**
  - Explicit MCP server registration (see point 3).

## 2. Global Rules Enforcement

- The SDK **must** load and respect the top-level `AGENTS.md` (NO DRIFT) rule file that exists in the user's home directory.
- Any agent built with this SDK inherits the same strict scope-adherence contract that Oz agents follow inside Warp.

## 3. MCP Server Exposure (Primary Integration Path)

The SDK will expose one or more MCP servers so that Warp / Oz agents can call Grok-powered tools without a direct Python dependency.

Planned servers (to be implemented):

| Server Name              | Purpose                                      | Transport     | When to use |
|--------------------------|----------------------------------------------|---------------|-------------|
| `grok-browser`           | Browser automation (Patchright + a11y snapshots) | stdio / SSE   | Web research, form filling, visual validation |
| `grok-multi-agent`       | Tab isolation + concurrent agent orchestration | stdio         | Parallel agent workflows inside one Chrome profile |
| `grok-vision-fallback`   | Screenshot + Grok vision when a11y is insufficient | stdio         | Canvas, heavy JS, CAPTCHA flows |
| `grok-warp-bridge`       | Warp-specific tools (blocks, Drive, Rules)   | stdio         | When a Grok agent needs native Warp context |

Each server will be registered in the user's `~/.warp/.mcp.json` (or via the MCP settings UI) so it appears in the agent permission model.

## 4. Direct Python Usage (Secondary Path)

For advanced users or Oz cloud agents that want a native Python API:

```python
from grok_agent_sdk import GrokAgent, BrowserSession

agent = GrokAgent(
    model="grok-4-3-high",
    browser=BrowserSession.from_system_chrome(profile="work"),
    rules=["AGENTS.md"]   # automatically loads NO DRIFT rules
)
```

This path is **opt-in** and must still enforce the global `AGENTS.md` rules.

## 5. Feature Flag & Rollout

- A new feature flag `GrokAgentSDK` will be added in `warp_core/src/features.rs`.
- Initially disabled for all channels.
- The SDK will only be offered to users who have the flag enabled (or via explicit MCP server registration).

## 6. Data & Privacy

- The SDK never sends user data to xAI unless the user explicitly authorizes a Grok model call.
- Browser profiles used by the SDK follow the same "dedicated non-default directory" rule required by Chrome 136+ (documented in the research).
- All credentials remain inside the user-data-dir; the SDK only stores an alias in the OS keyring.

## 7. Versioning & Compatibility

- The SDK follows semantic versioning.
- Major versions must remain compatible with the current Warp release train (or explicitly declare breaking changes via a new feature flag).

## 8. Testing & CI

- Unit tests live inside `grok-agent-sdk/tests/`.
- Integration tests that exercise real browser flows will be added to `crates/integration/` using the existing Warp integration test framework (when the SDK reaches beta).
- All tests must pass the `AGENTS.md` NO DRIFT rule (no unrequested changes).

## 9. Documentation & Skills

- The research findings in `grok-agent-sdk-research-2026-06/` are considered **source material** for the SDK implementation.
- A new skill `grok-agent-sdk-builder` will be created (in `.agents/skills/`) that teaches Oz agents how to contribute to this SDK while respecting the NO DRIFT contract.

---

**Status**: This document is the authoritative integration spec. Any deviation requires an explicit update to this file and user approval.

**Last updated**: 2026-06-20 (created during initial skeleton setup)