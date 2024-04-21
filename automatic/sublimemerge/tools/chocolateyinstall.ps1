$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url64         = 'https://download.sublimetext.com/sublime_merge_build_2095_x64_setup.exe'
  checksum64    = 'ab61869112065c95314133c57ced85345edf1461e0414ef8897257500e979e94'
  checksumType  = 'sha256'
  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs


[array]$key = Get-UninstallRegistryKey @packageArgs

If ($key.Count -eq 1) {
  $key | ForEach-Object {
    $submergeInstallLocation = Join-Path -Path $_.InstallLocation -ChildPath 'smerge.exe'
    Install-BinFile -Name 'smerge' -Path "$submergeInstallLocation"
  }
}
