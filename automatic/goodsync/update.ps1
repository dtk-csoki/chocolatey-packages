$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases     = 'https://www.goodsync.com/download?os=windows'
    $regexVersion = 'ver ([\d\.]+)\<'
    #$regexUrl     = 'a href="(?<url>https://.*/(GoodSync-v[\d\.]+-Setup.msi|GoodSync-vsub-Setup.exe))"'
    #https://www.goodsync.com/download/GoodSync-vsub-Setup.exe
    
    # From AppVeyor platform, "iwr https://www.goodsync.com" works only when used with "-OutFile" option!
    Invoke-WebRequest -Uri $releases -UseBasicParsing -OutFile buff    
    $version = (Get-Content buff | Select-String $regexVersion -AllMatches).Matches.Groups[1].Value
    $url     = (Get-Content buff | Select-String $regexUrl -AllMatches).Matches.Groups[2].Value
    Remove-Item -Path buff

    return @{
        Version     = $version
        URL32       = 'https://www.goodsync.com/download/GoodSync-vsub-Server-Setup.exe'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -NoCheckUrl