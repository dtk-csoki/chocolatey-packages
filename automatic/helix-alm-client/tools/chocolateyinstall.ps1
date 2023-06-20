$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2023.2.0/ttwinclientinstall.exe'
  checksum     = '87eeeb4416af7547ebadd26fec9c32164c1ef866c594bcd6ecd1fa5b92cf8ffb'
  checksumType = 'sha256'

  silentArgs   = '-i SILENT LAX_VM resource\jre\bin\java.exe'
}

Install-ChocolateyPackage @packageArgs
