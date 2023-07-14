$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2023.2.1/ttwinclientinstall.exe'
  checksum     = 'ab032e3196dc34efa9105a6694a8a7593d8b5beb2200f8f383df3c9d874e8788'
  checksumType = 'sha256'

  silentArgs   = '-i SILENT LAX_VM resource\jre\bin\java.exe'
}

Install-ChocolateyPackage @packageArgs
