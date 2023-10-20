$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman641build22.exe'
  checksum      = '735fb4801e024a3ebe4ec1a8b9d0d4b453e90bccc86e6f2bb3cc69982f030604'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
