$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_2_1.exe'  
  checksumType32  = 'sha512'
  checksum32      = 'a267bf8f220f334ba86b46f30ccd2e7aa73519b904612b56b3fc7f69fed04e2e2b8902fdbbb9d9d7cbf10fe5687b530e3e3d1d71f8b4027e2084616bdacb4383'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_2_1.exe'
  checksumType64  = 'sha512'
  checksum64      = '657f7cb56d8ae48b60812ce1d42c5158c953b438a9ea013b98dd6cbeca3a51b919636a68a9801af07410af50e90fbbdc20d1ce783e4e65356d61002a15b606cc'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin"
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
