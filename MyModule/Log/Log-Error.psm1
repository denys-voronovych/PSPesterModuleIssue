function Log-Error
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
        $FormattedMessage = Format-LogMessage $message 'Debug'
        #todo implement exception capturing and outputting
        Write-Host $FormattedMessage -ForegroundColor Red
        Write-Log $FormattedMessage
    }
    end{}
}