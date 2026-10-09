# UI-Design-Skill v0.6.1

> Bring the project's existing component library, UI assets, and project profile into reference-driven page development, and keep pages and components consistent over time.

## Workflow

```text
Read the skill and UI asset versions
        ↓
Scan the frontend project, component library, icon library, and themes
        ↓
Read the project profile, Design Tokens, and Component Registry
        ↓
Analyze the reference → Page Schema
        ↓
Map the component library, project wrappers, and icons
        ↓
Implement → verify visually in the browser → correct
```

Use the skill automatically for any task that changes visible UI, including layout, styles, component appearance, forms, tables, charts, menus, dialogs, or responsive behavior. Do not load it for API- or business-logic-only changes.

## v0.6.1

- Clarify automatic activation for visual UI work across supporting agents.
- Add a project-local Claude Code installer and update its onboarding guide.
- Fix the duplicate typography key in the Design Token template.

## v0.6.0

- Recommend Alibaba PuHuiTi 3.0 when the project does not specify a typeface, and define one font mapping across pages, Element Plus controls, and overlays.
- Add rules for delivering font files, retaining license records, protecting icon fonts, and verifying that fonts actually load.

## v0.5.0

- Detect and prefer the project's installed component library and profile-matched wrappers, so standard controls are not rewritten by hand.
- Add viewport root-layout rules: define the root size, fixed regions, remaining content area, and scroll ownership before implementing the page.
- Visual verification covers narrow and short viewports, unexpected document overflow, and horizontal scrolling inside tables.
- Treat ongoing project development and incremental maintenance as the default. Upgrading the skill does not rewrite assets or code.
- The project manifest records the skill release, UI asset schema version, project mode, and default theme.
- Support `admin`, `visualization`, and `hybrid` profiles, and keep admin and visualization themes isolated.
- For shared libraries such as Element Plus, define theme variables, local scope, and overlay isolation boundaries.
- Add reuse boundaries for shared components such as BaseTable, plus Element Plus theme variables and overlay isolation rules.
- Add a selection strategy for icon source files, icon libraries, SVG, and crops taken from screenshots.
- Provide install and upgrade guidance for Cursor, Codex, and WorkBuddy Desktop.

## Long-lived project assets

```text
ui-design/
├── manifest.yaml
├── design-token.yaml
├── component-registry.yaml
└── page-schema/
```

`manifest.yaml` records the skill release and the asset schema version. The project owns the other assets. Installing the skill updates only the platform entry files and does not overwrite the project-level `ui-design/` directory.

## Onboarding and upgrades

Install from `handbook.md`. When upgrading an existing project, inspect the current assets and migrate only what the schema change requires. Updating skill rules alone does not require regenerating pages.

See `skills/ui-design/SKILL.md` and `skills/ui-design/references/` for the detailed rules. Platform onboarding is in `platforms/` and the project workflow is in `handbook.md`.
