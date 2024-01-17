$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"

  url           = 'https://github.com/asciidocfx/AsciidocFX/releases/download/v1.8.7/AsciidocFX_Windows.zip'
  checksum      = '3fe670a6e7594dbf605f264e8e23253b7083c693995f810881a4a879fb1db101'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "AsciidocFX.lnk"
$targetPath = Join-Path $toolsDir "AsciidocFX\AsciidocFX.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
