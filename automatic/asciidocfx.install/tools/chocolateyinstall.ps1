$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://github.com/asciidocfx/AsciidocFX/releases/download/v1.8.9/AsciidocFX_Windows.exe'
  checksum      = '17253d05ef23f177bd8ec5d3f54a2f5f7fd7dfc747db0161f616f29e4e863dad'
  checksumType  = 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
