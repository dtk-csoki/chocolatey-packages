$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://download.getdoxie.com/DoxieSetup-3.0.exe'
  checksum     = 'd9d5d7a29be705f377d2b239cef715c9f23f609686e11c8a7f65e0b51fc40a0e'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
