$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://www.hamrick.com/files/vuex3298.exe'
  checksum       = 'dba9d528995bbc447ca22799e3c598d860af8b33bdf2754f1b0920cbd9649210'
  checksumType   = 'sha256'

  url64          = 'https://www.hamrick.com/files/vuex6498.exe'
  checksum64     = 'b98ab7cbeac7eebeb2485704ab14f71959b4cf04c5218cf5382fe65c3d6bb14a'
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
