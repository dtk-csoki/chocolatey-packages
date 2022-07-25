$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://storage.googleapis.com/gt_download/v1.22.0725/GridTracker-Installer.1.22.0725.exe'
  checksum     = '5dfa352e69ce6a0d207c17a5929735f3f56cd0a7918e605fe6c006ee8ec5bb1f'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
