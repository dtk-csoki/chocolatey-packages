$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = (Get-ChildItem -Recurse -Path "$toolsDir\*.zip").FullName
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Extraterm.lnk"
$targetPath = (Get-ChildItem -Recurse -Include 'extratermqt.exe' -Path "$toolsDir").FullName

Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"
