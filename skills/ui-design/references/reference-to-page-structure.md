# From a reference image to page structure

## Principle

A reference image is visual evidence first. It is not a code structure that can be copied directly.

## Analysis order

1. Overall page size and layout direction. Decide whether the layout is viewport-locked or content-driven.
2. Root size, fixed regions, remaining content area, and ownership of vertical and horizontal scrolling.
3. Header, sidebar, and main.
4. The page header inside main.
5. Sections.
6. Layouts such as grid, flex, and table, and the boundaries that are allowed to shrink.
7. Concrete components.
8. Content hierarchy.
9. Visual tokens.

## Output

Write the page-level Page Schema first, then implement the code.
