$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.genymotion.com/releases/genymotion-3.6.0/genymotion-3.6.0.exe'
  checksum     = '@{Algorithm=SHA256; Hash=FB8F02459CB5EF092B23EC44BA1FCE797A5672E00D57ECF6EDA13CF92317A02F; Path=C:\Users\appveyor\AppData\Local\Temp\1\genymotion.exe}'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
