---
name: ui-design
description: Use when creating or updating interface pages from references or product requirements. Detect and preserve project UI assets, prioritize the installed component library and registered wrappers, model page structure before implementation, then visually verify the result.
---

# UI Design Skill v0.5.0

Use the current frontend project as the source of truth. The skill release, project asset format, component-library release, and page implementation are separate concerns. Updating this skill does not authorize reinitializing or rewriting existing project assets or pages.

## Required workflow

### 0. Inspect project and asset state

Before making changes:

1. Locate the actual frontend root and inspect its package manifest, framework, installed component library, theme entry points, icon system, and reusable components.
2. Read `ui-design/manifest.yaml` when present, then read the existing Design Token, Component Registry, and relevant Page Schema files.
3. Compare installed skill version and project `uiAssetSchemaVersion` with the files actually present. Treat missing version fields in existing project assets as the documented legacy format; do not rewrite them just to add metadata.
4. If project assets exist, preserve them and continue incrementally. Initialize missing assets only. Do not regenerate existing manifests or pages unless the user explicitly asks.
5. If project mode or visual-theme precedence cannot be inferred confidently, ask one focused question before choosing a profile. Otherwise record the evidence and proceed.

### 1. Determine the project UI profile

Support these profiles:

- `admin`: administrative console is the default visual language.
- `visualization`: map, monitoring, or operational visualization is the default visual language.
- `hybrid`: both are first-class; use explicitly separated `admin` and `visualization` component/theme scopes.

Detect the installed UI library from the frontend package manifest and source imports. Never assume Element Plus is installed. If a supported component library is present, use it before hand-building general-purpose controls. If no suitable library exists, use the project's own system; only propose a new dependency when necessary.

In a hybrid project, administrative screens use the registered admin components. Visualization screens use isolated visualization components, even if both are built on the same underlying UI library. Do not apply visualization styles globally to admin pages or vice versa.

### 2. Analyze the reference and establish precedence

Describe `Page → Layout → Main → Section → Component`, including layout, content, controls, table columns, actions, and responsive behavior.

For viewport-based applications, decide whether the page is viewport-locked or content-driven before implementation. For a viewport-locked shell, establish a definite root height and size the main region from the remaining space; `100%` and `calc(100% - header)` require a definite height chain, while Grid/Flex can express the same relationship. Keep fixed header/navigation regions outside the content scroll area. Give each long-content region a clear vertical or horizontal scroll owner. In nested Grid/Flex layouts, allow intended shrinkable children to shrink with `min-width: 0` and `min-height: 0` where needed. Avoid accidental document-level overflow; let wide tables scroll within their table region. Do not force viewport locking on content pages.

Default precedence is:

1. Explicit user requirement for this page
2. Project profile, Design Tokens, component themes, and registered wrappers
3. Existing project page patterns
4. Reference image details
5. Skill defaults

By default, a shared component keeps its registered project style when a reference image shows a different treatment. Use the reference for page structure, data, and interaction mapping. Change a shared component theme only when the user requests the theme change or selects reference-fidelity mode. Page Schema must record notable conflicts and the selected precedence.

### 3. Create or update the Page Schema

Before coding, create or incrementally update the corresponding file under `ui-design/page-schema/` using the existing schema format. A Page Schema describes hierarchy, content, interactions, and component mapping; it is not a CSS specification.

For registered tables, forms, menus, dialogs, and other shared components, describe their data/configuration and slots. Do not redo their registered visual treatment in the page schema. Record genuinely different structures as a supported variant or a candidate new component.

### 4. Map components and theme tokens

For each element, search the Component Registry and real source files in this order:

1. Existing project wrapper that matches the profile and contract
2. Existing component-library component with project theme defaults
3. Composable project primitives
4. New shared wrapper when a stable pattern recurs or the user requests it
5. Page-local implementation for a genuinely unique structure

Do not create wrappers around every primitive without adding stable project defaults, semantics, behavior, or isolation. Keep wrappers composable and preserve the underlying library API where practical.

For a component library such as Element Plus:

- Use its input, select/tree-select, form, button, dialog, table, pagination, menu, feedback, and accessibility behavior when they fit the project's visual profile.
- Register reusable project-level wrappers such as `BaseTable`, `AdminTable`, or `VisualizationTable` only after verifying that they exist. Do not list proposed components as existing.
- Keep base components independent of backend APIs: accept data/configuration and emit interactions; page/domain code owns data fetching and business rules.
- Use project tokens as the source of truth. Map the brand color and semantic states to library variables or supported Sass theme variables. Include hover, active, focus, disabled, border, surface, and text roles where required; changing only the primary color may leave mismatched states.
- Scope theme variables to the owning theme root. Do not globally override library internals for one profile when multiple profiles share the app.
- Styles in Vue SFCs should normally use `scoped`. When library internals must be styled, prefer component props, slots, CSS variables, and narrowly scoped `:deep()` selectors.
- Popovers, selects, tooltips, dropdowns, dialogs, and similar overlays may be teleported outside the theme root. Preserve theme isolation with supported `popper-class`, `append-to`, component class, or equivalent library APIs. Verify overlays visually.

### 5. Resolve icons from maintainable sources

Use this order:

1. Supplied source assets (SVG, icon font, Figma export, or project assets)
2. The project's installed icon library, choosing a visually compatible icon
3. Hand-authored SVG for simple, distinctive shapes that need to scale or take theme colors
4. Crop a supplied reference image into a raster asset only when exact silhouette matters, no usable source/vector exists, and the icon is small and used at a controlled size

Do not crop screenshots as the default icon workflow. Cropped raster assets can retain background pixels, blur when scaled, and cannot adapt cleanly to theme/state colors. Do not claim a drawn SVG is an exact match when it is only an approximation. Record icon source and path for reusable project icons.

### 6. Implement

Implement only after the Page Schema and component mapping are coherent. Preserve existing architecture, project conventions, business code, and APIs. Reuse registered wrappers, library components, tokens, and icon assets. Do not create a second design system for an individual page.

If a needed reusable component is missing, check its recurrence and profile first. State its contract, variants, theme scope, ownership of data behavior, and reason for adding it; implement and register it only when it belongs to the current authorized scope.

### 7. Verify visually

Inspect a real preview or screenshot. Check page hierarchy, component mapping, theme profile, proportions, spacing, typography, component states, overlays, responsiveness, and icon fidelity. For viewport-based layouts, check both desktop and relevant narrow/short viewports, confirm fixed regions remain stable, verify scrollbars appear in their assigned regions, and ensure the document does not gain unintended horizontal or vertical overflow. Compare the reference only according to the selected precedence mode. Correct structural and component mapping issues before local CSS details.

## Project asset lifecycle and upgrades

- Skill package files are generic and versioned independently from project assets.
- `ui-design/manifest.yaml` records the installed skill release and project asset schema version.
- `design-token.yaml` and `component-registry.yaml` are long-lived project assets. Page Schema files are page-level assets.
- A new skill release must first inspect existing project assets, preserve unknown fields and user edits, and only apply a compatible migration when required.
- Skill installation updates only platform skill/rule files. It must never initialize, overwrite, migrate, or regenerate `ui-design/` assets by itself.
- Adding a new skill rule does not trigger a rewrite of existing application pages. Existing pages are migrated only when the user asks or a necessary compatibility issue is identified and accepted.

## Reference material

Read the relevant files in `参考资料/` when making profile, component-library, icon, schema, migration, or visual-validation decisions. Keep project-specific decisions in project-level UI assets, not in this generic skill.
