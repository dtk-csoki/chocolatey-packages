$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://www.hamrick.com/files/vuex3298.exe'
  checksum       = '4bef4a1e549a41da5b67bb709ba116e85c3687c43b2529af8c2b21823b0f88b1'
  checksumType   = 'sha256'

  url64          = 'https://www.hamrick.com/files/vuex6498.exe'
  checksum64     = 'fefea14d932df8726ef3d64f62d65dbed552f7fff0c93f28c4b46470099f671d'
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
