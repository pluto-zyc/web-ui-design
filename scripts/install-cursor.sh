#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="$(pwd)"
VERSION="$(cat "$PROJECT_DIR/skills/ui-design/VERSION")"

mkdir -p "$TARGET/.cursor/rules"
mkdir -p "$TARGET/.cursor/skills/ui-design"

cp "$PROJECT_DIR/platforms/Cursor/ui-design.mdc" "$TARGET/.cursor/rules/ui-design.mdc"
cp -R "$PROJECT_DIR/skills/ui-design/." "$TARGET/.cursor/skills/ui-design/"

echo "UI Design Skill v$VERSION installed into the current Cursor project: $TARGET"
echo "Installed: .cursor/rules/ui-design.mdc"
echo "Installed: .cursor/skills/ui-design/"
echo "Project ui-design/ assets and page code were not modified."
