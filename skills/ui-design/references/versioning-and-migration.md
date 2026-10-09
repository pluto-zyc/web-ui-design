# Versioning and migration

The skill release and the project asset schema are versioned separately. The component-library version remains managed by the project's package manifest.

## Project asset manifest

`ui-design/manifest.yaml` at the project root records installation and schema information, for example:

```yaml
manifestVersion: 1
skill:
  name: UI-Design-Skill
  version: 0.6.1
uiAssetSchemaVersion: 1
projectMode: hybrid
defaultTheme: admin
componentLibraries:
  - name: element-plus
    versionSource: front_end/package.json
```

A real project should fill in values that were actually detected. Use `unknown` for uncertain values. The skill installer updates only the platform skill and rule directories. It does not create or overwrite the project's `ui-design/` directory.

## Upgrade behavior

1. Compare the installed skill version, the project manifest version, the existing assets, and the real code.
2. Read and keep existing assets first. Parse an unversioned historical Page Schema with the current compatibility rules. Do not rewrite it because a field is missing.
3. Run a migration only for an asset-schema change that is actually required. The migration must be incremental and idempotent, and it must preserve unknown fields and user edits.
4. When a release only adds behavioral rules, update only the skill files. Do not regenerate page code, Design Tokens, the registry, or Page Schemas.
5. Before a breaking migration, deleting fields, changing the global theme, or redoing finished pages in bulk, explain the impact and get explicit approval.
6. After the migration, update the skill version and the asset schema version in the manifest, and report what was preserved, what was migrated, and what is still pending.

A patch or minor skill upgrade is not an asset-schema upgrade. Raise `uiAssetSchemaVersion` only when the YAML structure has a compatibility change, and provide migration notes from the current format to the target format.
