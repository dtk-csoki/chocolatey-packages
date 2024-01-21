import-module au
 
function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $releases      = 'https://vb-audio.com/Voicemeeter/banana.htm'
  $regex_release = 'VoicemeeterSetup_v(\d+).zip'
  $regex_version = 'Voicemeeter (?<Version>[\d\.]+).*\(ZIP Package\)'

  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $download_page.RawContent -match $regex_version
  $version       = $matches.Version  
  $url = $download_page.links | ? href -match $regex_release
  #If $version -match "^2.0.6." { $version += '00' }
  
  return @{
    Version = $version
    URL32 = $url.href
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
          "(?i)(^\s*File\s*=\s*`"[$]toolsDir\\)(.*)`""           = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*FileFullPath\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}