$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/shell-win/v4.4.164/Stremio+4.4.164.exe'
  checksum     = '9d75fe5f5faa684e8d3f65216358b225e8a1b5415822f4308caaa7a35c56f094'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
