$Project = Split-Path -Parent $PSScriptRoot
$Target = Get-Location
$Version = (Get-Content -Raw "$Project/技能/ui-design/VERSION").Trim()
New-Item -ItemType Directory -Force -Path "$Target/.agents/skills/ui-design" | Out-Null
Copy-Item "$Project/技能/ui-design/*" "$Target/.agents/skills/ui-design" -Recurse -Force
Write-Host "UI Design Skill v$Version 已安装到 Codex。"
Write-Host "项目 ui-design/ 资产与页面代码未被修改。"
