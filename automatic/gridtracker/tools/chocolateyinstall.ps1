$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://gridtracker.org/index.php/component/osdownloads/download/gridtracker-releases/v1-23-0206/gridtracker-v1-23-0206-windows'
  checksum     = 'e8c26d29635a9c717a641482946bb365143d799a0cf6ed58dac81173b8e801e7'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
