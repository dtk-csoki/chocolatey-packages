$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://www.hamrick.com/files/vuex3297.exe'
  checksum       = '9d3043dbc02082330a6c571a1affced8a6958f4812f0eae40a12f5c29985e05c'
  checksumType   = 'sha256'

  url64          = 'https://www.hamrick.com/files/vuex6497.exe'
  checksum64     = 'a56a41326092ae97a0fc74430d0595c58596a7dc858fe3e9fb840dbd330c3760'
  checksumType64 = 'sha256'
}

if (Get-ChildItem Cert:\CurrentUser\TrustedPublisher\|Where subject -eq "CN=Hamrick Software, O=Hamrick Software, L=Sunny Isles Beach, S=Florida, C=US") {
  Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
} else {
  Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyInstallCertificate.ahk`""
}
Install-ChocolateyPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'VueScan.lnk'
$targetPath = Join-Path $env:ProgramFiles 'VueScan\vuescan.exe'
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutFilePath" -TargetPath "$targetPath"
