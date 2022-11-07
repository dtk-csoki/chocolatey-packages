$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://github.com/asciidocfx/AsciidocFX/releases/download/v1.8.2/AsciidocFX_Windows.exe'
  checksum      = '738413d42a8ddf03288b2919e4885f9dc83122691b2ec352d1bb00ac65c3be7a'
  checksumType  = 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
