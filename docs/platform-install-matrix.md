# Platform installation matrix

| Platform | Install location | Entry point |
|---|---|---|
| Cursor | `.cursor/rules/ui-design.mdc`, `.cursor/skills/ui-design/` | `scripts/install-cursor.ps1` |
| Codex | `.agents/skills/ui-design/` | `scripts/install-codex.ps1` |
| Claude Code | `.claude/skills/ui-design/` | Copy `skills/ui-design/` manually |
| WorkBuddy Desktop | Import a local ZIP in Experts · Skills · Connectors → Skills → Add Skill → Upload Skill | Package `skills/ui-design/`; see [`platforms/WorkBuddy/install.md`](../platforms/WorkBuddy/install.md) |
| Other AI assistants | The project's own rules directory | Explicitly require reading `SKILL.md` |

Install only the entry point for that platform. Cursor and Codex can be installed in the same project. They share the project-level `ui-design/` assets. Check that `VERSION` matches on both sides.
