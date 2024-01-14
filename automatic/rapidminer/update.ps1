$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases = 'https://docs.rapidminer.com/latest/studio/releases'
    $regex = 'Version (?<Version>[\d\.]+)'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).RawContent -match $regex

    return @{
        Version = $matches.Version
        URL32   = 'https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio-win32-install.exe?utm_source=nexus&utm_medium=nexus'
        URL64   = 'https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio-win64-install.exe?utm_source=nexus&utm_medium=nexus'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update
