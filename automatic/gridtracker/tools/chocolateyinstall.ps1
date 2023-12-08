$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.23.1207/GridTracker-Installer.1.23.1207.exe'
  checksum     = 'de3a2fb93d32fa41e2f5a558fde3123b469bb8f33cf89366a6195bd894b8ebb1'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
