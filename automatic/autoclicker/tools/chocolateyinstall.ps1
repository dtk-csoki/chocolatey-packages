$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = "$toolsDir\AutoClicker.exe"

  url          = 'https://freefr.dl.sourceforge.net/project/orphamielautoclicker/AutoClicker.exe'
  checksum     = '3406f9805dac7d055c2d0eb3f0c0dcd9caa18b180db46378c408a203438cb57b'
  checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Auto Clicker.lnk"
$targetPath = Join-Path $toolsDir "AutoClicker.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath