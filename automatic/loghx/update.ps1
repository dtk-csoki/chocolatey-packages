$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate() {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
}

function global:au_GetLatest {
	$releases = 'http://rx4hx.qrz.ru/files/loghx/'
	$regex    = 'LogHX3Setup_build_(?<Version>[\d]+).exe'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex | Select -last 1

    return @{
        Version = "0.0.0." + $matches.version
        URL32   = 'http://rx4hx.qrz.ru/' + $url.href
    }    
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -ChecksumFor none