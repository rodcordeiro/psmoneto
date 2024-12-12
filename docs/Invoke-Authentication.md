---
external help file: psmoneto-help.xml
Module Name: psmoneto
online version:
schema: 2.0.0
---

# Invoke-Authentication

## SYNOPSIS
Authenticate to moneto

## SYNTAX

```
Invoke-Authentication [-email] <String> [-password] <SecureString> [<CommonParameters>]
```

## DESCRIPTION
This function authenticates to moneto and saves the token to the current environment

## EXAMPLES

### EXEMPLO 1
```
Invoke-Authentication -email Test@test.com -password Teste
```

Authenticate to moneto with Test@test.com email

## PARAMETERS

### -email
The email to authenticate

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -password
The password  as a securestring to be used

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### [System.string] email
### The email to authenticate
### [System.SecureString] password
### The password secure string to be used
## OUTPUTS

## NOTES
Version: 1.0

## RELATED LINKS
