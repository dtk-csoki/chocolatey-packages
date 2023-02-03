$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.4-win32-install.exe'
  checksum      = 'd00ab29540b5ad6a0995e1d53d02bd5c057773ce088126d22c23997d0bf49ef1'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.4-win64-install.exe'
  checksum64    = 'f87bc8d6d606479e33207cb89a29ebe62be0205f5c8eaeec5db204f48b2d7d00'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
