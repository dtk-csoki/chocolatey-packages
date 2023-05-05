$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = "$toolsDir\extratermqt-setup-0.71.1.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
