$Project = Split-Path -Parent $PSScriptRoot
$Target = Get-Location
$Version = (Get-Content -Raw "$Project/skills/ui-design/VERSION").Trim()
New-Item -ItemType Directory -Force -Path "$Target/.claude/skills/ui-design" | Out-Null
Copy-Item "$Project/skills/ui-design/*" "$Target/.claude/skills/ui-design" -Recurse -Force
Write-Host "UI Design Skill v$Version installed for Claude Code."
Write-Host "Project ui-design/ assets and page code were not modified."
