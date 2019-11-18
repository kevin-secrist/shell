function up
{
    param([int] $levels = 1)
    while ($levels -gt 0)
    {
        cd ..
        $levels--
    }
}

function Get-AssemblyName
{
    [CmdletBinding()]
    param([string] $Path)
    $Path = Resolve-Path $Path
    [System.Reflection.AssemblyName]::GetAssemblyName($Path)
}

function Get-Base64DecodedString
{
    [CmdletBinding()]
    param([Parameter(ValueFromPipeline=$true)] [string] $String)
    try {
        [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($String.Trim()))
    }
    catch {
        try {
            [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($String.Trim()+"="))
        }
        catch {
            [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($String.Trim()+"=="))
        }
    }
}

function Get-DecodedJwt
{
    [CmdletBinding()]
    param([Parameter(ValueFromPipeline=$true)] [string] $String)

    $String -split "\." | foreach {
        try {
            Get-Base64DecodedString $_ | ConvertFrom-Json | ConvertTo-Json
        }
        catch { }
    }
}

function Get-Framework
{
    Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse | `
        Get-ItemProperty -name Version,Release -EA 0 | `
        Where {$_.PSChildName -match '^(?!S)\p{L}'} | `
        Select PSChildName, Version, Release
}

###########################
##   Extract-Icon
##   Usage:
##      Extract-Icon -file C:\windows\system32\notepad.exe -saveTo c:\icons -ext ico

function Extract-Icon($file){
    [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file)
    [System.Drawing.Icon]::ExtractAssociatedIcon($file).ToBitmap().Save(".\$BaseName.ico")
}