# Install for Workbody

Workspace directory layouts differ, so add the skill as project files.

Copy:

- `skills/ui-design/`
- The parts of `specs/` that the workspace needs

Place them in the workspace specification directory, for example:

```text
ui-design/
├── SKILL.md
└── references/
```

Tell the agent:

> Read ui-design/SKILL.md and follow the UI Design Skill. Read the reference files when a decision needs the detailed rules. For a new page, generate the Page Schema first, then read the project Design Tokens and Component Registry. After the code is done, verify it with a screenshot.
