import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {

    # Get Version
    $releases = 'https://sourceforge.net/projects/jtdx/files/'
    $regex    = '/jtdx_(?<Version>[\d\.]+)/'
    (Invoke-WebRequest -UseBasicParsing $releases) -match $regex | Out-Null
    $version = $matches.Version

    # Get Windows dir (Microsoft Windows / Microsoft_Windows)
    $releases = 'https://sourceforge.net/projects/jtdx/files/jtdx_' + $version
    $regex    = "/projects/jtdx/files/jtdx_$version/.*Windows/"
    (Invoke-WebRequest -UseBasicParsing $releases) -match $regex | Out-Null
    
    # This package provides currently only the 32-bit-audio version
    <#
    32-bit audio version of JTDX is dedicated for trial in setups with very low noise environment, on overcrowded bands and receiver path IM3 dynamic range greater than 90dB.
    In SDR software WDM KS or better driver shall be used, virtual audio cable shall be configured to support 32-bit audio stream.

    24/32-bit audio ADC device shall be used if analog linear AF output of receiver is connected to sound card.

    32-bit audio version of JTDX have better suppression of unwanted and side emissions in TX audio spectrum versus 16-bit audio version. 
    #>

    $releases = 'https://sourceforge.net' + $matches.0 + '32-bit_audio'    
    $regex32    = 'jtdx-.*-32A-win32.exe'
    $regex64    = 'jtdx-(?<Version>.*)-32A-win64.exe'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url32 = $download_page.links | ? href -match $regex32 | Select -First 1
	$url64 = $download_page.links | ? href -match $regex64 | Select -First 1
    $version = $matches.Version
    If ($version | Select-String '-rc') {
        $version = $version.Replace('-rc', '-beta')
    }

    return @{
        Version = $version
        URL32   =  get-redirectedurl url32.href
        URL64   =  get-redirectedurl url64.href
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor none -noCheckUrl