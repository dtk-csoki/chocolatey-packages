import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://www.ei5di.com'
    $regex    = '<a href="https://(www.)?ei5di.com/sdhist.html"><b>V(?<Version>[0-9\.]+).*</b></a>'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$download_page.RawContent -match $regex | Out-Null
    return @{ Version = $matches.Version ; URL32 = 'https://www.ei5di.com/sd/sdsetup.exe' }
}

function global:au_SearchReplace {
     @{
        "legal\VERIFICATION.txt"  = @{
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }
    }
}

update -ChecksumFor none