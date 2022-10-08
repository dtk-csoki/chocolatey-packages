$ErrorActionPreference = 'Stop'
import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'torrent-file-editor/torrent-file-editor'
        regex32    = 'torrent-file-editor-(?<Version>[\d\.]+)-x32.exe$'
        regex64    = 'torrent-file-editor-([\d\.]+)-x64.exe$'
   }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(torrent-file-editor-)[\d\.]+(-x[$]{OSArchitectureWidth}.exe)" = "`${1}$($Latest.Version)`${2}"
        }
    }
}

update -ChecksumFor none