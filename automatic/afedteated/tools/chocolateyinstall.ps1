$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '16fcf869d960a82d546fd302250985ba7e156805b7ecc07daed8db9bd69807ee5ee7532e89711ad5db32c14bf7e5d7a800439f49119595d4393b491afa3c3ca2'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
