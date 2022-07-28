$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2022.1-Setup.exe'
  checksum      = '6993cd2ab9352539674481a60773db93aaa297ea324a51b485a9e440ecbbfc0d'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
