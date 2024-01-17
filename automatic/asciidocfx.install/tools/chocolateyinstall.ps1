$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://github.com/asciidocfx/AsciidocFX/releases/download/v1.8.7/AsciidocFX_Windows.exe'
  checksum      = 'ef342990cb847eed1adf76b225c2f020c510210650534437598bf9df17430922'
  checksumType  = 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
