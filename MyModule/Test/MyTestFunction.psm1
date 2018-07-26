function Get-Lolz
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true,Position=0)]
        [String]
        $SomeString
    )
    begin
    {
        Log-Debug 'Function Get-Lolz <start>'
    }
    process
    {
        Out-DebugVariable 'SomeString' $SomeString

        Log-Info "Doing something with '$SomeString'"
        try
        {
            $Output = ''
            for ($i=0,$i-lt100;$i++)
            {
                $Output += [String](Get-Random -Maximum 9)
            }
            Log-Debug $Output

            return $Output
        }
        catch
        {
            Log-Error "Something went wrong! (ex: $($_.Exception.Message))"
        }
    }
    end
    {
        Log-Debug 'Function Get-Lolz <end>'
    }
}