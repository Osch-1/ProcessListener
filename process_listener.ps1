param(
    [string]
    [Parameter(Mandatory=$true)]
    $ProcessName
)

$Process = Get-Process($ProcessName) -ErrorAction SilentlyContinue

if ($null -eq $Process)
{
    Write-Host("No process with name " + $ProcessName + " has been found, try to run script later.");
    exit;
}

while ($true) {
    $Process = Get-Process($ProcessName) -ErrorAction SilentlyContinue
    if ($null -eq $Process)
    {
        Stop-Computer -ComputerName localhost
    }
}