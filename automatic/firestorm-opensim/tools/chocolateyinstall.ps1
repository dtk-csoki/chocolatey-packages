$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Release-6-6-14-69596_Setup.exe'
  checksum       = 'ecb5adba2a1e29c13511eb2b2df41bc518ffbed53b469c8015ae832490d0d7e8'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Releasex64-6-6-14-69596_Setup.exe'
  checksum64     = '05d2a5c05cf20d6a6c46cea5021b6db1978501052c86492b8f0bf4f026af88a0'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
