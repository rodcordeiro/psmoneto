#
# Manifesto de módulo para o módulo 'psmoneto'
#
# Gerado por: RodCordeiro
#
# Gerado em: 12/12/2024
#
@{
    # Arquivo de módulo de script ou módulo binário associado a este manifesto.
    RootModule        = 'psmoneto.psm1'
    # Número da versão deste módulo.
    ModuleVersion     = '0.3.1'
    # PSEditions com suporte
    # CompatiblePSEditions = @()
    # ID usada para identificar este módulo de forma exclusiva
    GUID              = '94c44a59-db92-415a-9d1f-63114ad16a33'
    # Autor deste módulo
    Author            = 'RodCordeiro'
    # Empresa ou fornecedor deste módulo
    CompanyName       = 'Desconhecido'
    # Instrução de direitos autorais para este módulo
    Copyright         = '(c) 2024 RodCordeiro. Todos os direitos reservados.'
    # Descrição da funcionalidade fornecida por este módulo
    Description       = 'A CLI for Moneto Finance Personal Assistant'
    # A versão mínima do mecanismo do Windows PowerShell exigida por este módulo
    # PowerShellVersion = ''
    # Nome do host do Windows PowerShell exigido por este módulo
    # PowerShellHostName = ''
    # A versão mínima do host do Windows PowerShell exigida por este módulo
    # PowerShellHostVersion = ''
    # Versão mínima do Microsoft .NET Framework exigida por este módulo. Este pré-requisito é válido somente para a edição PowerShell Desktop.
    # DotNetFrameworkVersion = ''
    # A versão mínima do CLR (Common Language Runtime) exigida por este módulo. Este pré-requisito é válido somente para a edição PowerShell Desktop.
    # CLRVersion = ''
    # Arquitetura de processador (None, X86, Amd64, IA64) exigida por este módulo
    # ProcessorArchitecture = ''
    # Módulos que devem ser importados para o ambiente global antes da importação deste módulo
    # RequiredModules = @()
    # Assemblies que devem ser carregados antes da importação deste módulo
    # RequiredAssemblies = @()
    # Arquivos de script (.ps1) executados no ambiente do chamador antes da importação deste módulo.
    # ScriptsToProcess = @()
    # Arquivos de tipo (.ps1xml) a serem carregados durante a importação deste módulo
    # TypesToProcess = @()
    # Arquivos de formato (.ps1xml) a serem carregados na importação deste módulo
    # FormatsToProcess = @()
    # Módulos para importação como módulos aninhados do módulo especificado em RootModule/ModuleToProcess
    # NestedModules = @()
    # Funções a serem exportadas deste módulo. Para melhor desempenho, não use curingas e não exclua a entrada. Use uma matriz vazia se não houver nenhuma função a ser exportada.
    FunctionsToExport = '*'
    # Cmdlets a serem exportados deste módulo. Para melhor desempenho, não use curingas e não exclua a entrada. Use uma matriz vazia se não houver nenhum cmdlet a ser exportado.
    CmdletsToExport   = '*'
    # Variáveis a serem exportadas deste módulo
    VariablesToExport = '*'
    # Aliases a serem exportados deste módulo. Para melhor desempenho, não use curingas e não exclua a entrada. Use uma matriz vazia se não houver nenhum alias a ser exportado.
    AliasesToExport   = '*'
    # Recursos DSC a serem exportados deste módulo
    # DscResourcesToExport = @()
    # Lista de todos os módulos empacotados com este módulo
    # ModuleList = @()
    # Lista de todos os arquivos incluídos neste módulo
    # FileList = @()
    # Dados privados para passar para o módulo especificado em RootModule/ModuleToProcess. Também podem conter uma tabela de hash PSData com metadados adicionais do módulo usados pelo PowerShell.
    PrivateData       = @{
        PSData = @{
            # Tags aplicadas a este módulo. Elas ajudam na descoberta de módulos em galerias online.
            Tags       = @("CLI", "Finance")
            # Uma URL para a licença deste módulo.
            LicenseUri = "https://opensource.org/licenses/MIT"
            # Uma URL para o site principal deste projeto.
            ProjectUri = "https://github.com/rodcordeiro/psmoneto"
            # Uma URL para um ícone representando este módulo.
            IconUri    = 'https://raw.githubusercontent.com/rodcordeiro/psmoneto/main/assets/logo.svg'
            # ReleaseNotes deste módulo
            # ReleaseNotes = ''
        } # Fim da tabela de hash PSData

    } # Fim da tabela de hash PrivateData
    # URI de HelpInfo deste módulo
    HelpInfoURI       = 'https://raw.githubusercontent.com/rodcordeiro/psmoneto/main/docs/psmoneto-help.xml'
    # Prefixo padrão dos comandos exportados deste módulo. Substitua o prefixo padrão usando Import-Module -Prefix.
    # DefaultCommandPrefix = ''
}
