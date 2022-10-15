import-module au
. ..\..\helpers\GitHub_Helper.ps1

#function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'mzomparelli/zVirtualDesktop'        
        regex32 = 'https://zomp.co/Files.aspx\?id='
   }
}

function global:au_BeforeUpdate {
    Remove-Item "$PSScriptRoot\tools\*.exe"

    Invoke-WebRequest $Latest.URL32 -OutFile "${env:tmp}\zVirtualDesktop.exe"

    $Latest.ChecksumType = "sha256"
    $Latest.Checksum32   = Get-FileHash -Algorithm $Latest.ChecksumType -Path "${env:tmp}\zVirtualDesktop.exe" | ForEach-Object Hash
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }        
    }
}

update -NoCheckUrl -ChecksumFor none