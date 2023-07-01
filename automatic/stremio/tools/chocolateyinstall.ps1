$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/shell-win/v4.4.160/Stremio+4.4.160.exe'
  checksum     = 'a03c976f6323d84eebe61026c94aa060b081689d9bd1031fa9511d885924d98c'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
