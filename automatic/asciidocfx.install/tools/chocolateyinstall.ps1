$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://github.com/asciidocfx/AsciidocFX/releases/download/v1.7.9/AsciidocFX_Windows.exe'
  checksum      = 'b7e5e642972cf4513aefdd82c1ea218c1eb8a7d08daffb8a4d293ff69d2d9689'
  checksumType  = 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
