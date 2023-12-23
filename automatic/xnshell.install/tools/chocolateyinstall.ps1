$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://download.xnview.com/XnShellEx.exe'
  checksum      = '0a52999c45a8dcf216c3d1a6f8532f9b287043f00a68bd9439775a2b104fda41'
  checksumType  = 'sha256'

  url64         = 'https://download.xnview.com/XnShellEx64.exe'
  checksum64    = '5478831ad2a506d28d7d3eb620f5946de18b0c1990e331dacbfa370c4d04e0b1'
  checksumType64= 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs