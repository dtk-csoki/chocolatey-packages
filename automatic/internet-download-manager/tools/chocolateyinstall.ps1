$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build5.exe'
  checksum      = '780c7ffaf8640824510ab16f0e2c037982491a8e6ca6e0a66d046ea0024b6dd9'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
