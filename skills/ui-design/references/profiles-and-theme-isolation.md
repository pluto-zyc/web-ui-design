# Project profiles and theme isolation

The project-level `ui-design/manifest.yaml` may declare `projectMode` and the default theme. Available modes:

- `admin`: an administrative console is primary, and the admin component theme is the default.
- `visualization`: monitoring screens, GIS, or operations visualization is primary, and the visualization component theme is the default.
- `hybrid`: admin and visualization pages coexist. Register their component sets and theme boundaries separately.

Infer the mode from real pages, routes, styles, and components first. If the evidence is insufficient and the choice would change which page styles are used, ask the user. Do not decide from the project name alone.

## Admin pages

These usually use Element Plus or an equivalent component library already registered by the project. Common tables, forms, menus, dialogs, and action controls follow the admin theme, and prefer registered wrappers such as `BaseTable` and `BaseForm`.

## Visualization pages

A visualization project may still use filter forms, tree selects, lists, and dialogs. It may reuse Element Plus accessible interaction and data behavior, but it should use wrappers or a local theme from the visualization profile. Wrap a list that appears only on visualization pages as a visualization-specific component, so it does not inherit the admin appearance globally.

## Hybrid projects

Admin pages keep the admin theme. Map, monitoring, and control pages use a separate visualization theme. One underlying component library can serve both profiles, but theme tokens, shared wrapper names, and overlay style boundaries must be explicit. The manifest decides the default page theme. An individual Page Schema may declare a profile override.

## Reference priority

By default, use the project component theme to unify buttons, forms, lists, icons, and dialogs. The reference expresses region structure, information, content hierarchy, and necessary states. When the user explicitly asks for visual fidelity to the reference on that page, the difference may be implemented in a named page variant or theme. Do not change the project's global theme silently.
