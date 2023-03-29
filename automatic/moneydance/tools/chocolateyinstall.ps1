$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://infinitekind.com/stabledl/current/Moneydance_windows_amd64.exe'
  checksum64     = '566c2cdc25532032d40fc5704bfcb85105d833db82ac0ce57b55417a1f06869c'
  checksumType64 = 'sha256'

  silentArgs     = "-q"
}

Install-ChocolateyPackage @packageArgs
