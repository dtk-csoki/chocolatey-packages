$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '4f411e1615cff28f41bc918311d6ab853efefd519f7cffcb3900c12cf420e617e5dfda8ad92143948bf7978246f704a19969fb12392fed6fa8bbceafe60c27f7'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
