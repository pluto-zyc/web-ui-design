# Cursor project onboarding and iteration

This guide covers project-level Cursor installation, initializing assets for a new project, iterating on pages, and upgrading the skill.

## Install or update

From the project root:

```powershell
& "D:\Tools\UI-Design-Skill\scripts\install-cursor.ps1"
```

Check `.cursor/rules/ui-design.mdc`, `.cursor/skills/ui-design/SKILL.md`, and `.cursor/skills/ui-design/VERSION`. A skill upgrade updates only these Cursor entry files. It does not touch the project's `ui-design/` assets or application pages.

## Project inspection

Ask Cursor to read `ui-design/manifest.yaml` when it exists, then inspect frontend dependencies, the component library, theme entry points, the icon library, the Component Registry, Design Tokens, and existing Page Schemas. Fill in only missing assets. Do not overwrite existing data from scratch.

The project must record `admin`, `visualization`, or `hybrid`. When admin and visualization coexist, register each component theme and the scope where it applies.

## New pages

```text
Use the UI Design Skill. First read the current project UI assets and the actual component source, then analyze the reference and create or update the Page Schema. Map the page structure to registered wrappers and the component library according to the project profile. Shared components keep the project theme by default. The Page Schema records data, columns, interactions, and icon sources. Implement only after the schema is confirmed, then preview and check components, theme isolation, overlays, and icons.
```

## Ongoing maintenance

Add a pattern to the Component Registry only when it is reused stably across pages. When unifying a component theme, update the project component or tokens. Do not require every reference page to redefine list, form, or menu styles. When reference fidelity is explicitly requested, create a named variant with a limited scope.

When upgrading the skill, check the version and the asset schema first. Migrate project assets only when the schema format changed. When a release only adds rules, keep the existing schemas and code.
