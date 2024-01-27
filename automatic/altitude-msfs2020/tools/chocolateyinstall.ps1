$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://api.ivao.aero/v2/softwares/altitude/5/files/latest/download'
  checksum      = '789762bfdc98f5a378770dc9300d57a4b1c5bd5684d75e8c58c95bb8b994cd87'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Write-Warning "The installation takes several __DOZENS__ of minutes while MTL libraries are downloaded."

#Install-ChocolateyInstallPackage @packageArgs
Install-ChocolateyPackage @packageArgs
