"""Core Grok Agent runtime (placeholder).

The real implementation will live here after the research findings are productized.
For now this module only enforces the NO DRIFT contract.
"""
from __future__ import annotations

from pathlib import Path
from typing import Any


def load_global_rules() -> list[str]:
    """Load the global AGENTS.md (NO DRIFT) rules.

    Returns the rule text as a list of lines.
    This function is the single entry point that every Grok agent must call.
    """
    home = Path.home()
    rules_file = home / "AGENTS.md"
    if not rules_file.exists():
        return []
    return rules_file.read_text(encoding="utf-8").splitlines(keepends=False)


class GrokAgent:
    """Minimal agent shell that will later wrap xai-sdk + browser + MCP tools."""

    def __init__(self, model: str, rules: list[str] | None = None) -> None:
        self.model = model
        self.rules = rules or load_global_rules()
        if not self.rules:
            # In real code we would raise or warn; for skeleton we just store empty.
            pass

    def run(self, task: str) -> Any:
        """Execute a task while strictly obeying the loaded rules."""
        # Placeholder – real implementation will go here.
        return {"status": "not_implemented", "task": task, "model": self.model}
