$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2023.1.0/ttwinclientinstall.exe'
  checksum     = '1af5fa3f0986621ec152ca5b8857b751b6184709639aaa20b620a52a7f8b957e'
  checksumType = 'sha256'

  silentArgs   = '-i SILENT LAX_VM resource\jre\bin\java.exe'
}

Install-ChocolateyPackage @packageArgs
