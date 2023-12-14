$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/release/windows/Phoenix-Firestorm-Release-6-6-17-70368_Setup.exe'
  checksum       = '70a2b2d10ca06dde26bf9237cc997699c9bb13f2eb6d83c1b377aed0d4176ef4'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/release/windows/Phoenix-Firestorm-Releasex64-6-6-17-70368_Setup.exe'
  checksum64     = 'e8d1e38d9522cfbdeda28c594db598d279bf058d7267a6f050e5d199ac8b885d'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
