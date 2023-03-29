$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://gridtracker.org/index.php/component/osdownloads/download/gridtracker-releases/v1-23-0328/gridtracker-v1-23-0328-windows'
  checksum     = 'ff02efd00fb17e3c6b43157df7a42f9477bf9a9d22df0b99081c3ed1973c3078'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
