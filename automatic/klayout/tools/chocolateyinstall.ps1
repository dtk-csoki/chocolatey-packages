$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.5-win32-install.exe'
  checksum      = '38fc42ead6209c1c9e0dfeac1eaac47a92e4251f3e82a2d46ff97823aa3a101e'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.5-win64-install.exe'
  checksum64    = 'bd922d75202de89dd1ca264911600bbae6448b45dec831bb9609c171fe2d6619'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
