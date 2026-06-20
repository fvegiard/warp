# Grok Agent SDK Implementation Plan

## Problem Statement
Implement a Python SDK (Grok Agent SDK) that:
- Optimizes large documents containing thousands of embedded images (e.g. DOCX) while preserving full text and images in a form that cloud vision LLMs can still read and see (DOM-like embedded assets).
- Transforms documents into vector RAG-ready artifacts supporting both text and image content.
- Enables vision LLM (Grok / xAI) search over the documents that can reference and return source images + text.
- Includes robust headless browser automation: real Chrome/Edge via --remote-debugging-port (CDP), automatic free-port fallback, persistent logged-in profiles (no repeated logins), stealth, and support for multi-agent / tab isolation.
- Securely imports and persists credentials, API keys, and OAuth state using keyring + dedicated browser profiles so the user does not re-authenticate on every run.

## Current State (Research Complete)
- Working prototype: optimize_docx.py (python-docx + Pillow) that resizes images (max long edge), selectively converts non-transparent PNG to JPEG, preserves document structure 100%, and re-packs with high compression.
- Full 8-agent parallel research swarm executed. All agents delivered findings.md.
- Authoritative 2026 research conclusions:
  - Top: browser-use (9.5/10) — native Python, cdp_url, user_data_dir, structured snapshots + optional vision, local MCP.
  - Strong official: microsoft/playwright-mcp (8.5/10) — canonical a11y snapshots, --cdp-endpoint, --user-data-dir, tabs.
  - Multi-agent: ultimate-playwright-mcp patterns (targetId/groupId on shared context).
  - Stealth: Patchright (or rebrowser-playwright) for Runtime.enable fixes + channel="chrome".
  - Auto-port: No tool provides robust fallback. SDK must implement find_free_port + DevToolsActivePort parsing.
  - Credentials: One-time headed login into dedicated --user-data-dir. Store only alias/path in keyring. Chrome 136+ requires profile copy (exclude heavy caches).
  - Gaps: Python auto-port finder, keyring-seeded profile management, xai-sdk vision fallback, tab-isolation, stealth audit.

## Proposed Architecture
- optimizer/: Generalize optimize_docx.py (DOCX first).
- ingester/: Text + image extraction + Grok vision captions.
- rag/: Hybrid text + image (or caption) vector indexes.
- vision/: xai-sdk wrapper for captioning and vision-grounded search.
- browser/: Port finder + launcher + CDP attach + snapshots + tab mgmt.
- credentials/: keyring for keys + profile aliases.
- client/: High-level orchestration.

## Browser Automation (Highest Priority)
- find_free_port() + launch with --remote-debugging-port=PORT --user-data-dir=...
- Attach priority: browser-use → Patchright (channel=chrome) → direct Playwright / MCP sidecar.
- Snapshots: a11y/structured first (browser_snapshot style), screenshots only for vision fallback.
- Profiles: dedicated per alias. keyring stores only alias → path.
- Chrome 136+: copy Default/ (exclude Cache/, Code Cache/, Service Worker/) to debug dir, then --user-data-dir=debug-dir --profile-directory=Default.
- Stealth: Patchright + real Chrome + no_viewport=True.
- Auto-port: read DevToolsActivePort (line1=port, line2=/devtools/browser/...) or probe /json/version.

## Credentials & Auth
- keyring for xAI key, other secrets, and profile aliases.
- One-time: launch headed on dedicated dir → user logs in → state persists in profile.
- Subsequent: read alias from keyring, attach via cdp_url or user_data_dir. No re-login.

## Document Optimization & RAG
- Reuse/ generalize optimize_docx.py (max_edge, jpeg_quality, transparency-aware PNG→JPEG, .rels update, high-compress repack).
- Ingest: page-aware chunks + image refs + Grok captions.
- Embeddings: text + (vision captions or direct image embeddings).
- Query: text RAG or vision-grounded (Grok sees images, returns cited images + text).

## Tech Stack (from 2026 research)
- Python 3.11+
- browser-use (primary) + Patchright
- xai-sdk (Grok vision)
- python-docx + Pillow
- keyring
- Optional MCP sidecars (browser-use or playwright-mcp)

## Phases
Phase 1: Foundations (optimizer, credentials/profile manager, GrokClient)
Phase 2: Browser (port finder + launcher + attach + snapshots + Chrome 136+ copy)
Phase 3: Ingestion & RAG scaffolding
Phase 4: Vision search & multimodal retrieval
Phase 5: Production (multi-agent isolation, stealth, MCP, CLI, tests)
Phase 6: Extensions

## References
- research-agents/synthesis/findings.md (primary)
- research-agents/cdp-port/findings.md (DevToolsActivePort + launch patterns)
- research-agents/stealth-auth/findings.md (Patchright + profile copy)
- optimize_docx.py (proven prototype)
