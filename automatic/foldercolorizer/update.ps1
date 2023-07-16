import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://ushining.softorino.com/download.php?abbr=fc2w'
    $regex = "foldercolorizer2windows_(?<Version>[\d\.]+).exe$"

    $url32 = Get-RedirectedUrl $releases
    $url32 -match $regex | Out-Null
    $version = $matches.Version

    return @{
        Version    = $version
        URL32      = $url32        
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{        
            "(?i)(x32: ).*"               = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"               = "`${1}$($Latest.URL32)"
            "(?i)(checksum type:\s+).*"   = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }
    }
}

update -ChecksumFor None