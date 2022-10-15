$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '875ad3cff15ebb52497e4dc4f18144f6474be1681845c8494af797f44725ce665f7183cb94e93ebdd6c12c97910758c8cee9f031cf80c398feeeb3da2df71771'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
