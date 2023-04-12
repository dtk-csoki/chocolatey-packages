$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2023.1-Setup.exe'
  checksum      = 'be58137b61b9713a796e4a6efa993eb1b1b12fea5a27c92057374deffb880a0c'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
