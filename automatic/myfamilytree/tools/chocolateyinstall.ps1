$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree14.0.4.0.msi'
  checksum      = '777e33a5f32e7b515c522bb28bdc65dca7bf835ea43c49ad34cdbbf4948e03bd'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree14.0.4.0x64.msi'
  checksum64    = 'dd74a16b1631bc0430cb5375d10677febf20549e1780fd3fc3fc39d042bb3f80'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
