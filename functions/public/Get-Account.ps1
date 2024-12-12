function Get-Account {
    [CmdletBinding()]
    param()
    begin {
        $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $headers.Add("Content-Type", "application/json")
        $headers.Add("Authorization", "Bearer $($env:MONETO_AUTH_TOKEN)")
        $url = [URI]::EscapeUriString("$MONETO_API_URL/api/v1/accounts")
    }
    process {
        [Account[]]$response = Invoke-RestMethod $url -Method 'GET' -Headers $headers 
        Write-Output $response
    }	
}