$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

<#$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://api.ivao.aero/v2/softwares/altitude/5/files/latest/download'
  checksum      = '5783ee8e9a3262f9660008a663163e0d0a675f57b4e5d5be62a994d528aeede4'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyZipPackage @packageArgs

$exe_file = (Get-ChildItem -Recurse $toolsDir\IVAO_Pilot_MSFS2020_*.exe).fullname | Select -First 1

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = "$exe_file"
  silentArgs    = '/S'
}#>

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
