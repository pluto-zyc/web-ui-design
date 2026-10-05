# Visual verification

Check at least:

- Page structure, layout, and information hierarchy
- Whether the project profile is correct, and whether admin and visualization themes stay isolated
- Whether registry components and the component library match the mapping
- Whether tables, forms, buttons, menus, and dialogs follow the registered shared theme
- Table fields, control states, actions, and data density
- Color, contrast, type, spacing, radius, and shadow
- Theme and stacking of overlays such as dropdowns, tooltips, and dialogs after they open
- Icon source, silhouette, stroke, size, and state color
- Behavior on desktop, at the target responsive breakpoints, and in a short viewport
- For a viewport-locked layout, that the root height is definite, fixed regions stay stable, and the content region fills the remaining height
- That vertical and horizontal scrolling sit in the expected containers, and that the document does not overflow unexpectedly. A wide table should scroll inside the table region.
- Whether unregistered hardcoded values or global component style overrides were introduced

If project theme takes priority, do not treat a local component-style difference from the reference as a defect. Still check that layout, content, size, and interaction match. If the user chooses the high-fidelity exception, verify against that mode and limit the style scope.
