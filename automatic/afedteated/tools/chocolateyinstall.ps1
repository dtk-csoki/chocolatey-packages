$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'cd6430df089c7d6bb851b97248a7286abd5e197951c1236dbf950080322bd262f9aaee8f6b5b228ae4eef4397fa129a841b4beb4c8225b656703b2d6c9e9e2f2'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
