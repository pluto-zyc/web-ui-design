# Installation overview

## Cursor

Installs `.cursor/rules/ui-design.mdc` and `.cursor/skills/ui-design/`.

```powershell
cd "project-root"
& "path\UI-Design-Skill\scripts\install-cursor.ps1"
```

## Codex

Installs `.agents/skills/ui-design/`.

```powershell
cd "project-root"
& "path\UI-Design-Skill\scripts\install-codex.ps1"
```

## Claude Code

Installs `.claude/skills/ui-design/`. Copy `skills/ui-design/` into the matching project path.

## WorkBuddy Desktop

Package `skills/ui-design/` as a ZIP, then in WorkBuddy open **专家 · 技能 · 连接器** → **技能** → **添加技能** → **上传技能** and select the ZIP. The archive should contain the `ui-design/` skill folder, including `SKILL.md`, `VERSION`, and its `references/` files. See [`platforms/WorkBuddy/install.md`](../platforms/WorkBuddy/install.md) for the full steps.

## Other assistants

Copy `skills/ui-design/` into the workspace specification directory, and tell the assistant to read `SKILL.md`. Platform entry points stay independent of one another. Project UI assets stay in the project's shared `ui-design/` directory.

## Installation boundary

Cursor and Codex install and upgrade only platform rules and skill files. They do not generate or overwrite `ui-design/manifest.yaml`, Design Tokens, the Component Registry, Page Schemas, or frontend code. After installation, compare the platform `VERSION` with the skill version recorded in the project manifest.
