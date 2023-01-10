$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '698edd2403fc19e97e7029a38465993efe760d374e29495b84c93556fd86038927db6ca95ac612a5184df1ffbd9a90d01c0f76a0804d2af008e9e7b94d764fe3'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
