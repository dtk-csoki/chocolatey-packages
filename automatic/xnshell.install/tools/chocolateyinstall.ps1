$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://download.xnview.com/XnShellEx.exe'
  checksum      = 'CC7872F775A5754B2BAA763583B594D2A110822A87CB8DD731B20E422AC8E73B'
  checksumType  = 'sha256'

  url64         = 'https://download.xnview.com/XnShellEx64.exe'
  checksum64    = 'C82F9494C867C0E680CC8DEF364DE6F43BD84F2466B99181EB48633A69A9703E'
  checksumType64= 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
