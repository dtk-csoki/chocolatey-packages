import-module au
 
function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  #$releases = 'https://sourceforge.net/projects/ngspice/files/ng-spice-rework'  
  #$regex    = 'title="/ng-spice-rework/\d+/ngspice-(?<Version>[\d]+)_64.zip'
  $releases  = 'https://sourceforge.net/p/ngspice/news/'
  $regex     = 'ngspice-(?<Version>[\d]+) is available.'

  $download_page = (Invoke-WebRequest -Uri $releases).RawContent -match $regex
  $Version = $matches.Version

  $regex    = '/ngspice-(?<Version>[\d]+)_64.(zip|7z)'
  $releases = 'https://sourceforge.net/projects/ngspice/files/ng-spice-rework/' + $Version + '/'
  $download_page = (Invoke-WebRequest -Uri $releases).RawContent -match $regex

  #https://sourceforge.net/projects/ngspice/files/ng-spice-rework/39/
  #https://sourceforge.net/projects/ngspice/files/ng-spice-rework/39/ngspice-39_64.7z/download

  
  return @{
    Version = $Version + ".0"    
    URL64 = Get-RedirectedURL('https://downloads.sourceforge.net/project/ngspice/ng-spice-rework/' + $matches.Version + $matches.0)
  }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{                        
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"            
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}