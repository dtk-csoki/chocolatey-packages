$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PSPad editor'
  fileType       = 'exe'

  url            = 'https://www.pspad.com/files/pspad/pspad507_setup.exe'
  checksum       = 'df5e81478b6f5e5a765c7eaa9b925acd820c9b6080d68a2a29cfab5a9beafaf0'
  checksumType   = 'sha256'

  url64          = 'https://www.pspad.com/files/pspad/pspad507_x64_setup.exe'
  checksum64     = '826b6dcb1136e42c280d47013706173e1e5769082a83ec01256749cff35903d8'
  checksumType64 = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
