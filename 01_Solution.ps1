# Teamcity configuration
Set-StrictMode -Version Latest

# Error Handler
$ErrorActionPreference = "Stop"

# Functions
function GetPuzzleInput {
    [CmdletBinding()]
    param ()
    
    # $PSCommandPath get full path of the script 
    $path = $PSCommandPath.Replace("Solution.ps1","Input.txt")
    return (Get-Content -Path $path)
}

function CalculateFuel {
    [CmdletBinding()]
    param ($line) 
    return [math]::Truncate((([int]$line/3)-2)/1)
}

function Main {
    [CmdletBinding()]
    param () 

    Write-Host "[INFO] Get Puzzle Input" -ForegroundColor Green
    $input = GetPuzzleInput

    Write-Host "[INFO] Solve Puzzle"
    foreach ($line in $input) { [int]$result += CalculateFuel $line }
    
    Write-Host "[INFO] Solution $result" -ForegroundColor Green
}

# Main
Main 