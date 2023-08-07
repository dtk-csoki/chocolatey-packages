$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman641build18.exe'
  checksum      = 'ac7a55f2a9dad5c36d398da20ee3a6b6d3630046faa69b723db4a5d9e41e32fa'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
