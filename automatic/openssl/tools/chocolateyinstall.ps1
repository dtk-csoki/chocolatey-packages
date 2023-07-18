$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  url         = 'https://slproweb.com/download/Win32OpenSSL-3_1_1.exe'
  checksum    = 'F2E51490041012D796551EE23546613D89B6B57A2880726A56235CE147326D51'
  file64      = "$toolsDir\Win64OpenSSL-3_1_1.exe"
  silentArgs  = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

If (Get-OSArchitectureWidth -eq 64) {
  Install-ChocolateyInstallPackage @packageArgs
} Else {
  Install-ChocolateyPackage @packageArgs
}

New-Item -ItemType File -Path ($packageArgs.file   + '.ignore') -Force | Out-Null
New-Item -ItemType File -Path ($packageArgs.file64 + '.ignore') -Force | Out-Null

$path = Get-AppInstallLocation OpenSSL-Win

Install-ChocolateyPath -PathToInstall "$path\bin"

Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"
Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
