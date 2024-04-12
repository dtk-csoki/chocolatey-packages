$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_3_0.exe'  
  checksumType32  = 'sha512'
  checksum32      = '5cc015cfd353d96844799c85d3d6be2b44756be362129b04011bcd2e67a2cf2dbfb877298b27bc5804b4de24ef90187a3c4db9abd98ce9a9bc8c2a0a6d02e69b'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_3_0.exe'
  checksumType64  = 'sha512'
  checksum64      = 'c94aaeb5ab650631009b540b4728e8c17eae2683f2c06c82da3cc1fc891fb60fd2b071d6a781a251e5c6b624be71868fbaad03fb021bb8935e79d2fe4196d837'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin"
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
