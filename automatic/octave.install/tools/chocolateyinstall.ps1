$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://ftpmirror.gnu.org/octave/windows/octave-8.3.0-w32-installer.exe'
  checksum      = '2d6062a5a33f49ecd33cc21811cd030e8a93b8afb67a217d985a03d88275bb92'
  checksumType  = 'sha256'

  url64         = 'https://ftpmirror.gnu.org/octave/windows/octave-8.3.0-w64-installer.exe'
  checksum64    = '214e33138aba18f9a97d1fc7e326707a6ecacc7a59d70fbe13445b96506bdfab'
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
