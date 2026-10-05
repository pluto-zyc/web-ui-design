# Consistency

## Decision priority

An explicit page-level product requirement comes before the current project profile and registered themes, then existing page patterns, then incidental details in the reference, then skill defaults.

By default, the reference follows the project's shared themes for buttons, forms, lists, menus, icons, and dialogs. Page structure and information still follow the reference. Create or switch to a named component variant or page theme only when the user explicitly asks for high-fidelity reproduction of that page, or explicitly asks to change the theme. Do not change global rules implicitly.

## Project mode

Register theme profiles separately for admin, visualization, and hybrid projects. In a hybrid project, keep admin and visualization wrappers isolated. Do not apply a global override to a shared underlying component when that override belongs to only one profile.

## Typography

- A typeface already set by the user or the project takes priority. When no default font is set, recommend Alibaba PuHuiTi 3.0 as the primary typeface for the whole site.
- Design Tokens, body text, forms, lists and tables, dialogs, and the component library share the same font source. For Element Plus, map `--el-font-family` to the project font token.
- Keep one primary typeface in the usual case. Add at most one secondary typeface, and only when it has a clear purpose. Icon fonts, code, and other specialized glyph systems keep their own fonts.
- Declaring a CSS `font-family` does not by itself deliver the font. If the target environment cannot be relied on to have the font installed, verify the source and license before shipping the original font files with the project. Keep any required full license notice and the source or checksum record. Do not convert or subset the font files on your own.
- Global font rules cover page text and the component library, and must not break icon glyphs. Charts, canvas, and similar surfaces need an explicit font setting.

## Tokens and components

Read colors, type, spacing, radius, shadow, breakpoints, and components that already exist. Mark a value that cannot be confirmed from the project as `unknown`. Label the source and scope of a new target value taken from a reference. Do not present it as an existing project rule.

Promote a rule to a project-level asset only when it is repeated and stable. Leave a special visual detail that appears on one page in that page's local scope.
