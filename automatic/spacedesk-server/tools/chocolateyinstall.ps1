$ErrorActionPreference = 'Stop';

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url32_win10      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_10_32_v2101.msi'
  $checksum32_win10 = ''
  $url32            = $url32_win10
  $checksum32       = $checksum32_win10
  $url64_win10      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_10_64_v2101.msi'
  $checksum64_win10 = ''
  $url64            = $url64_win10
  $checksum64       = $checksum64_win10
} elseif ( ( [environment]::OSVersion.Version.Major -ge 7 ) -or
           ( ( [environment]::OSVersion.Version.Major -eq 6 ) -and
             ( [environment]::OSVersion.Version.Minor -eq 1 ) ) ) {
  $url32_win7_81      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_8.1_32_v1067_BETA.msi'
  $checksum32_win7_81 = '02fbff6bb48b6bfb2177ea6e7fb023f68ff0d7f79f21b0755675377a6b430ffd'
  $url32              = $url32_win7_81
  $checksum32         = $checksum32_win7_81
  $url64_win7_81      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_8.1_64_v1067_BETA.msi'
  $checksum64_win7_81 = '7e2df3b4f57a8f914581e092a38b095f7a6e10dc09dbca1d2832f69609a3c828'
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
