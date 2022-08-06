$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Release-6-5-6-66221_Setup.exe'
  checksum       = '35392d94132437b9cc6eb84d6af1850fddd6f7cffe6a3040c0ca205b44f736ec'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-FirestormOS-Releasex64-6-5-6-66221_Setup.exe'
  checksum64     = 'a19df05174b60463bdb6a42b2159e78ce7bfaf4eab9d7941d9abc58f59b4480b'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
