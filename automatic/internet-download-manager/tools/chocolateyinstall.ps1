$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman641build9.exe'
  checksum      = 'e10c66c1c3d4d28a36854fb62c681069822b5f4b66f6831104dfd8155d8cfe58'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
