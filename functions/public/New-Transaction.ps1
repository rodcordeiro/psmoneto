function New-Transaction {
    <#
.SYNOPSIS
    Create a transaction
.DESCRIPTION
    This function creates a new transaction entry at moneto
.EXAMPLE
    New-Transaction
    Create a new transaction entry at moneto
.NOTES
    Version: 1.0
#>
    [CmdletBinding()]
    param(
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
        $url = [URI]::EscapeUriString("$MONETO_API_URL/api/v1/transactions")
        $accounts = (Get-Account)
        $categories = (Get-Category)
    }
    process {
        if ($null -ne $PSItem ) {
            $account = $PSItem.account
            $category = $PSItem.category
            $description = $PSItem.description
            $value = $PSItem.value
            $date = $PSItem.date
            $AccountMatchExact = $PSItem.AccountMatchExact
        }
        
        if (!$account) {

            $accountForm = (Invoke-ListBox -title 'Select Account' -content 'Selecione uma conta para prosseguir' -map {
                    param($listBox)
                    foreach ($item in $accounts) {
                        [void] $listBox.Items.Add($item.name)
                    }
                })

            if ($accountForm) {
                $selectedAccount = $($accounts | Where-Object { $_.name -eq $accountForm })
            }
            else {
                throw "Account cancelled"
            }
        }
        else {
            $selectedAccount = if ($AccountMatchExact) { $accounts | Where-Object { $_.name -eq $account } } else { $accounts | Where-Object { $_.name -like "*$account*" } }
        }
        if (!$selectedAccount) { throw "Account not found" }
        if (($selectedAccount | Measure-Object).Count -gt 1) { throw "Account filter returned more than one value. Please be more specific." }
        if (!$category) {

            $categoryForm = (Invoke-ListBox -title 'Select Category' -content 'Selecione uma categoria para prosseguir' -map {
                    param($listBox)
                    foreach ($item in $categories) {
                        [void] $listBox.Items.Add("$(if($item.positive){"(+)"}else{"(-)"}) $($item.name)")
                        if ($category.subcategories) {
                            foreach ($subcategory in $category.subcategories) {
                                [void] $listBox.Items.Add("$(if($subcategory.positive){"(+)"}else{"(-)"}) $($subcategory.name)")
                            }
                        }
                    }
                })

            if ($categoryForm) {
                $category = $categoryForm.ToString().Split(" ")[1]
                foreach ($cat in $categories) {
                    if ($cat.name -eq $category) { $selectedCategory = $cat }
                    if ($cat.subcategories) {
                        foreach ($subcategory in $cat.subcategories) {
                            if ($subcategory.name -eq $category) { $selectedCategory = $subcategory }
                        }
                    }
                }
            }
            else {
                throw "Category cancelled"
            }

        }
        else {

            foreach ($cat in $categories) {
                if ($cat.name -like "*$category*") { $selectedCategory = $cat }
                if ($cat.subcategories) {
                    foreach ($subcategory in $cat.subcategories) {
                        if ($subcategory.name -like "*$category*") { $selectedCategory = $subcategory }
                    }
                }
            }
        }

        if (!$selectedCategory) { throw "Category not found" }
        if (($selectedCategory | Measure-Object).Count -gt 1) { throw "Category filter returned more than one value. Please be more specific." }

        $transaction = [CreateTransaction]::new()
        $transaction.category = $selectedCategory.uuid
        $transaction.account = $selectedAccount.uuid
        $transaction.description = if ($description) { $description } else { Read-Host "Informe a descricao da transacao" }
        $transaction.value = if ($value) { $value } else { Read-Host "Informe o valor da transacao" }
        $transaction.date = if ($date) { get-date -Format 'yyyy-MM-ddTHH:mm:ss' -Date $date } else { $(get-date -Format 'yyyy-MM-ddTHH:mm:ss') }

        if ($transaction.value -eq 0) {
            throw "O valor da transacao nao pode ser zero"
        }
        $body = $($transaction | ConvertTo-Json)
        $response = Invoke-RestMethod $url -Method 'POST' -Body $body -Headers $headers
        Write-Output $response
    }
    end {}
}