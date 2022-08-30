$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/shell-win/v4.4.159/Stremio+4.4.159.exe'
  checksum     = '7f0dad4a060c28c468a0050650a682b6f1c51039bd14e2d44883368e47d7e638'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
