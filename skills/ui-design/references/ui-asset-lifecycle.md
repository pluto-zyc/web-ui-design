# Project UI asset lifecycle

## First onboarding

Inspect `ui-design/manifest.yaml` and the existing UI files. Initialize from project code, themes, and components only when an asset is missing. Existing assets are long-lived project records. Read them first and maintain them incrementally.

The project manifest must at least record the skill version, the UI asset schema version, the project mode, and the default theme. Read the component-library name and version from the actual frontend package manifest.

## Day-to-day page development

New reference → read the manifest, tokens, registry, and related schemas → analyze the page → Page Schema → map components and themes → code → visual verification.

Each page gets its own Page Schema. Do not regenerate shared Design Tokens, the Component Registry, or global components for every page.

## Skill upgrades

An install or upgrade replaces only the skill and rule files for platforms such as Cursor and Codex. It does not touch project UI assets or page code. A new release first identifies the installed version and the asset schema. A rule update changes behavior only. A schema change is what runs a compatible migration.

A migration must preserve user fields and code. Prefer idempotent, backward-compatible added fields. Changing themes in bulk, deleting fields, or rewriting pages requires explicit approval.

## How assets evolve

A project pattern that recurs and stays stable can enter the Component Registry. Update Design Tokens when a stable visual language has formed. Leave a one-off page detail in that page's configuration or in a local implementation.
