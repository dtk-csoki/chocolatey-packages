$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Remove registry changes.
Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyuninstall.ahk`""
$targetPath = (Get-ChildItem -Path "$toolsDir" -Filter "LEinstaller.exe").FullName
Start-ChocolateyProcessAsAdmin -ExeToRun "$targetPath"

# Remove link in start menu.
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Locale Emulator GUI.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }