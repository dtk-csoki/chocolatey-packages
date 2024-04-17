$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file64      = "$toolsDir\RackFree-2.5.1-win-x64.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
