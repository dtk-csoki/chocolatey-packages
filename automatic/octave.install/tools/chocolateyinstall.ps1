$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://ftpmirror.gnu.org/octave/windows/octave-8.1.0-w32-installer.exe'
  checksum      = '0446efc96ec22e6116fee1f9d13371b9dd6a00d5aa1babce0dc536285517a0a0'
  checksumType  = 'sha256'

  url64         = 'https://ftpmirror.gnu.org/octave/windows/octave-8.1.0-w64-installer.exe'
  checksum64    = '77bb68df6499aaf5bf4db55dbf3a1aa7ce127e3941036c5322157974480a4ff1'
  checksumType64= 'sha256'

  # Note: silentArgs doesn't work as expected for octave.install
  # An autohotkey is used as workaround.
  # silentArgs	= "/S"
}

# Don't create shims for any executables
$files = Get-ChildItem "$toolsDir"  -Recurse -Include *.exe -Exclude 'octave-cli.exe'
foreach ($file in $files) {
    New-Item "$file.ignore" -type file -force | Out-Null
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
