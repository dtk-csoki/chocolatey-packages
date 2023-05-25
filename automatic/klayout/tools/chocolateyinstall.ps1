$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.8-win32-install.exe'
  checksum      = '79ecaffb4de928b3d5bfb87ad179ee334034dc371ddd383e37fc2378c82563d5'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.8-win64-install.exe'
  checksum64    = '4f50b3659916236266805734bbaa15813f1b24d8c7c905a56fccbc4af3b4ad65'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
