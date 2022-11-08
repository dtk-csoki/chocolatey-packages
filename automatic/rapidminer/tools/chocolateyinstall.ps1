$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
   
  url           = 'https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio-win32-install.exe?utm_source=nexus&utm_medium=nexus'
  checksum      = 'f523de4b1a15f86b0097ab11ecacef907251da399ed45591fc716423257d47e8'
  checksumType  = 'sha256'

  url64bit      = 'https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio-win64-install.exe?utm_source=nexus&utm_medium=nexus'
  checksum64    = '90341db72a25763832d754f57593093cf35ce183df24e387ab3957943f6556ff'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
