# Project-level UI assets

## What is generic?

`skills/ui-design/` is the generic capability. Install it once and reuse it across projects.

## What belongs to a specific project?

```text
ui-design/
├── manifest.yaml
├── design-token.yaml
├── component-registry.yaml
└── page-schema/
```

Maintain these with the project. `manifest.yaml` records the skill version, the UI asset schema version, the project type, the default theme, and component-library information.

## Does every project have to create these by hand?

No. On first onboarding, the agent can assemble them from existing code, components, themes, CSS variables, and prototypes. After that, maintain them incrementally. A skill upgrade does not regenerate these assets automatically.

## Does every page need a Page Schema?

If the page should be generated from a structure and maintained over time, each important page should have its own schema. A schema is a page-level asset, not a project-level Design Token.

## Initialization order for a new project

```text
Existing project code, component library, and design files
       ↓
Read the manifest and determine the project profile and asset version
       ↓
Initialize Design Tokens and the Component Registry only when they are missing
       ↓
New page → Page Schema → map the component library and registered wrappers
       ↓
Code
       ↓
Screenshot verification
```
