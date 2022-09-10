$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Release-6-6-3-67470_Setup.exe'
  checksum       = '5300b31147e4c4f7571ab02efd38b846ad84c09e0901ef23cf0acaefd4ed00d4'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Releasex64-6-6-3-67470_Setup.exe'
  checksum64     = '32ae35819720643b3e102d72e6f3709b3b0fac9d016805edf510804d9afd7a65'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
