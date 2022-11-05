$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/lanayotech/vagrant-manager-windows/releases/download/1.0.2.2/VagrantManager-1.0.2.2-Setup.exe'
    
  checksum      = 'e4fad3059cad82d9ef6f09574c07e6d7b838f86d6f4447afb9eadde251c3c5b3'
  checksumType  = 'sha256'
  
  silentArgs = '/verysilent /norestart /allusers'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs