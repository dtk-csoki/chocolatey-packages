import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'stephenegriffin/mfcmapi'        
        regex32  = 'MFCMAPI.exe.(?<Version>[\d\.]+).zip$'
        regex64  = 'MFCMAPI.(exe.x64|x64.exe).([\d\.]+).zip$'
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
            "(`"[$]toolsDir\\)MFCMAPI.exe.[\d\.]+(.zip`")"     = "`${1}$($Latest.File32)"""
            "(`"[$]toolsDir\\)MFCMAPI.(exe.x64|x64.exe).[\d\.]+(.zip`")" = "`${1}$($Latest.File64)"""
        }
    }
}

update -ChecksumFor none -noCheckUrl