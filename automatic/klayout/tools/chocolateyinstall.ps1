$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.6-win32-install.exe'
  checksum      = 'c0e4e9641f3860f9a9ba46f8b753528c181318730a2d411905d6e3e85deafbea'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.6-win64-install.exe'
  checksum64    = '18fd6111d5b55c36614088ac7fa08bcaa4dac2f487edd90ff3ca93d2af0e70e7'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
