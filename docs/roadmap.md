# Roadmap

## v0.6.1

- Clarify automatic skill activation for visible UI changes.
- Add Claude Code project-local installation scripts and align platform guidance.
- Fix duplicate typography field in the Design Token template.

## v0.6.0

- Recommend Alibaba PuHuiTi 3.0 as the primary typeface when no font is specified.
- Align Design Tokens, Element Plus, forms, tables, overlays, and chart font configuration.
- Add records for font-file source and license, limits on redistributing the original font files, and a check that the font actually loads.

## v0.5.0

- Strengthen the rule to prefer the installed component library and profile-matched project wrappers.
- Add root-first analysis of viewport size, fixed regions, remaining space, and scroll ownership.
- Page Schema may optionally record the layout sizing strategy and which region owns scrolling.
- Visual verification adds checks for narrow and short viewports and for document-level overflow.

## v0.4.0

- Project-level tracking of the skill release and UI asset schema, with non-destructive upgrade rules
- `admin`, `visualization`, and `hybrid` project modes, with theme boundaries
- Component-library-first strategy and cross-page wrapper rules
- Element Plus theme variables, local scope, and isolation of teleported overlays
- Selection rules for icon source files, the project icon library, SVG, and crops from a reference image
- Cursor and Codex install entry points, with version alignment
- A maintenance handbook that separates initialization, version upgrades, and asset migration

## v0.3.0

- Project-level UI manifest
- Design Token template
- Component Registry template
- Page Schema template
- Workflow from reference image to schema, components, tokens, code, and screenshot verification
- First Cursor project-onboarding document

## Later

- Automatic token extraction
- Automatic Component Registry scanning
- A stricter JSON or YAML schema for Page Schema
- Checks for hardcoded colors and spacing
- Automated browser screenshots
- Visual diff detection
- Framework adapters such as React and Vue
- A more automated project initialization command
