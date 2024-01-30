$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'fb033025fededed998400c43e132dc6334728e31109c7a4f35cf0c00c0b2b78308f0a01f79436ac101988ef48f32256f2ebfd6f66b3c47fcbbfb1279f6524ecc'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
