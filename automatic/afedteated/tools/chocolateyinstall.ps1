$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '7c359744cb9fe71de4ae9eff33254530ee29090053c087766d87111f3a2f3db4be7bf3412ee99b113f0787cfac188d5297c34f52c5f506b66cadc30ecfee6912'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
