. (Join-Path $PSScriptRoot "functions.ps1")

$gitScriptsPath = Join-Path $PSScriptRoot "..\git-scripts" | Resolve-Path
$env:Path += ";$gitScriptsPath"

Set-Alias subl 'C:\Program Files\Sublime Text 3\sublime_text.exe'

Set-PSReadLineKeyHandler -Key Ctrl+h -Function BackwardKillWord

Import-Module posh-git
Import-Module oh-my-posh

$ThemeSettings.MyThemesLocation = Join-Path $PSScriptRoot "themes"

Set-Theme EditedParadox