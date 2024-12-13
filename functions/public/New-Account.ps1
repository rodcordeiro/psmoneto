function New-Account {
    <#
.SYNOPSIS
    Creates a new account
.DESCRIPTION
    This function creates a new account entry at moneto
.EXAMPLE
    New-Account
    Create a new account entry at moneto
.NOTES
    Version: 1.0
#>

    [CmdletBinding()]
    param(
        # Account Name
        [Parameter(Mandatory = $true)]
        [string]$Name,

        # Account ammount. e.g. 10, 10.5, 1, 0.58
        [Parameter(Mandatory = $true)]
        [decimal]$Amount,

        # Account payment type name. e.g. Debit, Credit, Investiment
        [Parameter(Mandatory = $true)]
        [string]$PaymentType,

        # Account threshold. This threshold is used to set alarms for account limits
        [Parameter(Mandatory = $true)]
        [decimal]$Threshold
    )
    begin {
        $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $headers.Add("Content-Type", "application/json")
        $headers.Add("Authorization", "Bearer $($env:MONETO_AUTH_TOKEN)")
        $url = [URI]::EscapeUriString("$MONETO_API_URL/api/v1/accounts")
        [PaymentType[]]$payments = (Get-PaymentType)
    }
    process {
        if ($null -ne $PSItem ) {
            $name = $PSItem.Name
            $amount = $PSItem.Amount
            $paymentType = $PSItem.PaymentType
            $threshold = $PSItem.Threshold
        }
        if (!$paymentType) {

            $paymentTypeForm = (Invoke-ListBox -title 'Select Payment Type' -content 'Selecione um tipo de pagamento para prosseguir' -map {
                    param($listBox)
                    foreach ($item in $payments) {
                        [void] $listBox.Items.Add($item.name)
                    }
                })

            if ($paymentTypeForm) {
                $selectedPaymentType = $($payments | Where-Object { $_.name -eq $paymentTypeForm })
            }
            else {
                throw "PaymentType cancelled"
            }
        }
        else {
            $selectedPaymentType = ($payments | Where-Object { $_.name -like "*$paymentType*" })
        }
        if (!$selectedPaymentType) { throw "Payment not found" }
        if (($selectedPaymentType | Measure-Object).Count -gt 1) { throw "Payment filter returned more than one value. Please be more specific." }

        $body = @{
            name        = $Name
            amount      = $Amount
            paymentType = $selectedPaymentType.uuid
            threshold   = $Threshold
        } | ConvertTo-Json

        $response = Invoke-RestMethod -Method Post -Uri $url -Headers $headers -Body $body
        Write-Output $response
    }
}

