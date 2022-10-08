$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app/releases/download/v2.0.9/Station-Setup.exe'
  checksum      = 'dc39a617cbc810947288e1807ae25a5818ef5e7ef8f52db5b3f0fa6dafe11525'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
