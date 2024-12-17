function Get-Category {
    [CmdletBinding()]
    param ()
    begin {
        $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $headers.Add("Content-Type", "application/json")
        $headers.Add("Authorization", "Bearer $($env:MONETO_AUTH_TOKEN)")
        $url = [URI]::EscapeUriString("$MONETO_API_URL/api/v1/categories")
    }
    process {
        $response = Invoke-RestMethod $url -Method 'GET' -Headers $headers
        [Category[]]$data = @()

        foreach ($category in [Category[]]$response) {
            $data += $category
            if ($category.subcategories) {
                $data += $category.subcategories
            }
        }
        
        Write-Output $data
    }
    
    end {}
}