$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://api.ivao.aero/v2/softwares/altitude/5/files/latest/download'
  checksum      = '7c7f6c6f87377cc289e6f0c0a8f9d2c8bceb1d045bfb57b2e00eb2cbd39f8689'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyZipPackage @packageArgs

$exe_file = (Get-ChildItem -Recurse $toolsDir\IVAO_Pilot_MSFS2020_*.exe).fullname | Select -First 1

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = "$exe_file"
  silentArgs    = '/S'
}

Write-Warning "The installation takes several dozens of minutes while MTL libraries are downloaded."

Install-ChocolateyInstallPackage @packageArgs
