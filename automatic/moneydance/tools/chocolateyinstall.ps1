$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://infinitekind.com/stabledl/current/Moneydance_windows_amd64.exe'
  checksum64     = '831735cd1b822eccbbf3d32eed4102c1d34e77eccd4300625aabf69df19c9fe0'
  checksumType64 = 'sha256'

  silentArgs     = "-q"
}

Install-ChocolateyPackage @packageArgs
