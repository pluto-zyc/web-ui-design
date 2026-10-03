#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="$(pwd)"
VERSION="$(cat "$PROJECT_DIR/技能/ui-design/VERSION")"

mkdir -p "$TARGET/.cursor/rules"
mkdir -p "$TARGET/.cursor/skills/ui-design"

cp "$PROJECT_DIR/平台适配/Cursor/ui-design.mdc" "$TARGET/.cursor/rules/ui-design.mdc"
cp -R "$PROJECT_DIR/技能/ui-design/." "$TARGET/.cursor/skills/ui-design/"

echo "UI Design Skill v$VERSION 已安装到当前 Cursor 项目：$TARGET"
echo "已安装：.cursor/rules/ui-design.mdc"
echo "已安装：.cursor/skills/ui-design/"
echo "项目 ui-design/ 资产与页面代码未被修改。"
