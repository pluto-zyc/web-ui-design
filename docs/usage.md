# Usage

## Onboarding a new project

After installing the platform skill, inspect the project manifest, assets, framework, component library, icon library, and existing pages. Initialize only the assets that are missing, and confirm the project mode, default theme, and component boundaries.

## Iterating on a new page

```text
Read the existing assets
  ↓
Analyze the reference against the project profile
  ↓
Create or update the Page Schema
  ↓
Map project wrappers, the component library, and icons
  ↓
Implement
  ↓
Preview, check, and correct
```

Admin and hybrid projects use the shared admin control theme by default. Visualization projects wrap lists and forms inside the visualization style boundary. An explicit request for page fidelity can be handled with a named variant. Do not change the global theme silently.

## Upgrading an existing project

Updating the skill does not reinitialize Design Tokens or the Component Registry, and it does not rewrite Page Schemas. Compare the skill release with the asset version in `ui-design/manifest.yaml`, and run a compatible migration only when the schema format changed.
