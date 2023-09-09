$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com//STJr/SRB2/releases/download/SRB2_release_2.2.13/SRB2-v2213-Installer.exe'
  checksum      = '74da34ca3ba1962015714afa8535051b3ca8414ace28b0bdc13a176f6218d703'
  checksumType  = 'sha256'
  
  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
