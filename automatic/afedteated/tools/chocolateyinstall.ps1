$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '7d49afe02d340087b9c63af6acde10da3c48f9c1b67eeb01c6a393da7770d30ec4b66260a28b4e7200527df11b4ef4f920a353ca3c814718a28676ae3bb25ae1'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
