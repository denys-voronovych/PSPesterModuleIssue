function Out-DebugVariable
{
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$true,Position=0)]
        [string]
        $VariableName,

        [parameter(Mandatory=$true,Position=1)]
        $VariableValue
    )
    begin {}
    process
    {
        Log-Debug "$VariableName : '$(($VariableValue|Out-String).Trim())'"
    }
    end {}
}