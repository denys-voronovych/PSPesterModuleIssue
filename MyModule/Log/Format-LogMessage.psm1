function Format-LogMessage
{
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$true,Position=0,ValueFromPipeline=$true)]
        [string]
        $message,

        [Parameter(Mandatory=$false,Position=1)]
        [ValidateSet('Error', 'Warning', 'Info', 'Debug')]
        [string]
        $Severity = 'Info'
    )
    begin{}
    process
    {
        switch ($Severity)
        {
            'Debug'   {$ShortSeverity = 'DBG'}
            'Info'    {$ShortSeverity = 'INF'}
            'Warning' {$ShortSeverity = 'WRN'}
            'Error'   {$ShortSeverity = 'ERR'}
        }
        return "$(Get-Date -Format 's') $($ShortSeverity): $message"
    }
    end{}
}