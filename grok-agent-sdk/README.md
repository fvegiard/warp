# Grok Agent SDK

Python-first SDK for building Grok-powered agents with strong browser automation, MCP tool integration, and multi-agent orchestration.

This package is being developed alongside the Warp terminal to provide first-class agent capabilities that respect Warp's architecture, security model, and coding standards.

## Status

**Alpha / Research Phase** — The core research findings (browser automation patterns, CDP attach, stealth, multi-agent tab isolation, 2026 failure modes) live in the sibling `grok-agent-sdk-research-2026-06/` directory.

This `grok-agent-sdk/` directory is the **implementation skeleton** that will eventually consume and productize that research.

## Installation (future)

```bash
pip install grok-agent-sdk
```

## Development

```bash
cd grok-agent-sdk
python -m venv .venv
source .venv/bin/activate   # or .venv\Scripts\activate on Windows
pip install -e ".[dev]"
```

## Integration with Warp

See `INTEGRATION.md` for the defined integration points between this SDK and the Warp environment.

## License

AGPL-3.0 (consistent with the Warp client).
