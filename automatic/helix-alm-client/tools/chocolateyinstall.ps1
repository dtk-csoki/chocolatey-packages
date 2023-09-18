$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2023.3.0/ttwinclientinstall.exe'
  checksum     = '3d998e6b8a98fb7fd97be8f54cc6bf352207620264f004b49c9ac8ea3414ee86'
  checksumType = 'sha256'

  silentArgs   = '-i SILENT LAX_VM resource\jre\bin\java.exe'
}

Install-ChocolateyPackage @packageArgs
