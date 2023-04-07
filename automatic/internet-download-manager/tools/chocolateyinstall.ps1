$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman641build11.exe'
  checksum      = '47aa7eb1d2476b430a24b20fc23b5819eb8b99b2cb173c96f05199fb6ae27817'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
