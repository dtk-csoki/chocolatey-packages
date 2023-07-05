$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '544b9fecc1923d12ae027b48383fe4811b3684d7ddd797b2096b10a35fe9a1670d125110f4a2e77222bd6d434681af738cc519be326bfcc551e3fd141a27e663'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
