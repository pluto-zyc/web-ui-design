# Platform installation matrix

| Platform | Install location | Entry point |
|---|---|---|
| Cursor | `.cursor/rules/ui-design.mdc`, `.cursor/skills/ui-design/` | `scripts/install-cursor.ps1` |
| Codex | `.agents/skills/ui-design/` | `scripts/install-codex.ps1` |
| Claude Code | `.claude/skills/ui-design/` | Copy `skills/ui-design/` manually |
| Workbody | Workspace specification directory | Add it as workspace files |
| Other AI assistants | The project's own rules directory | Explicitly require reading `SKILL.md` |

Install only the entry point for that platform. Cursor and Codex can be installed in the same project. They share the project-level `ui-design/` assets. Check that `VERSION` matches on both sides.
