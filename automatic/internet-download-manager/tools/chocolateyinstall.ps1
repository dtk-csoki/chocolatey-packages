$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman641build3.exe'
  checksum      = 'e3f599ddfddd248d8c94dd88297b69166860c722b9a2b1e6fdc40c34ff367ab0'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
