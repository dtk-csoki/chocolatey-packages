import-module au

function global:au_BeforeUpdate {
    Remove-Item "$PSScriptRoot\tools\*.exe"    
    $Latest.ChecksumType32 = 'sha256'
    $Latest.Checksum32     = Get-RemoteChecksum $Latest.URL32 -Algorithm $Latest.ChecksumType32
}

function global:au_GetLatest {
    $github_repository = "asciidocfx/AsciidocFX"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex    = '/asciidocfx/AsciidocFX/tree/v(?<Version>[\d\.]*)\"'

    (Invoke-WebRequest -Uri $releases).Content -match $regex | Out-Null
    $version = $matches.Version

    return @{
        Version = $version
        URL32   = 'https://github.com/asciidocfx/AsciidocFX/releases/download/v' + $version + '/AsciidocFX_Windows.exe'
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

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -NoCheckUrl -ChecksumFor None
}