$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2024.1-Setup.exe'
  checksum      = '64d9f20671f0a30cfdb9326c964622efe793d4d44bf208c6167ab7a7337ec967'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
