# symlinks the current directory with the Windows Terminal settings directory
# symlinking individual files breaks Terminal's file-watching logic

$AppDirectory = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe"
$SettingsDirectory = "$AppDirectory\LocalState"
$BackupDirectory = "$AppDirectory\LocalState_Backup"
$LocalSettingsDirectory = $PSScriptRoot

# rename the existing LocalState directory
Move-Item $SettingsDirectory $BackupDirectory

# symlink this directory to replace the LocalState directory
New-Item -ItemType SymbolicLink -Name "LocalState" -Path $AppDirectory -Value $LocalSettingsDirectory

# copy back additional files
Copy-Item -Path "$BackupDirectory\*" -Destination $LocalSettingsDirectory -Recurse -Exclude settings.json
