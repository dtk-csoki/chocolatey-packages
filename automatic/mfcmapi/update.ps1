import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = 'stephenegriffin/mfcmapi'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'
    $regex32  = 'MFCMAPI.exe.(?<Version>[\d\.]+).zip$'
    $regex64  = 'MFCMAPI.(exe.x64|x64.exe).([\d\.]+).zip$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	
	$url32   = $download_page.links | ? href -match $regex32
    $file32  = $matches.0
    $version = $matches.Version
    $url64   = $download_page.links | ? href -match $regex64
    $file64  = $matches.0

    $century = Get-date -uformat %C

    return @{
        Version = $century + $version
        VersionFile = $version
        URL32   = 'https://github.com' + $url32.href
        File32  = $file32
        URL64   = 'https://github.com' + $url64.href
        File64  = $file64
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