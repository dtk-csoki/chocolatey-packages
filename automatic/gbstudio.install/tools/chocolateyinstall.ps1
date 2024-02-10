$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v3.2.0/gb-studio-windows-32bit-installer.zip'
  checksum      = 'ed04d4ee0de4626693aedfdfd2eebaeff5b2ff1b71d408f138026b6095c366f7'
  checksumType  = 'sha256'
  
  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v3.2.0/gb-studio-windows-64bit-installer.zip'
  checksum64    = '6602b647a2ea1a4cfff9ac1c7addbf6a1120bd88e1301a077381cb4aadd7a612'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file32      = "$toolsDir\gb-studio-master-windows_x86-squirrel\GB Studio-3.2.0 Setup.exe"
  file64      = "$toolsDir\gb-studio-master-windows_x86_64-squirrel\GB Studio-3.2.0 Setup.exe"
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs
