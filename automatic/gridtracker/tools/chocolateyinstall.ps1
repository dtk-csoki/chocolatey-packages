$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://storage.googleapis.com/gt_download/v1.22.0903/GridTracker-Installer.1.22.0903.exe'
  checksum     = 'fa3b811f16e0f4410876be831030e20a930b83f783a0326f9fc576b426d483fb'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
