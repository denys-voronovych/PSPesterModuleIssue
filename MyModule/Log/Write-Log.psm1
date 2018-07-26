function Write-Log
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
        #todo implement actual logging
        Write-Host $message -ForegroundColor Cyan
    }
    end{}
}