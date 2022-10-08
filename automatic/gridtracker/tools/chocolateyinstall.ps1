$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://storage.googleapis.com/gt_download/v1.22.1008/GridTracker-Installer.1.22.1008.exe'
  checksum     = 'd55c4bf86dce1f2aab2d7950fb5db180b739ce589f060b924bd7bec0690a1806'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
