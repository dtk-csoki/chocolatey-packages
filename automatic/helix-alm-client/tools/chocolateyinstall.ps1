$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2024.1.0/ttwinclientinstall.exe'
  checksum     = 'd4aca1e4ee73b679087eddbfe5f4eb8678ace28661e786cbd9b2805a8e65ba28'
  checksumType = 'sha256'

  silentArgs   = '-i SILENT LAX_VM resource\jre\bin\java.exe'
}

Install-ChocolateyPackage @packageArgs
