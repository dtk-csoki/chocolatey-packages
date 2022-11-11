$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url			= 'http://tonnesoftware.com/downloads/LCinstall286.exe'
  checksum		= '6dcc47cf379b2b39377833bb379028c7d17ba3c4b11878553637f72a39407f2c'
  checksumType	= 'sha256'

  validExitCodes= @(1)
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
