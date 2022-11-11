$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'http://ftp.fau.de/eclipse/technology/epp/downloads/release/2022-09/R/eclipse-cpp-2022-09-R-win32-x86_64.zip'
  checksum      = '02CA035C99FFA59A705C7EB865BB8081A568619F98EF509B0D7DDAAB8AF03CF3'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude eclipse.exe,eclipsec.exe
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Eclipse IDE for C-C++ Developers.lnk"
$targetPath = Join-Path $toolsDir "eclipse\eclipse.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
