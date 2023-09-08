$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com//STJr/SRB2/releases/download/SRB2_release_2.2.12/SRB2-v2212-Installer.exe'
  checksum      = 'a5f5d84ba123e20aa81e1da8e6783635a5d12994eb79c60c3451271dcf80d3a3'
  checksumType  = 'sha256'
  
  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
