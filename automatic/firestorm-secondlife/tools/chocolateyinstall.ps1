$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Release-6-6-14-69596_Setup.exe'
  checksum       = '6c1e9f60c119cbc058be467b428b023f4c66ae783179a7691e7d0ba5b1337474'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Releasex64-6-6-14-69596_Setup.exe'
  checksum64     = '73858828dda9a0e5c24b815fd63f772e06a26badddbef1e935239c0f1b1e2ca0'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
