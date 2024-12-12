---
external help file: psmoneto-help.xml
Module Name: psmoneto
online version:
schema: 2.0.0
---

# New-Account

## SYNOPSIS
Creates a new account

## SYNTAX

```
New-Account [-Name] <String> [-Amount] <Decimal> [-PaymentType] <String> [-Threshold] <Decimal>
 [<CommonParameters>]
```

## DESCRIPTION
This function creates a new account entry at moneto

## EXAMPLES

### EXEMPLO 1
```
New-Account
```

Create a new account entry at moneto

## PARAMETERS

### -Name
Account Name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Amount
Account ammount.
e.g.
10, 10.5, 1, 0.58

```yaml
Type: Decimal
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PaymentType
Account payment type name.
e.g.
Debit, Credit, Investiment

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Threshold
Account threshold.
This threshold is used to set alarms for account limits

```yaml
Type: Decimal
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Version: 1.0

## RELATED LINKS
