$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://download.xnview.com/XnShellEx.zip'
  checksum      = '02f4f26c04200ad060f1102bb63ad7fc9f3bff1b15600b60785a8a0d7cb22ea0'
  checksumType  = 'sha256'
  
  url64         = 'https://download.xnview.com/XnShellEx64.zip'
  checksum64    = '4f3cca971039eadf638a868db621d69bb0e8553ef8a55f058f09970c6ca809d1'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Start-Process 'regsvr32' -ArgumentList "/s $toolsDir\XnShellEx\XnViewShellExt64.dll"
