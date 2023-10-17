$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '1325b385c794b4e5983f6fcacdc7534a78b5c05b4da9baf1d210d30936e6eadd99fa496ebe9c98096ae0e6565ac23f817c108285fef0101e4fdfd008dfb3c56b'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
