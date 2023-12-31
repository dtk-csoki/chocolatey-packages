$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://api.ivao.aero/v2/softwares/altitude/5/files/latest/download'
  checksum      = '7ba2d77bff2301b735171893c9610881aec26c2210f11942159373842de5c6e9'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Write-Warning "The installation takes several __DOZENS__ of minutes while MTL libraries are downloaded."

#Install-ChocolateyInstallPackage @packageArgs
Install-ChocolateyPackage @packageArgs
