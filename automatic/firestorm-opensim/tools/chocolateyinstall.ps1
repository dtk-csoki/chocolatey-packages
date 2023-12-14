$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/release/windows/Phoenix-FirestormOS-Release-6-6-17-70368_Setup.exe'
  checksum       = '3a25b386880f6623eba6bf8cfe3b0595736847ede39d3782c7f9674ed59174d2'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/release/windows/Phoenix-FirestormOS-Releasex64-6-6-17-70368_Setup.exe'
  checksum64     = '87ac0fe35c17500aed07bf94930d44584134d261769fc13c70aaed8b566f72c1'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
