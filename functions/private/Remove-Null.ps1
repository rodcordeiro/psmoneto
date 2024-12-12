function Remove-Null {
    param(
        [Parameter(ValueFromPipeline)]
        [PSCustomObject]$entityIn
    )
    process {
        $entity = @{}

        $entityIn.PSObject.Properties.Where({ $null -ne $_.Value -and $_.Value -ne "" -and $_.Name -ne "id" }) | ForEach-Object {
            $entity[$_.Name] = $_.Value
        }

        return $entity
    }
}