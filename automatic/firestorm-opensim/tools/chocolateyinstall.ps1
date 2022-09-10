$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Release-6-6-3-67470_Setup.exe'
  checksum       = '147a87be07b6a7c83740e96a076661125ddb786e47e235cf9b83d5540bbaf1d5'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Releasex64-6-6-3-67470_Setup.exe'
  checksum64     = '971249b7b7208bfd916b942253b64f3f33cd7c861424b4ce7e26112bc3cb67ae'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
