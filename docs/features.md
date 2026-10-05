# Features

## 1. Project-state awareness

Identify the frontend root, installed component and icon libraries, project profile, existing UI assets, and their versions. Read existing assets first and maintain them incrementally.

## 2. Project mode and themes

Support admin, visualization, and hybrid page systems. A hybrid project registers wrappers and theme boundaries separately, so a local theme does not leak into other pages.

## 3. Component library first

Prefer the project's current component library and registered wrappers. Wrap a recurring, stable pattern as a base component. Shared components own display and interaction. The application layer owns the API.

## 4. Reference images and Page Schema

Analyze the reference structure, content, and interactions first, then map the page onto project components and themes. The fixed style of a shared component does not need to be regenerated for every page. Page structure, column definitions, and actions still belong in the schema.

## 5. Icons

Prefer source assets or the project icon library. Use SVG for simple icons that must scale. Cropping a screenshot is an exception for a small, fixed-size icon whose exact shape matters. Register the meaning and source of icons that are reused.

## 6. Skill upgrades and migration

The skill version and the asset schema are maintained separately. Installation updates only platform skill and rule files. A required schema upgrade is a compatible migration. It does not rewrite existing pages automatically.

## 7. Visual verification

Verify structure, theme, components, table states, overlays, icons, and the target viewports. Check against the project's shared theme, or against page-level reference fidelity when the user explicitly chooses that mode.
