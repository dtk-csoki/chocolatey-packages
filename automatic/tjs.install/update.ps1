import-module au

function global:au_GetLatest {
    $releases = 'https://community.jaspersoft.com/files/file/19-jaspersoft%C2%AE-studio-community-edition/'
    $regex    = 'Jaspersoft® Studio Community Edition (?<Version>[\d\.]+)'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).Content -match $regex | Out-Null
    $version = $matches.Version

    return @{
        Version = $version
        URL64   = 'https://downloads.sourceforge.net/project/jasperstudio/JaspersoftStudio-' + $version + '/js-studiocomm_' + $version + '_windows_x86_64.exe'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

If ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor 64
}