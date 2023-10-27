. (Join-Path $PSScriptRoot "functions.ps1")

$env:PATH = "$(Join-Path $HOME .local bin)"

Set-PSReadLineKeyHandler -Key Ctrl+h -Function BackwardKillWord

if (get-command oh-my-posh -ErrorAction Ignore)
{
  oh-my-posh init pwsh --config "$(oh-my-posh cache path)/themes/paradox.omp.json" | Invoke-Expression
}

# requires a nerd font
# https://www.nerdfonts.com/font-downloads
Import-Module -Name Terminal-Icons -ErrorAction Ignore
