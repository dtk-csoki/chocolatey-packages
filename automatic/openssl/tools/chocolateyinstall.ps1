$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_2_0.exe'  
  checksumType32  = 'sha512'
  checksum32      = '670934ebc0efc5e6186021f2da3622d0d35f34eb094eb41f76df931ff8f6cc4ccf9a36df59d60a4c226311bcbc6ef814163f4cd33cab61f3ddde612c653da83f'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_2_0.exe'
  checksumType64  = 'sha512'
  checksum64      = 'ef9e07ece9da5f527a92206cd129f2c2f72c2d993035ba974bab8e05a9e1997d385857507f7bab2bc81a2eb2658de49f77c0e11a976dcc2f4d4cb14c75035933'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin"
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"