$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://github.com/arsenetar/dupeguru/releases/download/4.3.1/dupeGuru_win64_4.3.1.exe'
  checksum     = '28293dada3c88336b2b53aca00adf59f85cabf1362f8386a8ffc6be5e1742836'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
