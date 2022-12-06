$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2022.3.0/ttwinclientinstall.exe'
  checksum     = '799907ecdb92797cc6223e77e0e721a85e3b4e74e80c587f88b04f67cd4ef14d'
  checksumType = 'sha256'

  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
