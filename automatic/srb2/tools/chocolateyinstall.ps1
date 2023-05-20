$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com//STJr/SRB2/releases/download/SRB2_release_2.2.11/SRB2-v2211-Installer.exe'
  checksum      = '3b5c826b1d768207e5253414b2c5364837502357f9942abf687c52001f91b2f2'
  checksumType  = 'sha256'
  
  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
