$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://download.xnview.com/XnShellEx.zip'
  checksum      = '3d7646da9d92c36d135660add9bcf4e37b1abda98b4d3da3dbf15c049413a390'
  checksumType  = 'sha256'
  
  url64         = 'https://download.xnview.com/XnShellEx64.zip'
  checksum64    = '1a9bc91c598653c51287dafa93009c3620b2adc868b6afa372a749cced35877d'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Start-Process 'regsvr32' -ArgumentList "/s $toolsDir\XnShellEx\XnViewShellExt64.dll"
