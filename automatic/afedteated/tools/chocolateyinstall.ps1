$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '6aca0b115da718dbb2c0b82abde141798aaf37b32edbba0773caf112517f7c253f0f4a8f0af57cd5773f98212468ce2f8b3aeae2c5eb82d91ab601c85b824215'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
