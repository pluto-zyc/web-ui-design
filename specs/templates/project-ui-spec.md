# Project UI specification

> This file is a template for a project-level specification. Maintain the actual tokens and component information in the YAML files.

## Assets

- `ui-design/manifest.yaml`
- `ui-design/design-token.yaml`
- `ui-design/component-registry.yaml`
- `ui-design/page-schema/`

## Project mode and priority

The project should declare `admin`, `visualization`, or `hybrid`, and register component and theme boundaries separately for a hybrid project.

An explicit page requirement comes before the project profile and design system, then project components, then existing page patterns, then local details in the reference, then skill defaults.
