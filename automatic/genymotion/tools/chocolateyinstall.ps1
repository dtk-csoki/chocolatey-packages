$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.3.2/genymotion-3.3.2.exe'
  checksum     = '@{Algorithm=SHA256; Hash=990A701C4F22EC552BABFE29DB85CE3125035DB9877041DBE6C673C90C456CF5; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
