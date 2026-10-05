# Component library first, and wrapping

## Identifying the project library

Scan the frontend package manifest, the component registration entry, style entry points, and the code that actually uses them. Confirm the installed component library, icon library, and project wrappers. The registry records only what really exists, and distinguishes statuses such as `existing`, `added`, and `planned`.

When the project has no component library, keep using the project's own implementation. Introduce a new dependency only when the task needs it and the user allows it. The skill must not assume that every project uses the same component library.

## Use and wrapping

Prefer a project wrapper that fits the current project profile. When no wrapper exists, prefer the controls and interaction behavior of the installed component library, then apply project tokens and stable project defaults.

Create a project-level wrapper when a structure is reused across pages, has a stable appearance or business constraint, or the user asks for a shared wrapper. Examples are `BaseTable`, `AdminTable`, `VisualizationTable`, and `BaseFormField`. If an ordinary primitive only needs shared CSS variables, defaults, or the project theme, do not wrap every control in another layer.

A wrapper should:

- State the profile and visual theme it applies to.
- Keep the common props, events, and slots of the underlying component, so the wrapper can still be extended.
- Let the page or application layer supply data. The component layer owns display, interaction, and consistency.
- Expose only variants that are stable and actually needed. Do not accumulate one-off parameters.
- Confirm the source implementation, path, contract, and status before adding it to the registry.

## Lists and tables

A shared table component owns its registered default visual treatment. When a table in the reference conflicts with the project theme, keep the shared table theme. Create or select an extra variant only when the user asks for page-level reference fidelity or asks to change the list theme.

The Page Schema still describes columns, fields, sort and filter, actions, selection, pagination, and data states. The page configures the shared component through column configuration, named slots, and events. It does not reimplement the table header, row height, borders, state colors, or pagination visuals.

Cover most of the project's table cases first. Markedly different patterns, such as trees, grouped headers, editable grids, and realtime scrolling, can be a named variant or a separate component with an explicit contract. Do not force them into one `BaseTable`.

A table wrapper must not call a specific business API directly. It receives row data and column definitions, and emits events such as selection, sort, filter, and pagination. The page or data layer owns the API and permission logic.

## Theme variables and isolation

Map the component-library theme from the project Design Tokens. Besides the primary color, check hover, active, focus, disabled, border, surface, text, and semantic state colors. Do not set a single brand value and then claim that every state is unified.

When one application has both an admin theme and a visualization theme:

- Use separate theme roots, or wrappers with a namespace.
- Avoid a single-page need that globally overrides `.el-*` internal selectors.
- Prefer the component library's public props, slots, CSS variables, and class hooks.
- Keep Vue page styles `scoped` in the usual case. When an internal element must be changed, use a narrow `:deep()`.
- A component may teleport popper or dialog content to `body`. Those nodes do not inherit variables from the theme root. Connect the theme with the library's popper class, append target, or overlay class, and verify the state after it opens.

## Page and component responsibilities

The Page Schema expresses page structure and content configuration. The registry expresses the stable contract a shared component can provide. Design Tokens express global or profile theme rules. Do not promote a one-off difference from a single reference into a new global default.
