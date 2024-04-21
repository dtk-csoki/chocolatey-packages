$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v3.2.1/gb-studio-windows-32bit-installer.zip'
  checksum      = '09feb3faad0dc6155e1af5848821a39acbd9dd75e1f90e69d3136118040e4146'
  checksumType  = 'sha256'
  
  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v3.2.1/gb-studio-windows-64bit-installer.zip'
  checksum64    = '6ac6faa0dea1165246afdf8a10277a616706ec9a06de9f5fba7d05a92caa4f49'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = (Get-ChildItem "$toolsDir\*\GB Studio-* Setup.exe").FullName
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs
