---
external help file: psmoneto-help.xml
Module Name: psmoneto
online version:
schema: 2.0.0
---

# Update-Transaction

## SYNOPSIS
Update a transaction

## SYNTAX

```
Update-Transaction [-id] <String> [[-account] <String>] [[-category] <String>] [[-description] <String>]
 [[-value] <Decimal>] [[-date] <DateTime>] [-AccountMatchExact] [<CommonParameters>]
```

## DESCRIPTION
This function update transaction entry at banky

## EXAMPLES

### EXEMPLO 1
```
Update-BankyTransaction
```

Update a transaction entry at banky

## PARAMETERS

### -id
Transaction to be updated

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -account
Account to be used, if not specified the user will be prompted to select it in a listbox.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -category
Category to be used, if not specified the user will be prompted to select it in a listbox.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -description
Transaction description

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -value
Transaction value

```yaml
Type: Decimal
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -date
Transaction date at ISO format

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -AccountMatchExact
If account parameter is specified, the script will search for the account with a similar name, breaking if it returns more than one account.
This switch disables the like filter.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Version: 1.0

## RELATED LINKS
