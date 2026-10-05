$Project = Split-Path -Parent $PSScriptRoot
$Target = Get-Location
$Version = (Get-Content -Raw "$Project/skills/ui-design/VERSION").Trim()
New-Item -ItemType Directory -Force -Path "$Target/.agents/skills/ui-design" | Out-Null
Copy-Item "$Project/skills/ui-design/*" "$Target/.agents/skills/ui-design" -Recurse -Force
Write-Host "UI Design Skill v$Version installed for Codex."
Write-Host "Project ui-design/ assets and page code were not modified."
