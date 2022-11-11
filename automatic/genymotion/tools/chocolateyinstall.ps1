$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.3.1/genymotion-3.3.1.exe'
  checksum     = '@{Algorithm=SHA256; Hash=379B161CBEFB9DDD570ADFE576E057AA42A9AE297052E2032A79744EEB76DE9A; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
