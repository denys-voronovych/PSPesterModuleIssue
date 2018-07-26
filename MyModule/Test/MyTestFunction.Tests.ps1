$ModuleName = 'MyModule'
if (!(Get-Module $ModuleName))
{
    Import-Module $(Join-Path $(Split-Path $MyInvocation.MyCommand.Definition -Parent) '..\MyModule.psd1') -Force -DisableNameChecking
}

Describe 'MyTestFunction' {
    Context 'When the imput parameter is $null' {
        Mock Log-Debug
        Mock Log-Info
        Mock Out-DebugVariable

        $result = MyTestFunction $null

        it "returns string of numbers" {
            $result | Should -Match '\d+'
        }
    }
}