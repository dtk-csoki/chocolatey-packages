$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://www.hamrick.com/files/vuex3298.exe'
  checksum       = 'a462bc3d7bd81d1da3b2f26a89f3d2a8cff54e4ebd3319275f7bf361855c33c8'
  checksumType   = 'sha256'

  url64          = 'https://www.hamrick.com/files/vuex6498.exe'
  checksum64     = '9193854d4b2c36adf43e8e7a39f102c504d3278eea6c4df8f02d35c6c02c17d5'
  checksumType64 = 'sha256'
}

If (Get-ChildItem Cert:\CurrentUser\TrustedPublisher\|Where subject -eq "CN=Hamrick Software, O=Hamrick Software, L=Sunny Isles Beach, S=Florida, C=US") {
  Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
} Else {
  Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyInstallCertificate.ahk`""
}
Install-ChocolateyPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'VueScan.lnk'
$targetPath = Join-Path $env:ProgramFiles 'VueScan\vuescan.exe'
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutFilePath" -TargetPath "$targetPath"
