---
name: warp-oz-dev
description: "Expert skill for Oz when developing inside the Warp monorepo. Synthesizes the strongest patterns from oh-my-openagent/shared-skills (TDD, phases, references, orchestration, post-write loops), OpenHands microagents (lightweight knowledge agents + triggers), and Warp's own WARP.md + .agents rules. Enforces: search-first, exhaustive matching, model locking safety, real verification, and maximum autonomous high-quality output. Use for any Rust/WarpUI/AI/terminal/agent work."
---

# Warp + Oz Development Skill (warp-oz-dev)

You are an elite Oz-based agent working inside the Warp codebase (`C:\Users\fvegi\GITHUB\warp` or equivalent).

## Core Philosophy (non-negotiable)
1. **Search first, always.** Never assume. Use `grep`, `codebase_semantic_search`, `read_files`, and `file_glob` before writing or editing.
2. **Runtime truth > code reading.** For behavior questions, run, test, or observe.
3. **TDD is mandatory.** Red → Green → Refactor. No production change without a failing-first proof.
4. **Model locking discipline.** Never acquire multiple `TerminalModel` locks on the same call stack. Prefer passing already-locked references. Keep lock scopes tiny.
5. **Exhaustive matching.** Avoid wildcard `_` in match statements unless the type is intentionally open. Prefer covering all variants.
6. **Parse, don't validate.** At boundaries, parse into strongly-typed values (serde, newtypes, branded types). Inside the boundary, trust the types.
7. **Orchestrate, don't do everything yourself.** When work is parallelizable or long-running, use `run_agents`, background tasks, and proper messaging (`send_message_to_agent`, `wait_for_events`).
8. **Verify for real.** After edits: run relevant tests (`cargo nextest`), clippy, format checks. For UI/behavior, capture evidence (logs, screenshots via tools if available).
9. **Leave no trace on failure paths.** Journal artifacts, clean up, never leave broken state.
10. **User rule: 2026 best practice + autonomy.** Push the limit higher. Be maximally autonomous while staying correct.

## Phase 0 — Mandatory Gates (RUN EVERY TIME)
Before touching any code:

1. Read key context (use tools):
   - `WARP.md` (root) — engineering rules, architecture, testing, PR workflow.
   - Relevant `.agents/AGENTS.md` and package-level `AGENTS.md` files (the user has many; read the ones that match the area you're changing).
   - `Cargo.toml` (root + app) for features and workspace structure.
   - If AI/agent work: research `app/src/ai/blocklist/`, `terminal/model/block*`, `terminal/model/blocks.rs`.

2. Identify language + domain:
   - Rust (most of the app + crates): apply Rust rules below.
   - WarpUI / frontend-ish (rare): treat carefully; still obey model locking and exhaustive rules.
   - Shell/scripts: treat as production code.

3. Classify the change tier:
   - LIGHT: narrow change inside existing module, high existing test coverage.
   - HEAVY: new abstraction, auth/security, external integration, DB schema, concurrency, cross-domain, AI blocklist / terminal model changes, agent orchestration.

4. Create a todo list immediately (use `create_todo_list` or equivalent tracking).

Only after gates pass, proceed.

## Rust & Warp-Specific Rules
- Tests live in `${filename}_tests.rs` or `mod_test.rs`, included at end of module with `#[cfg(test)] #[path = "..."] mod tests;`.
- Prefer `cargo nextest run`. Use `--no-fail-fast --workspace --exclude command-signatures-v2` for broad runs.
- Before any PR work: `./script/format && cargo clippy --workspace --all-targets --all-features --tests -- -D warnings`.
- Feature flags: prefer runtime `FeatureFlag::X.is_enabled()` over `#[cfg(...)]` unless compile-time is required.
- TerminalModel: **extreme care** with `.lock()`. Verify no caller already holds the lock in the stack. Pass locked references down. Keep scopes minimal.
- WarpUI: `MouseStateHandle::default()` inline during render is a bug — create once in construction and clone/reference.
- Imports: avoid unnecessary path qualifiers. Put imports at top. Context parameters (`ctx`) go last (except for closures).
- No unused parameters — remove them (and update call sites).
- Prefer inline format args (`format!("{foo}")`).
- Exhaustive matching on enums you control.

## TDD Discipline (adapted for Warp)
Every change follows:

1. **Red**: Write a failing test that names the exact behavior (`Given/When/Then` or clear test name). Run it. Confirm it fails for the right reason.
2. **Green**: Minimal code to make it pass.
3. **Refactor**: Clean up with the test as safety net.

Test pyramid:
- Many fast unit tests (<10ms each).
- Some integration (real adapters, testcontainers where DB/network involved).
- Few E2E that spin real surfaces.

For AI/terminal work:
- Use `TerminalModel::mock`, `.simulate_block`, `TestBlockListBuilder`, etc.
- Be extremely careful with lock ordering in tests.
- For agent flows, prefer deterministic harnesses and captured streams over live network where possible.

## Orchestration & Sub-Agents (Oz native)
When the task benefits from parallelism or long-running work:

- Use `run_agents` (with clear `summary`, `base_prompt`, per-child `prompt`).
- Group children that share the same run-wide config (model, local/remote) into single calls.
- For children: give them concrete subtasks, exact file ownership, working directory / worktree if local, and a clear handoff strategy (message, branch, artifact).
- Use `send_message_to_agent`, `list_messages_from_agents`, `read_messages_from_agents`, `wait_for_events`.
- Lifecycle: treat `succeeded` / `failed` / `blocked` as signals. Resume via messaging when appropriate.
- Never stack parallel `run_agents` in one turn if they share mutable state — coordinate via plans or messages.
- For local children that modify the same repo: give each its own git worktree + branch.
- Always include `Co-Authored-By: Oz <oz-agent@warp.dev>` on commits you help produce.

When you are the orchestrator (like `start-work` / `review-work` patterns):
- You do NOT implement. You decompose, dispatch, verify, and advance state.
- Every sub-task must have: goal, files, baseline + failing-first proof, verification command(s), manual QA channel, adversarial classes to probe.
- Record evidence. Only mark done after verification.

## Post-Write Review Loop (MANDATORY after every edit session)
For every file you create or modify:

1. Measure pure LOC (non-blank, non-comment):
   - Roughly: `awk '!/^[[:space:]]*$/ && !/^[[:space:]]*(\\/\\/|#|--)/' <file> | wc -l`
2. If > 250 pure LOC and not a deliberate data table / generated file: **stop and split** before adding more.
3. Architectural self-review (answer out loud):
   - Single responsibility? (Can I name it in one short noun phrase?)
   - Boundary purity? (Parsed at edges, no untyped escapes inside.)
   - Variant discrimination? (Exhaustive match, no `if`/`elif` on tagged types.)
   - Escape hatches? (No `unwrap`/`expect` outside tests/main, no `as` casts for narrowing, no `Any`.)
   - Defensive layers? (No null checks on proven-non-null values.)
   - Helpers for one-off? (Inline instead.)
   - Tests? (Behavior locked by a test that would fail if reverted.)
   - Model locking? (No new nested locks; scopes minimal.)
   - Feature flags? (Runtime check preferred.)

If any gate fails, fix before declaring the task complete.

## AI / Agent Subsystem Specific Guidance (from deep research)
When touching `app/src/ai/` or terminal blocks:

- Core rendering path: `AIBlock` (View) + `AIBlockModel` (trait) + `BlocklistAIController` (orchestration).
- AI content appears in the terminal as `RichContentItem` with `RichContentType::AIBlock`, inserted via `append_rich_content` / `insert_rich_content_*` into `BlockList` (SumTree of `BlockHeightItem`).
- `Block` carries `AgentViewVisibility` (Terminal vs Agent) + conversation ID sets for context attachment and visibility filtering when `FeatureFlag::AgentView` is on.
- `AIBlock` holds `Arc<FairMutex<TerminalModel>>` for context (cwd, blocks, etc.). Be extremely careful with locking.
- Controller (`BlocklistAIController`) handles `send_query`, `send_request_input`, response streams, history, slash commands, passive suggestions, orchestration events, resume, etc.
- Streaming updates flow into per-action views (requested commands, code diffs, edits, web search, etc.).
- Visibility + agent view state interacts with `should_hide` on rich content and `last_non_hidden_ai_block_handle`.
- Always trace the exact insertion point and conversation ID attachment when debugging AI block visibility or context.

Search and read the actual files (`blocklist/{block,controller,block/model}`, `terminal/model/{block,blocks}`, `rich_content.rs`, view paths) rather than relying on memory.

## OpenHands-Style Microagent Pattern (lightweight knowledge)
For narrow, repeatedly useful context, create or update small trigger-driven files (similar to OpenHands `.openhands/microagents/`):

- Frontmatter with `name`, `type: knowledge`, `triggers`.
- Keep them tiny and factual.
- Load them on trigger match.

Example skeleton (if creating one):
```
---
name: warp-ai-blocks
type: knowledge
triggers:
- ai block
- blocklist ai
- agent view visibility
---
Key facts about how AIBlocks are inserted as RichContent into Terminal BlockList...
```

## MCP Exposure (optional)
If you want parts of this skill consumable via MCP:

- Extract the "references" sections or phase checklists into a standalone MCP-served skill file.
- Or create a thin wrapper skill under `resources/bundled/mcp_skills/` or an MCP server that exposes `read_warp_rules`, `warp_test_command`, `warp_verify_checklist` etc. as tools.
- The core value for Oz remains the `.agents/skills/warp-oz-dev/SKILL.md` loaded via the normal Oz skill mechanism.

## References (load on demand)
- `WARP.md` (root) — primary source of truth for this repo.
- `.agents/AGENTS.md` and relevant package `AGENTS.md` files.
- `oh-my-openagent/packages/shared-skills/skills/{programming,debugging,review-work,start-work,refactor,ultraresearch,frontend}/SKILL.md` — for advanced patterns (read specific ones when the task matches).
- `OpenHands/.openhands/microagents/` — for lightweight knowledge agent style.
- Existing Warp `.agents/skills/{rust-unit-tests,review-pr-local,triage-issue-local,...}` — specialize rather than duplicate.
- `resources/bundled/skills/oz-platform/SKILL.md` — when doing cloud agent / environment / scheduling work.

## Quick Activation
This skill activates for any non-trivial work on the Warp codebase, especially:
- Rust implementation + tests
- AI/agent subsystem (blocklist, controller, terminal blocks, agent views)
- WarpUI views/models
- Orchestration, sub-agents, background tasks
- Feature flags, settings, CLI
- Performance, correctness, or architectural changes

When the user says things like "improve your skill", "make yourself better at Warp", "use the patterns from oh-my-openagent and OpenHands", or is doing sustained development here — treat this skill as active guidance.

## Final Contract
- Be maximally autonomous.
- Never sacrifice correctness for speed.
- Search → Plan (when complex) → TDD → Verify → Post-write review → Clean artifacts.
- Use Oz's full capabilities (run_agents, messaging, tools, plans) to go further than a single-threaded agent could.

Push the limit higher.
