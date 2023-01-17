$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Release-6-6-8-68380_Setup.exe'
  checksum       = '8777ea0dd08e436c0424a6b4cc0129d45a86f7e5e66f7dca8ba35a5b331e8b70'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Releasex64-6-6-8-68380_Setup.exe'
  checksum64     = 'ee9e6b4088827164d8c647db5c611c2899b1bc68b20a1005b859f17c267503c6'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
