# Install and upgrade for Codex

Install `skills/ui-design/` into the project's `.agents/skills/ui-design/`. Codex continues to maintain project-level UI assets in the project-root `ui-design/` directory.

When the skill is updated, replace only the skill files in `.agents/skills/ui-design/`. Do not recreate or overwrite `ui-design/manifest.yaml`, Design Tokens, the Component Registry, Page Schemas, or page code. After installation, check that `VERSION` matches the skill version in the project manifest.

PowerShell install script:

```powershell
cd "your-project-root"
& "path-to-UI-Design-Skill\scripts\install-codex.ps1"
```

Do not install the Cursor or Claude Code platform directories.

For automatic activation on visual tasks, add the short project routing rule from `handbook.md` to the repository `AGENTS.md`. Keep the installed skill as the detailed workflow source.
