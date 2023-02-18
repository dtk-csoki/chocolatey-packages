$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://api.ivao.aero/v2/softwares/altitude/5/files/latest/download'
  checksum      = '5783ee8e9a3262f9660008a663163e0d0a675f57b4e5d5be62a994d528aeede4'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Write-Warning "The installation takes several __DOZENS__ of minutes while MTL libraries are downloaded."

#Install-ChocolateyInstallPackage @packageArgs
Install-ChocolateyPackage @packageArgs