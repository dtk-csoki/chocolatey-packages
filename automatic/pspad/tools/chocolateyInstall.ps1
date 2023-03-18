$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PSPad editor'
  fileType       = 'exe'

  url            = 'https://www.pspad.com/files/pspad/pspad507_setup.exe'
  checksum       = 'c9a743c79b3fc79b39cfc96441501abc119d724bb1dc7de76d4c97643d0974e2'
  checksumType   = 'sha256'

  url64          = 'https://www.pspad.com/files/pspad/pspad507_x64_setup.exe'
  checksum64     = '19dfa64c30ce5170c80f58406a747844578ac8fd66fc628ba238d25bdf9c3f68'
  checksumType64 = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
