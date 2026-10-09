# Install and upgrade for Cursor

Files required for Cursor:

```text
.cursor/rules/ui-design.mdc
.cursor/skills/ui-design/
```

PowerShell install script:

```powershell
cd "your-project-root"
& "path-to-UI-Design-Skill\scripts\install-cursor.ps1"
```

When the skill is updated, the script overwrites the entry point and skill files above. It does not modify the manifest, tokens, registry, Page Schemas, or frontend application code under the project-root `ui-design/` directory. After installation, check that the version file matches the project manifest.

Do not install the Codex or Claude Code platform directories.

For automatic activation on visual tasks, add the short project routing rule from `handbook.md` to the repository `AGENTS.md`. Keep the installed skill as the detailed workflow source.
