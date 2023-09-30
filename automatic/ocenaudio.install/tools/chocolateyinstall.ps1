$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = 'dd5da71dc6fc70ef4df93931ef07e4dac3d67048a4c4909a161d8f91d3ccd28e'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = 'd4c0d7fc198a6138904e36453b6c22fc5c1ed01ac3fbc07db73e6ee3b065c2fd'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
