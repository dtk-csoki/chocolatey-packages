$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'msi'

  url            = 'http://download.mp3skyperecorder.com/MP3SkypeRecorderSetup.exe?version=6.15'
  checksum       = '31f278c00d3c187ac23da89038811fc5ce895465d38d1261e9efecff6b0b285c'
  checksumType   = 'sha256'

  silentArgs	 = "/qn /norestart /l*v `"$env:Temp\$env:ChocolateyPackageName.MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
