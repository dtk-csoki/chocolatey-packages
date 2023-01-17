$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://download.getdoxie.com/DoxieSetup-3.1.exe'
  checksum     = 'b7b0c70adbdb5bce685268812ddb9b0c53df735c34c7a09b66125cc3280c6c00'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
