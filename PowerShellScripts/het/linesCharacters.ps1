[Int]$k = Read-Host "Kérem a kisseb sorszámot"
[Int]$n = Read-Host "Kérem a nagyobb sorszámot"
if($k -gt $n)
{
    $s = $k
    $k = $n
    $n = $s
}
Write-Host (-join("A paraméterként kapott file soraina ", $k, "-", $n, ". karaktere:"))
$k = $k-1
$n = $n - $k
foreach($i in (Get-Content $args[0]))
{
    Write-Host $i.Substring($k,$n)
}
