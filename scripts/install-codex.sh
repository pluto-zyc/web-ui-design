#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="$(pwd)"

mkdir -p "$TARGET/.agents/skills/ui-design"
cp -R "$PROJECT_DIR/skills/ui-design/." "$TARGET/.agents/skills/ui-design/"

echo "UI Design Skill v$(cat "$PROJECT_DIR/skills/ui-design/VERSION") installed for Codex."
echo "Project ui-design/ assets and page code were not modified."
