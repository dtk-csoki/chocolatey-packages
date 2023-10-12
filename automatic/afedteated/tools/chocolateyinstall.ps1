$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '487c19e75c4ebbec3a0675e282261d1f392dc058e3a647d74c8e4225fc3702f1ce7b58b3914f2d4853deb30b06662545efdef9dc7c2275a9539fc53cf3417b54'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
