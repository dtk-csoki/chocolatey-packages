$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.5.1/genymotion-3.5.1.exe'
  checksum     = '@{Algorithm=SHA256; Hash=D9F7BFA3E32501C00612EAE55BCCEFEBA5F285E250896F919C2698A826C3F885; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
