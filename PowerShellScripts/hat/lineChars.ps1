$a = Get-Content $args[0]
[Int]$b = Read-Host Től
[Int]$c = Read-Host Ig
$b = $b-1
$d = $c-$b
foreach($i in $a)
{ 
    Write-Host $i.Substring($b,$d)
}