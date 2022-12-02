$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.13-win32-install.exe'
  checksum      = '4299ef757d1dfbbc2717c81654ddfbb879f618a7bec288b233d7ea33c096c487'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.13-win64-install.exe'
  checksum64    = '6b02c51cb3765080463752ec0540f42b95d076eb6635b9f56eaff8cd4994be54'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
