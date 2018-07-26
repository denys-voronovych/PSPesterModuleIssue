function Log-Debug
{
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$true,Position=0,ValueFromPipeline=$true)]
        [string]
        $message
    )
    begin{}
    process
    {
        $FormattedMessage = Format-LogMessage $message 'Info'
        Write-Host $FormattedMessage
        Write-Log $FormattedMessage
    }
    end{}
}