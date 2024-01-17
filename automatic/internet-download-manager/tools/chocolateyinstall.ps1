$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman642build3.exe'
  checksum      = '26e1d8e4838ee3334b1d9c2622ed6197c93e87487bc0fefcf29216cee72858f5'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
