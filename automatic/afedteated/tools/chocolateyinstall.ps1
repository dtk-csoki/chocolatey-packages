$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '8a33dc6312be41d585a76d0055c5f50a937445547fb4064327749b120fe2099b008b224e2a86477a66d676a5d59b60fb52f4b081ac448e179dc7d1c50d9fd368'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
