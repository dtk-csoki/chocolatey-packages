$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/shell-win/v4.4.168/Stremio+4.4.168.exe'
  checksum     = '44ecc6a7624b2fdf03cb9b419f111892515fb036fe23f88e51456dce69066046'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
