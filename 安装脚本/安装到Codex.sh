#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="$(pwd)"

mkdir -p "$TARGET/.agents/skills/ui-design"
cp -R "$PROJECT_DIR/技能/ui-design/." "$TARGET/.agents/skills/ui-design/"

echo "UI Design Skill v$(cat "$PROJECT_DIR/技能/ui-design/VERSION") 已安装到 Codex。"
echo "项目 ui-design/ 资产与页面代码未被修改。"
