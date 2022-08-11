$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url64         = 'https://download.sublimetext.com/sublime_merge_build_2076_x64_setup.exe'
  checksum64    = '8a682cbe8eca4cd3ca508f812578a61edec5d6cbabae5265fee872615bb7d4e4'
  checksumType  = 'sha256'
  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
