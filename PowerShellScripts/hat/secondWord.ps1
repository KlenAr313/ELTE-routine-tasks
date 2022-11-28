$a = Get-Content $args[0]
foreach($i in $a)
{
    $b = $i.Split(' ') 
    Write-Host $b[1]
}