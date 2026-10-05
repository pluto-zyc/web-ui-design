$Project = Split-Path -Parent $PSScriptRoot
$Target = Get-Location
$Version = (Get-Content -Raw "$Project/skills/ui-design/VERSION").Trim()
New-Item -ItemType Directory -Force -Path "$Target/.cursor/rules" | Out-Null
New-Item -ItemType Directory -Force -Path "$Target/.cursor/skills/ui-design" | Out-Null
Copy-Item "$Project/platforms/Cursor/ui-design.mdc" "$Target/.cursor/rules/ui-design.mdc" -Force
Copy-Item "$Project/skills/ui-design/*" "$Target/.cursor/skills/ui-design" -Recurse -Force
Write-Host "UI Design Skill v$Version installed for Cursor."
Write-Host "Project ui-design/ assets and page code were not modified."
