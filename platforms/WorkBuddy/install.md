# Install for WorkBuddy Desktop

WorkBuddy Desktop can import a local Skill package from its Skills page. This repository's generic `skills/ui-design/` folder is the source package; keep it unchanged and package a copy for import.

## Create the package

Create a ZIP with the skill directory at the archive root. Include `SKILL.md` and all referenced files, such as `references/`; do not include the repository, `.git/`, or unrelated platform files.

Example archive layout:

```text
ui-design-workbuddy.zip
└── ui-design/
    ├── SKILL.md
    ├── VERSION
    └── references/
```

From PowerShell, run this in the repository root:

```powershell
Compress-Archive -Path .\skills\ui-design -DestinationPath .\ui-design-workbuddy.zip -Force
```

## Import in WorkBuddy Desktop

1. Open WorkBuddy and go to **专家 · 技能 · 连接器** (Experts · Skills · Connectors) → **技能** (Skills).
2. Choose **添加技能** (Add Skill) → **上传技能** (Upload Skill).
3. Select `ui-design-workbuddy.zip` and complete the import.
4. In **已安装** (Installed), confirm the skill is enabled. In a task, select the skill if it is not automatically invoked.

To update it, create a fresh ZIP from the current repository copy and import it through the same flow. Manage or uninstall the imported copy in WorkBuddy's Installed Skills page. Keep project UI assets in the project's own `ui-design/` directory; installing the skill does not initialize or migrate those assets.

For automatic activation on visual tasks, add the short project routing rule from `handbook.md` to the project's `AGENTS.md` when WorkBuddy is used with that file. Otherwise select the imported skill in WorkBuddy when the task is visual.

WorkBuddy may validate additional metadata when importing a package. If import reports missing metadata, follow the current WorkBuddy error guidance for the imported package copy; do not change the generic source skill as part of this installation procedure.

Official references: [WorkBuddy Skills](https://www.workbuddy.cn/docs/workbuddy/From-Beginner-to-Expert-Guide/Function-Description/Skills-Market) · [Skill package structure](https://open.workbuddy.cn/docs/skill)
