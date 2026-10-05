# Page Schema

A Page Schema describes a page's structure and component relationships. It does not describe every final CSS rule.

Recommended structure:

```text
Page
└── Layout
    ├── Header
    ├── Sidebar
    └── Main
        ├── PageHeader
        ├── Section
        │   └── Grid / Flex / Card
        └── Section
            └── Table / Form / List
```

The schema should be able to answer:

- Which regions does the page have?
- How are the regions nested?
- Which component does each region use?
- Where is a new component required?
- Which structures correspond to the reference?
- Is the page viewport-locked or content-driven? Which region owns fixed areas, the remaining area, and vertical and horizontal scrolling?

When the page uses a viewport-locked layout, or when layout or content has a clear overflow boundary, record the root sizing strategy, fixed regions, remaining content area, and the owners of vertical and horizontal scrolling in `layout.sizing`. This field is optional. A simple natural document flow does not need it. It describes layout responsibility. It does not prescribe a CSS implementation.
