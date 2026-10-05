# Component reuse

Component mapping priority:

1. An existing project wrapper in the current profile whose contract matches
2. A component-library control for the current profile, with the project's theme defaults
3. An existing composable project primitive
4. A new project wrapper when reuse is stable
5. A page-local implementation only for a structure unique to that page

The registry must distinguish components that already exist, components that were added and implemented, and planned candidates. Do not list a planned component as one that can already be called.

A new wrapper must state its profile, stable contract, default theme, variants, how it differs from existing components, whether it is decoupled from the backend, and why it is reused. For a one-off structure that changes only one page, compose existing components. Do not extend the shared abstraction.

The registry states the behavior and theme ownership of general components such as tables, forms, and menus. When a new Page Schema references those components, it configures only that page's fields, columns, actions, data states, and slots. It does not redescribe the whole repeated visual treatment.
