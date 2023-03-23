$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman641build10.exe'
  checksum      = '7bbdc0e2def74ac43ea83fc5a06d266849e4029046658dfc9d7c6ecd6a2fbcf8'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
