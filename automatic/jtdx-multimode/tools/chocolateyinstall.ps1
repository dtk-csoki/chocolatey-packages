$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = "$toolsDir\jtdx-2.2.159-32A-win32.exe"
  file64        = "$toolsDir\jtdx-2.2.159-32A-win64.exe"
  silentArgs    = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
