class PaymentType {
    [string]$uuid
    [string]$name
}
class Account {
    [ValidatePattern("^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$")][string]$uuid
    [string]$name
    [float]$ammount
    [float]$threshold
    [PaymentType]$paymentType
}

class Category {
    [ValidatePattern("^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$")][string]$uuid
    [string]$name
    [string]$icon
    [bool]$positive
    [bool]$internal
    [bool]$transient
    [ValidateSet(0, 1, 2)][int]$classification
    [AllowNull()][Category[]]$subcategories
}

class CreateTransaction {
    [string]$description
    [string]$date
    [decimal]$value
    [string]$account
    [string]$category
}