$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28-win32-install.exe'
  checksum      = 'ff8eab99db91db0cde3a8b8483f04ec3d69f980ae56a600278ed77b47f858bbe'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28-win64-install.exe'
  checksum64    = '5386a4fa1ffd2443b19e802a3f411f1182d88b7ca622c2acc99596628c548584'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
