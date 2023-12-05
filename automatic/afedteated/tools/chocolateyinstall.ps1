$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '769904814d0779a58568b741decb76f25b9ea91367887bfdd5fd290e0db9ce0f20207dad81db9cb41249d25efb9a610f79bc2488bdc695dcbe117c5a3c89c27b'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
