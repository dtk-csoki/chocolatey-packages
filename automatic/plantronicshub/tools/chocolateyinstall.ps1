$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.poly.com/headsets/PlantronicsHubInstaller.exe'
  checksum     = 'E43484D770F3DA729D8BA090604AD971A3DB201EC7DFA80AD21CFE3CD3B38A52'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
