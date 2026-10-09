# Install and update for Claude Code

Run the PowerShell installer from the project root:

```powershell
& "path-to-ui-design\scripts\install-claude.ps1"
```

Or use the shell installer:

```bash
bash path-to-ui-design/scripts/install-claude.sh
```

The installer copies only `skills/ui-design/` to `.claude/skills/ui-design/`. Do not copy the Cursor or Codex platform directories. Project UI assets remain in the project's own `ui-design/` directory and are not changed by skill installation.

To invoke the skill automatically for UI work, add the short trigger rule from `handbook.md` to the project's `AGENTS.md` or `CLAUDE.md`. Keep that project instruction as a routing rule; the installed skill remains the detailed workflow source.
