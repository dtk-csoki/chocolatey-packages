$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/shell-win/v4.4.165/Stremio+4.4.165.exe'
  checksum     = 'df430e88e62b426b7c75ba29eb28eff3b77714999a28c6f9aa9172085f78cd3a'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
