import-module au

function global:au_BeforeUpdate {
  Get-RemoteFiles -NoSuffix -Purge
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
  $releases = 'https://kid3.kde.org'
  $regex  = 'kid3-(?<Version>[\d\.-]+)-win32-x64.zip'

  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing  
  $url = ($download_page.links | ? href -match $regex | Select -First 1).href
  $file  = $matches.0
  $version = $matches.Version -replace '-', '.'
  
  return @{
    Version = $version    
    URL32   = Get-RedirectedUrl $url
  }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL32)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{          
          "(?i)(^\s*file32\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
          "([$]toolsDir `"kid3-)[\d\.]+(-win32[$]{architectureWidth}\\kid3.exe)`"" = "`${1}$($Latest.Version)`${2}`""          
        }
    }
}

update -ChecksumFor none -NoCheckUrl
