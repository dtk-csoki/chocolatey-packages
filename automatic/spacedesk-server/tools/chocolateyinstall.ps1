$ErrorActionPreference = 'Stop';

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url32_win10      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_10_32_v1066_BETA.msi'
  $checksum32_win10 = ''
  $url32            = $url32_win10
  $checksum32       = $checksum32_win10
  $url64_win10      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_10_64_v1066_BETA.msi'
  $checksum64_win10 = ''
  $url64            = $url64_win10
  $checksum64       = $checksum64_win10
} elseif ( ( [environment]::OSVersion.Version.Major -ge 7 ) -or
           ( ( [environment]::OSVersion.Version.Major -eq 6 ) -and
             ( [environment]::OSVersion.Version.Minor -eq 1 ) ) ) {
  $url32_win7_81      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_8.1_32_v1057_BETA.msi'
  $checksum32_win7_81 = 'c4e4f80a5c9b54c3d59c1f981041a1f3ef0d1371848be01fe11de8c4b8f433fb'
  $url32              = $url32_win7_81
  $checksum32         = $checksum32_win7_81
  $url64_win7_81      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_8.1_64_v1057_BETA.msi'
  $checksum64_win7_81 = 'af079fa5ac29fc916a6c369f6f4e5afae8add1c7d83e2451db97c71812de9653'
  $url64              = $url64_win7_81
  $checksum64         = $checksum64_win7_81  
} else {
  throw "spacedesk-server runs only with Windows 10, windows 8.1 and windows 7."
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'MSI'

  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'

  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  silentArgs	   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
