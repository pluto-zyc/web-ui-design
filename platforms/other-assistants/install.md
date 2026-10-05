# Install for other AI assistants

If the assistant can read Markdown and YAML files in the project, use the generic file layout.

For example:

```text
ai-project-specs/
└── ui-design/
    ├── SKILL.md
    └── references/
```

State this explicitly in the conversation:

> Read ai-project-specs/ui-design/SKILL.md and follow the UI Design Skill exactly. Analyze the reference and generate the Page Schema first, then read the project UI manifest. Prefer existing components and tokens. After the code is done, verify it with a screenshot.

This approach does not depend on a platform-specific directory.
