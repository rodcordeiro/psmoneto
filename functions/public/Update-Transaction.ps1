function Update-Transaction {
    <#
.SYNOPSIS
    Update a transaction
.DESCRIPTION
    This function update transaction entry at banky
.EXAMPLE
    Update-BankyTransaction
    Update a transaction entry at banky
.NOTES
    Version: 1.0
#>
    [CmdletBinding(ConfirmImpact = 'None')]
    param (
        # Transaction to be updated
        [Parameter(Mandatory = $true, ValueFromPipeline)]
        [ValidatePattern("^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$")]
        [string]$id,
        # Account to be used, if not specified the user will be prompted to select it in a listbox.
        [Parameter(Mandatory = $false, ValueFromPipeline)]
        [string]$account,
        # Category to be used, if not specified the user will be prompted to select it in a listbox.
        [Parameter(Mandatory = $false, ValueFromPipeline)]
        [string]$category,
        # Transaction description
        [Parameter(Mandatory = $false, ValueFromPipeline)]
        [string]$description,
        # Transaction value
        [Parameter(Mandatory = $false, ValueFromPipeline)]
        [decimal]$value,
        # Transaction date at ISO format
        [Parameter(Mandatory = $false, ValueFromPipeline)]
        [datetime]$date,
        # If account parameter is specified, the script will search for the account with a similar name, breaking if it returns more than one account. This switch disables the like filter.
        [Parameter(Mandatory = $false, ValueFromPipeline)]
        [switch]$AccountMatchExact
    )
    begin {
        $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $headers.Add("Content-Type", "application/json")
        $headers.Add("Authorization", "Bearer $($env:MONETO_AUTH_TOKEN)")

        $accounts = (Get-Account)
        $categories = (Get-Category)
    }
    process {
        if ($null -ne $PSItem ) {
            $id = $PSItem.id
            $account = $PSItem.account
            $category = $PSItem.category
            $description = $PSItem.description
            $value = $PSItem.value
            $date = $PSItem.date
            $AccountMatchExact = $PSItem.AccountMatchExact
        }
        $transaction = [UpdateTransaction]::new($id)
        $transaction.description = if ($description) { $description }
        $transaction.value = if ($value) { $value }
        $transaction.date = if ($date) { get-date -Format 'yyyy-MM-ddTHH:mm:ss' -Date $date }

        if (($transaction.value) -and ($transaction.value -eq 0)) {
            throw "O valor da transacao nao pode ser zero"
        }

        if ($account) {
            $selectedAccount = if ($AccountMatchExact) { $accounts | Where-Object { $_.name -eq $account } } else { $accounts | Where-Object { $_.name -like "*$account*" } }
            if (!$selectedAccount) { throw "Account not found" }
            if (($selectedAccount | Measure-Object).Count -gt 1) { throw "Account filter returned more than one value. Please be more specific." }
            $transaction.account = $selectedAccount.id
        }

        if ($category) {

            foreach ($cat in $categories) {
                if ($cat.name -like "*$category*") { $selectedCategory = $cat }
                if ($cat.subcategories) {
                    foreach ($subcategory in $cat.subcategories) {
                        if ($subcategory.name -like "*$category*") { $selectedCategory = $subcategory }
                    }
                }
            }
            $transaction.category = $selectedCategory.id
        }
        $body = $transaction | Remove-Null | ConvertTo-Json -Depth 1

        $url = [URI]::EscapeUriString("$MONETO_API_URL/api/v1/transactions/$($transaction.id)")

        $response = Invoke-RestMethod $url -Method 'PATCH' -Body $body -Headers $headers
        Write-Output $response
    }
    end {}
}