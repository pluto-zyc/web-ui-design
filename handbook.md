# UI-Design-Skill v0.6.0 Handbook

This handbook covers onboarding and ongoing maintenance of a real project. Upgrading the skill, upgrading the asset schema, and implementing a page are separate operations. None of them triggers the others automatically.

## 1. Layers and versions

The generic skill owns the workflow. Project assets own that project's themes, components, and pages. The frontend package manifest owns component-library versions.

| Version | Maintained in | Meaning |
|---|---|---|
| Skill release | `skills/ui-design/VERSION` | Generic rule version, for example `0.6.0` |
| UI asset schema | `ui-design/manifest.yaml` | Project asset structure version, for example `1` |
| Component library | Frontend `package.json` | Dependency versions such as Element Plus |

Recommended project layout:

```text
project/
├── .agents/skills/ui-design/       # Codex
├── .cursor/rules/ui-design.mdc     # Cursor entry
├── .cursor/skills/ui-design/       # Cursor
├── ui-design/
│   ├── manifest.yaml
│   ├── design-token.yaml
│   ├── component-registry.yaml
│   ├── page-schema/
│   └── references/
└── front_end/                      # Example frontend directory
```

`ui-design/` may follow the project's real layout. The agent should locate the frontend root first, then read UI assets from the shared project root.

WorkBuddy Desktop manages its imported skill in the app's Skills page; it does not add a project-local install directory.

## 2. Install or update the skill

The PowerShell working directory must be the project root. Use the install scripts in this repository:

```powershell
cd "D:\Projects\my-project"
& "D:\Tools\UI-Design-Skill\scripts\install-cursor.ps1"
& "D:\Tools\UI-Design-Skill\scripts\install-codex.ps1"
```

The scripts copy only the skill and rule files for the selected platform. They do not create or change the project's `ui-design/` assets, and they do not change application code.

For WorkBuddy Desktop, package `skills/ui-design/` as a ZIP and import it from **专家 · 技能 · 连接器** → **技能** → **添加技能** → **上传技能**. See [`platforms/WorkBuddy/install.md`](platforms/WorkBuddy/install.md). The import is managed in WorkBuddy; it does not use the Codex or Cursor install scripts.

After an update, confirm:

```powershell
Get-Content .agents\skills\ui-design\VERSION
Get-Content .cursor\skills\ui-design\VERSION
Get-Content ui-design\manifest.yaml
```

The two skill versions must match. The Cursor and Codex entry points must point at the same skill release. The project asset version is maintained separately.

For an existing project, the install scripts do not modify the manifest. After confirming that both newly installed `VERSION` files are the expected release, update only `skill.version` in `ui-design/manifest.yaml`. Leave the rest of the project assets unchanged. If the schema format also changed, update `uiAssetSchemaVersion` according to the migration notes.

## 3. Onboard or upgrade an existing project

Ask the agent to inspect the current state first:

```text
Use the UI Design Skill in this project. First inspect the skill version, ui-design/manifest.yaml, the existing Design Tokens, Component Registry, Page Schemas, frontend dependencies, and the actual source. Do not reinitialize existing assets and do not rewrite existing application pages. Report the current project mode, component library, theme boundaries, asset schema version, and any compatible migration that is required. Apply only incremental asset migrations that are authorized and necessary.
```

Rules:

- If the manifest or long-lived assets already exist, read and keep them. Add only the information that is missing.
- If an asset file has no version field, read it as the compatible legacy format described in the migration notes. Do not rewrite it only to add a version.
- If a new release only adds workflow rules, update the skill. Existing pages do not need to be rebuilt.
- If the asset schema actually changed, explain the impact first, preserve unknown fields and user-authored content, then run an idempotent migration.
- Get explicit approval before changing a global theme, deleting asset fields, or rewriting pages in bulk.

## 4. Project mode and themes

Record the actual project mode in `ui-design/manifest.yaml`:

- `admin`: an administrative console is the default visual language.
- `visualization`: large-screen, map, or monitoring visualization is the default visual language.
- `hybrid`: admin and visualization coexist. Register the two component sets and themes separately.

Do not infer the mode from the project name alone. Scan routes, pages, UI libraries, and existing styles. If the evidence is insufficient, ask the project owner.

A hybrid project may share Element Plus behavior underneath, but lists, forms, menus, and overlays use the wrapper and theme root of their own profile. Overlay components may be teleported to `body`. Connect their theme through a public interface such as a component class or an append target.

## 5. Initialize missing project UI assets

Initialize assets only when the manifest or an asset file is actually missing. Scan the real project:

1. Tech stack and frontend root.
2. Installed component libraries, icon libraries, and theme entry points.
3. CSS, SCSS, CSS Modules, Tailwind, global variables, and Design Tokens.
4. Layouts, page patterns, and components that are already reused.
5. Admin and visualization profiles, and the boundary between their themes.

Register only real components and tokens that can be verified. Mark unknown fields as `unknown`. Label planned components separately from implemented ones. Initializing UI assets does not by itself require changing application code.

## 6. Prefer the component library and shared wrappers

Read the Component Registry and the source before choosing a control:

1. An existing project wrapper for the current profile.
2. An installed component-library control, with the project's theme defaults.
3. A composable project primitive.
4. A new shared wrapper when the pattern is stable across pages, or when the user asks for one.
5. A page-local implementation for a structure that is unique to that page.

When the project uses Element Plus, prefer reuse for common forms, inputs, selects and tree selects, buttons, tables, pagination, menus, dialogs, and feedback. Element Plus supports global or local CSS variables and SCSS theme variables. In a hybrid project, limit the scope of those variables. Do not let one page's styles override every `.el-*` component globally.

A shared table such as `BaseTable` should define its theme, column configuration, selection, pagination, loading, empty state, and slots. A default page reuses that visual treatment. The Page Schema still lists the concrete fields, columns, actions, and data states. The table component owns presentation and interaction. The page or data layer owns the API.

Create a wrapper only when it provides stable defaults, a business constraint, theme isolation, or reuse across pages. Keep the API composable. Do not build an overly generic component for a single page.

### Default relationship between a reference and project consistency

Shared components render with the theme registered for the project. The reference determines overall layout, information, and content relationships. If a reference list looks different from `BaseTable`, keep the `BaseTable` treatment. Use a named variant or a page theme only when the user explicitly asks for reference fidelity on the current page, or asks to change the global or local list theme.

## 7. Choosing icons

Look for design source files or the project icon library first. Next, choose a close icon from an icon library. Draw an SVG for a simple icon that must scale or take a theme color. Crop a PNG from a prototype screenshot only when no source asset exists, the exact shape matters, and the icon is small and used at a fixed size. Record the semantic name, source, and path of reusable icons. Do not treat cropped screenshots as the default icon system.

## 8. Workflow for a new page

Give the agent the requirements and the reference, and ask for a page analysis first:

```text
Use the UI Design Skill. Analyze the reference and implement the page.
First read the project manifest, Design Tokens, Component Registry, related Page Schemas, and the component-library and icon rules. Preserve those existing assets.
From the project profile, analyze Layout, Main, Section, Grid, Form, and Table. Decide whether the page is viewport-locked or content-driven. If it is viewport-locked, define the root size, fixed regions, and remaining content area, and name which region owns vertical scrolling and which owns horizontal scrolling. Check the minimum size of Grid and Flex children so they do not unexpectedly stretch the document. Record important sizes and scroll ownership in layout.sizing under ui-design/page-schema/. Then map reusable components, themes, and icons.
Keep the registered shared-component theme by default. If a local style in the reference conflicts with it, record the conflict and follow the project theme. Create a constrained variant only when I explicitly ask for high-fidelity reproduction.
Implement the page only after the schema is confirmed. Prefer project wrappers and the component library. Do not reimplement the visual treatment of a registered component, and do not put data requests inside a generic UI component.
After implementation, preview the page in a browser. Screenshot and correct layout, components, theme states, overlays, icons, and responsive behavior. For a viewport layout, check at least desktop, the target narrow width, and a short viewport. Confirm that the header stays fixed, the content region scrolls, a wide table scrolls horizontally inside itself, and the document does not overflow unexpectedly.
```

If the user asks for a structure review first, generate only the schema and wait for approval before writing code.

## 9. Visual checks

Check page structure, profile, shared-component usage, table and form states, icon sources, theme variables, dialogs and dropdown overlays, responsive layout, and real data states. Verify against the user's chosen `system-first` or explicit `reference-match` goal. When a screenshot shows a problem, fix structure and component mapping before tokens and local styles.

## 10. Responsibilities of project assets

| File | Responsibility |
|---|---|
| `manifest.yaml` | Skill release, asset schema, project mode, and theme / component-library boundaries |
| `design-token.yaml` | Long-lived visual variables for the project and each profile: color, type, spacing, radius, and similar values |
| `component-registry.yaml` | Real components, states, purposes, variants, contracts, and theme scope |
| `page-schema/*.yaml` | One page's structure, columns and fields, interactions, component mapping, icons, and page-level exceptions |
| Frontend source | Actual component implementations, page code, and backend data integration |

Generic skill rules do not override what the project actually implements. A registry path must be verifiable in the code.
