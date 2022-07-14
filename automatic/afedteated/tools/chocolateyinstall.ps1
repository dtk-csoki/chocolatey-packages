$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '5b47bad5aa64afd1123733579dd8a62d5713fd8686ee948c89634881658aa538cff0e600a8d699b46d5bcd3fe58ef6d7c936bf4b175f4949fb9028fd8077cc8c'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
