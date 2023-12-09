$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://infinitekind.com/stabledl/current/Moneydance_windows_amd64.exe'
  checksum64     = '12fd58823744238d0d242ed3acce542fe00d1a068d3947de602558a928207c06'
  checksumType64 = 'sha256'

  silentArgs     = "-q"
}

Install-ChocolateyPackage @packageArgs
