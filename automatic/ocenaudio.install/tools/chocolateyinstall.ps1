$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = 'f2833b8e8f5b831f56eb8ad0ecec7ef1ca1dd3bc6f96a62a0b50a3fec3c54c02'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = 'c03ab16edc65509bb69361e12c7cd4945f18af4e0e6b69919a4a4aa72ae594df'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
