$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Release-6-6-8-68380_Setup.exe'
  checksum       = '91f6e46bc793c528b3e80712e092c13664031d7ff472ea8f2478fc89bfd26978'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Releasex64-6-6-8-68380_Setup.exe'
  checksum64     = '92b647db67970d6765f94e522989025388e103e7da46d23052b6dc5e1eedd160'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
