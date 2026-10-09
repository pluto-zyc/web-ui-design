# Architecture

v0.6.1 is split into generic capability, platform entry points, long-lived project assets, and page assets.

## Generic layer and platform layer

- `skills/ui-design/`: cross-project workflow rules and reference material.
- `platforms/`: entry points for Cursor, Codex, and other platforms.
- `scripts/`: update only the skill files for the selected platform.

## Project layer

```text
ui-design/
├── manifest.yaml
├── design-token.yaml
├── component-registry.yaml
├── page-schema/
└── references/
```

- Manifest: skill release, UI asset schema, project mode, and the boundaries of themes and component libraries.
- Design Tokens: project-level or profile-level visual variables.
- Component Registry: source, profile, contract, variants, and status of components that actually exist.
- Page Schema: hierarchy, data columns, interactions, component mapping, and necessary exceptions for one page.

## Component theme model

A project may declare `admin`, `visualization`, or `hybrid`. In a hybrid project, each theme applies to its own wrappers and page roots. Sharing an underlying component library does not mean sharing every visual variable. Teleported overlays need an explicit theme-attachment strategy.

## Versions and the generation path

The skill release, the asset schema, and the frontend component library are versioned separately. Read and keep existing assets, then move through page structure, component and theme mapping, code, and preview verification. Installing a new skill does not migrate project UI assets or regenerate pages.
