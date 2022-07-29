$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://rx4hx.qrz.ru/files/loghx/LogHX3Setup_build_699.exe'
  checksum      = '2b7457a23dbf368045eab41f75bd0f463f4558caba131b6b2bc487a47e09344d'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
