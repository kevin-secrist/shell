$SettingsDirectory = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
$LocalSettingsFile = Join-Path $PSScriptRoot "settings.json"
Move-Item "$SettingsDirectory\settings.json" "$SettingsDirectory\settings.backup.json" -Force
New-Item -ItemType SymbolicLink -Name settings.json -Path $SettingsDirectory -Value $LocalSettingsFile
