function Invoke-Authentication {
    <#
.SYNOPSIS
    Authenticate to moneto
.DESCRIPTION
    This function authenticates to moneto and saves the token to the current environment
.PARAMETER email
    The email to authenticate
.PARAMETER password
    The password  as a securestring to be used
.EXAMPLE
    Invoke-Authentication -email Test@test.com -password Teste
    Authenticate to moneto with Test@test.com email
.INPUTS
    [System.string] email
        The email to authenticate
    [System.SecureString] password
        The password secure string to be used
.NOTES
    Version: 1.0
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][ValidatePattern("[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+")][string]$email,
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][SecureString]$password 
    )
    begin {
        $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $headers.Add("Content-Type", "application/json")
        $url = [URI]::EscapeUriString("$MONETO_API_URL/api/v1/auth/login")
    }
    process {
        $body = @"
{
    `"email`": `"$($email)`",
    `"password`": `"$(Unprotect-SecureString $password)`"
}
"@ 


        $response = Invoke-RestMethod $url -Method 'POST' -Headers $headers -Body $body        
        $env:MONETO_AUTH_TOKEN = $response.access_token

    }
}