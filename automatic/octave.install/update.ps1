$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
    $releases = 'https://ftpmirror.gnu.org/octave/windows/'    
    $regex64  = 'octave-(?<Version>[\d\._]+)-w64-installer.exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing    
 	$url64         = $download_page.links | ? href -match $regex64 | select -Last 1
    $version       = $matches.Version -Replace '_', '.'
	
    return @{
        Version = $version    
        URL64   = $releases + $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{ 
          "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
          "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"          
        }
        "tools\chocolateyinstall.ahk" = @{
          "Octave-[\d\._]+" = "Octave-$($Latest.Version)"
        }
    }
}


If ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none -noCheckUrl
}