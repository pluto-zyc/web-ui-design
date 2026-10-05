# Icon asset strategy

Icon reproduction has to stay faithful to its source, visually consistent, sharp when scaled, and able to take state colors. Search in this order:

1. SVG, icon font, source-project export, or an existing project asset delivered by design.
2. A visually compatible icon from the project's installed icon library.
3. A drawn SVG for a small number of simple, distinctive icons that must respond to color and size.
4. A PNG cropped from the reference only when the reference is the only source, the shape must match the original, and the icon is small and used at a fixed size.

Cropping a screenshot is a fidelity exception. It is not a suitable default for a system icon set. Background, edge antialiasing, and compression artifacts from the screenshot can enter the image together. Scaling distorts it, and it cannot be recolored cleanly for states such as online and offline.

A hand-drawn SVG should use a consistent viewBox, grid, stroke width, line cap, line join, and color strategy. Mark it as reproduced only when the shape is confirmed to be close. Otherwise record it as an approximation. Do not slice an entire reference into many small images with opaque backgrounds just to save time.

For a reusable icon, record its semantic name, file path, source type, applicable states, default size, and whether it can take a theme color in the Component Registry or an icon manifest. A Page Schema should reference the semantic name, not a hardcoded temporary icon path.
