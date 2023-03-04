function github_GetInfo {
    Param([array]$ArgumentList)    

    $debug = 0;
    $github_url = 'https://github.com/'
    $github_repository_root = "$github_url" + $ArgumentList.repository

    If ($debug) { Set-PsDebug -Trace 1 }

    $github_redirected_url  = Get-RedirectedUrl "${github_repository_root}/releases/latest"
    
    Write-Host "github_redirected_url: $github_redirected_url"

    # If "${github_repository_root}/releases/latest" redirect to a URL like '/tag/(?<FullVersion>v?(?<Version>[\d\.]*).*)'
    If ($github_redirected_url -match '/tag/v?[\d\.]*.*') {
        # v is optional (ex: https://github.com/adobe-fonts/source-han-code-jp/releases/latest)
        $github_latest_version  = "$github_redirected_url" -match '/tag/(?<FullVersion>v?(?<Version>[\d\.]*).*)' # Get version to re-use for expanded_assets        
    } else {
        # Else we grab the first version displayed in the page returned by "${github_repository_root}/releases/latest" (Exp: https://github.com/sedwards2009/extraterm/releases/latest)
        (Invoke-WebRequest "$github_redirected_url" -UseBasicParsing).RawContent -match '/tag/(?<FullVersion>v?(?<Version>[\d\.]*))"' # Get version to re-use for expanded_assets        
    }

    $github_expanded_assets = "$github_repository_root" + '/releases/expanded_assets/' + $matches.FullVersion
    Write-Host "github_expanded_assets: $github_expanded_assets"

    $isVersionMatched = $false

    # "2022-03-08" to "2022.03.08" - Exp: https://github.com/fontforge/fontforge/releases/tag/20220308
    $version = $matches.Version -replace "-", "."    
    $regex32 = $ArgumentList.regex32;
    $regex64 = $ArgumentList.regex64;
    $output = @{}

    # If Version is not null or empty
    <#If (-Not([string]::IsNullOrEmpty($version))) {
        # If version in the $github_expanded_assets URL has not the correct format - Ex: 2.0.12R -> 2.0.12 (source-han-code-jp)
        If ($version -NotMatch "^[\d\.]+$") {
            $version = $version -replace '([\d\.]+).*', '$1'
        }        
        $download_page = Invoke-WebRequest -Uri $github_expanded_assets -UseBasicParsing
        
    } Else {
        # If "${github_repository_root}/releases/latest" does not redirect to an URL like '/tag/v(?<Version>.*)'
        # Ex: zVirtualDesktop - <h1 data-view-component="true" class="d-inline mr-3">1.0.98.14</h1>        
        $download_page = Invoke-WebRequest -Uri $github_redirected_url -UseBasicParsing
        
        $version = $download_page -match '<h1 data-view-component="true" class="d-inline mr-3">(?<Version>[\d\.]+)<'
    }#>

    $download_page = Invoke-WebRequest -Uri $github_expanded_assets -UseBasicParsing
    $used_page = $github_expanded_assets

    If ($regex64) {
        $uri64_path = ($download_page.links | ? href -match $regex64 | select -Last 1).href

        If ([string]::IsNullOrEmpty($uri64_path)) {
            $uri64_path = $download_page.Links.href -match $regex64
            # If regex64 unavailable on $github_expanded_assets URL, we try on $github_redirected_url
            If ([string]::IsNullOrEmpty($uri64_path)) {
                $download_page = Invoke-WebRequest -Uri $github_redirected_url -UseBasicParsing
                $uri64_path = $download_page.Links.href -match $regex64
                If ([string]::IsNullOrEmpty($uri64_path)) {
                    Write-Error "$regex64 not found in links displayed on $github_expanded_assets and $github_redirected_url" -ErrorAction Stop
                }
            }
        }

        If ($uri64_path -match "^https://") {
            $output += @{ URL64 = $uri64_path }
        } Else {
            $output += @{ URL64 = $github_url + $uri64_path }
        }
        
        # Version found -> Added to output (Should be only added after checking format?)
        If ($version) {
            $output += @{ Version = $version -replace '-', '.' }            
            # Si la version de $github_expanded_assets contient \d.\d (contrairement à https://github.com/fontforge/fontforge/releases/tag/20220308 par exemple)
            If ($version -match "[\d\.]+") {
                $isVersionMatched = $true
            }            
        } ElseIf ($matches.Version) {
            Write-Host $matches.Version
            # cleanVersion - Ex: source-han-code-jp - 2.0.12R -> 2.0.12
            $version = $matches.Version -replace "([\d\.]+).*", '$1'
            $isVersionMatched = $true
            # handle beta version - Ex: littlenavmap
            If ($version -match '\.beta') {
                $version = $version -replace '\.beta', '-beta'
            }
            $output += @{ Version = $version -replace '-', '.' }            
        }
    }

    If ($regex32) {            
        $uri32_path = ($download_page.links | ? href -match $regex32 | select -Last 1).href

        If ([string]::IsNullOrEmpty($uri32_path)) {            
            $uri32_path = $download_page.Links.href -match $regex32
            # If regex32 unavailable on $github_expanded_assets URL, we try on $github_redirected_url
            If ([string]::IsNullOrEmpty($uri32_path)) {
                $download_page = Invoke-WebRequest -Uri $github_redirected_url -UseBasicParsing
                $uri32_path = $download_page.Links.href -match $regex32
                If ([string]::IsNullOrEmpty($uri32_path)) {
                    Write-Error "$regex32 not found in links displayed on $github_expanded_assets and $github_redirected_url" -ErrorAction Stop
                }
            }
        }

        If ($uri32_path -match "^https://") {
            $output += @{ URL32 = $uri32_path }
        } Else {
            $output += @{ URL32 = $github_url + $uri32_path }
        }

        If (($version) -And ($isVersionMatched -eq $false)) {            
            # If version contained in $github_expanded_assets match \d\.\d (contrarily to https://github.com/fontforge/fontforge/releases/tag/20220308 for example)
            # we grab the version from regex32            
            If ($version -NotMatch "\d\.\d") {
                $version = $matches.Version
                $isVersionMatched = $true
            }
            $output += @{ Version = $version -replace '-', '.' }
        } ElseIf (($matches.Version) -And ($isVersionMatched -eq $false)) {            
            # cleanVersion - Ex: source-han-code-jp - 2.0.12R -> 2.0.12
            $version = $matches.Version -replace "([\d\.]+).*", '$1'
            # handle beta version - Ex: littlenavmap
            If ($version -match '\.beta') {
                $version = $version -replace '\.beta', '-beta'
            }
            $output += @{ Version = $version }
        }
    }

    If (-Not($output.Version)) { Write-Error "Version is missing." -ErrorAction Stop }
    If ((-Not($output.URL32))-And(-Not($output.URL64))) { Write-Error "URL32 and/or URL64 are missing." -ErrorAction Stop }

    If ($debug) {
        Write-Host "github_releases_latest:" "${github_repository_root}/releases/latest"
        Write-Host "github_redirected_url:" $github_redirected_url
        Write-Host "github_latest_version:" $github_latest_version
        Write-Host "github_expanded_assets:" $github_expanded_assets        
        Write-Host "Regex32:" $ArgumentList.regex32
        Write-Host "Regex64:" $ArgumentList.regex64
        Write-Host "Version:" $output.Version
        Write-Host "uri32_path: " $uri32_path
        Write-Host "uri64_path: " $uri64_path
        Write-Host "output: " ($output | Format-Table | Out-String)
    }

    return $output
}

#Set-PsDebug -Trace 0