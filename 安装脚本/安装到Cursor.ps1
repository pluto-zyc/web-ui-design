$Project = Split-Path -Parent $PSScriptRoot
$Target = Get-Location
$Version = (Get-Content -Raw "$Project/技能/ui-design/VERSION").Trim()
New-Item -ItemType Directory -Force -Path "$Target/.cursor/rules" | Out-Null
New-Item -ItemType Directory -Force -Path "$Target/.cursor/skills/ui-design" | Out-Null
Copy-Item "$Project/平台适配/Cursor/ui-design.mdc" "$Target/.cursor/rules/ui-design.mdc" -Force
Copy-Item "$Project/技能/ui-design/*" "$Target/.cursor/skills/ui-design" -Recurse -Force
Write-Host "UI Design Skill v$Version 已安装到 Cursor。"
Write-Host "项目 ui-design/ 资产与页面代码未被修改。"
