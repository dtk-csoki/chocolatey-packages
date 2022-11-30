import-module au

#function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_BeforeUpdate {
    Invoke-WebRequest -Uri 'https://api.ivao.aero/v2/softwares/altitude/5/files/latest/download' -OutFile "$PSScriptRoot\tools\Altitude_MSFS_2020.zip"

    $Latest.ChecksumType32 = 'sha256'
    $Latest.Checksum32     = Get-RemoteChecksum $Latest.URL32 -Algorithm $Latest.ChecksumType32
    Remove-Item "$PSScriptRoot\tools\*.zip"
}

function global:au_GetLatest {    
    # $releases = "https://www.ivao.aero/softdev/beta/altitudebeta.aspx"    
    # $releases = 'https://www.ivao.aero/software/altitude'
    # $releases = 'https://www.ivao.aero/softdev/beta/altitudebeta.asp'
    $releases = 'https://www.ivao.aero/softdev/software/altitude.asp'
    $regex = 'target="dl">v(?<Version>[\d\.b]+) Voice'
    target="dl">v1.12.0 Voice | MSFS - Current</a></li>

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).RawContent -match $regex | Out-Null
    #$version = $matches.Version -Replace 'b', '-beta'
    $version = $matches.Version.Replace('b', '-beta')

    return @{
        Version    = $version
        URL32      = 'https://api.ivao.aero/v2/softwares/altitude/5/files/latest/download'        
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
          "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -ChecksumFor none -noCheckUrl