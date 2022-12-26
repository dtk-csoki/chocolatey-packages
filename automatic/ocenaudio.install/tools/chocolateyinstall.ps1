$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = '96f7d011e099e2693130e95c2081665da3343f138df4c8f3cffce0b63fc194eb'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = 'bc467cb87fd6616318f0d527ee1366e536c967628c70012496838b064116048f'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
