$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filefullpath = "$toolsDir\SunsetScreen.exe"

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen.exe'
  checksum     = 'ab086e9a2dd73e07d844e44024c468a4335f12250f7d0763afd57161f4a79c1e'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "SunsetScreen.lnk"
$targetPath = Join-Path $toolsDir "SunsetScreen.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
