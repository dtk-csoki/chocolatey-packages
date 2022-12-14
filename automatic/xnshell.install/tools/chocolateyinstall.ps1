$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://download.xnview.com/XnShellEx.exe'
  checksum      = 'f8758fe85b3cac1baaf0392a55421ac8524d720129a943443066f09d45469ea2'
  checksumType  = 'sha256'

  url64         = 'https://download.xnview.com/XnShellEx64.exe'
  checksum64    = 'a038f7048d08292a29349b0869799c11e05a3886bb220f4971f71e7134d75af2'
  checksumType64= 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
