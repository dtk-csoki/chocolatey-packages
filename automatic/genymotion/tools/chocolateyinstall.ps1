$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.4.0/genymotion-3.4.0.exe'
  checksum     = '@{Algorithm=SHA256; Hash=9EB6927D656DBBCCE2E90AAE615E1D3002BE72493969DF6631A08A3278E9A29E; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
