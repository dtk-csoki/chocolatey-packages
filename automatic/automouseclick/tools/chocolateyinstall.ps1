$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.murgee.com/auto-mouse-click/download/setup.exe'
  checksum     = '4042C221B8CB764EE75177014BACC218238E6E9BC91FAE10882B478E289BCEC6'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
