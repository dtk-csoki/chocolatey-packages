$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2022.2.0/ttwinclientinstall.exe'
  checksum     = 'b9f7119051db91bb0e2a64d8b1e550ecb303c29d564ec00fb66093327f75eb25'
  checksumType = 'sha256'

  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
