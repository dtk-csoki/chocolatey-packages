$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.murgee.com/auto-mouse-click/download/setup.exe'
  checksum     = '287A2547E4D3D7E0DBF3BF0969DF1DD698961A80039A7704592E05DC966AA60A'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
