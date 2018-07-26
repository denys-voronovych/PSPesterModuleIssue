$ModuleName = 'MyModule'
if (!(Get-Module $ModuleName))
{
    $ModulePath = $(Join-Path $(Split-path (Split-Path $MyInvocation.MyCommand.Definition -Parent) -Parent) "$($ModuleName).psd1")
    Write-Host $ModulePath
    Import-Module $ModulePath -Force -DisableNameChecking
}
if (Get-Module 'MyModule') {Write-Host 'Module Imported successfully!'}

InModuleScope $ModuleName {
    Describe 'Get-Lolz' {
        Context "When the imput parameter is ' ' (Working)" {
            Mock Get-Lolz { '95834512077' }

            $result = Get-Lolz ' '

            it "returns string of numbers" {
                $result | Should -Match '\d+'
            }
        }

        Context "When the imput parameter is ' ' (Failing)" {
            Mock Log-Debug
            Mock Log-Info
            Mock Out-DebugVariable

            $result = Get-Lolz ' '

            it "returns string of numbers" {
                $result | Should -Match '\d+'
            }
        }
    }
}

<#
Describe 'Get-Lolz' {
    Context "When the imput parameter is ' ' (Working)" {
        Mock Get-Lolz { '95834512077' }

        $result = Get-Lolz ' '

        it "returns string of numbers" {
            $result | Should -Match '\d+'
        }
    }

    Context "When the imput parameter is ' ' (Failing)" {
        Mock Log-Debug -ModuleName 'MyModule'
        Mock Log-Info -ModuleName 'MyModule'
        Mock Out-DebugVariable -ModuleName 'MyModule'

        $result = Get-Lolz ' '

        it "returns string of numbers" {
            $result | Should -Match '\d+'
        }
    }
}
#>