$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url64         = 'https://download.sublimetext.com/sublime_merge_build_2082_x64_setup.exe'
  checksum64    = '48b7d5a62d506b72a8e50cedfca8b8a23e79b62a765fc1abf8f23be130165716'
  checksumType  = 'sha256'
  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
