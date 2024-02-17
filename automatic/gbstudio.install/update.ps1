import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate {    
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'chrismaltby/gb-studio'
        regex32  = '/gb-studio-windows-32bit-installer.zip$'
        regex64    = '/v(?<Version>[\d\.]+)/gb-studio-windows-64bit-installer.zip$'
   }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"            
        }
    }
}

If ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update
}