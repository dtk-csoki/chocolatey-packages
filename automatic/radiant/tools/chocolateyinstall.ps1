$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2022.1.1-Setup.exe'
  checksum      = 'be4b5b8a0b6acca5cd23500b7552156d154360bd16c66ab9b2e1b971acbbe401'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
