$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.3.3/genymotion-3.3.3.exe'
  checksum     = '@{Algorithm=SHA256; Hash=E32346C68FAD3A7A06F9948BF4D08186DF60EC0A89F428A1E59D3611A7FD24E2; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
