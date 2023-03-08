$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://spacedesk.net/downloads/spacedeskWindowsVIEWER_v0940_BETA.msi'
  checksum      = '8903955bc46734f28ab989d8dddb134d5f297ebc36b883c1df43f92b97f02611'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
