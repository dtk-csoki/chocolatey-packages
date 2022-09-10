$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen_Setup.exe'
  checksum     = '3194fcc87f13e935f4ec3b7d9f991dd169d602115a5fc13b13933c09dab4ef53'
  checksumType = 'sha256'

  silentArgs   = '-q'
}

Install-ChocolateyPackage @packageArgs
