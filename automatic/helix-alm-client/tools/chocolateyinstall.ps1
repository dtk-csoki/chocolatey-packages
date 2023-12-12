$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2023.4.0/ttwinclientinstall.exe'
  checksum     = 'ab1c864c3f1d3799f01c84ca399e9e15449afc0593bc7cfe9469e8b2bd888b58'
  checksumType = 'sha256'

  silentArgs   = '-i SILENT LAX_VM resource\jre\bin\java.exe'
}

Install-ChocolateyPackage @packageArgs
