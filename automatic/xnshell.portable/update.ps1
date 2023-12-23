import-module au

function global:au_GetLatest {
    $releases = 'https://www.xnview.com/en/xnshell/'
    $regex    = 'XnShell (?<Version>[\d\.]+)'
    
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $download_page.RawContent -match $regex
    $version = $matches.Version

    return @{
        Version = $version
        URL32   = 'https://download.xnview.com/XnShellEx.zip'
        URL64   = 'https://download.xnview.com/XnShellEx64.zip'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update