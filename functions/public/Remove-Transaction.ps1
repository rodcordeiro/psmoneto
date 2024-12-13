function Remove-Transaction {
    <#
.SYNOPSIS
    Removes a transaction
.DESCRIPTION
    This function removes transaction entry at banky
.EXAMPLE
    Remove-BankyTransaction
    Removes a transaction entry at banky
.NOTES
    Version: 1.0
#>
    [CmdletBinding()]
    param (
        # Transaction to be removed
        [Parameter(Mandatory = $true, ValueFromPipeline)]
        [ValidatePattern("^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$")]
        [string]$id
    )

    begin {
        $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $headers.Add("Authorization", "Bearer $($env:MONETO_AUTH_TOKEN)")
    }

    process {
        if ($null -ne $PSItem ) {
            $id = $PSItem.id
        }

        $url = [URI]::EscapeUriString("$MONETO_API_URL/api/v1/transactions/$($id)")
        $response = Invoke-RestMethod $url -Method Delete -Headers $headers
        Write-Output $response
    }

    end {
    }
}