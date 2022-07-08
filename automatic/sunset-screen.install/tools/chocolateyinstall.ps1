$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen_Setup.exe'
  checksum     = 'ea2037363e71fe13d4fa8699475cb3e2b42cf06e3d47309ab19f089df365723f'
  checksumType = 'sha256'

  silentArgs   = '-q'
}

Install-ChocolateyPackage @packageArgs
