"Másodfokú egyenlet megoldó program"
[double]$a = Read-Host "Írd be az `"a`" eggyütthatót"
[double]$b = Read-Host "Írd be az `"b`" eggyütthatót"
[double]$c = Read-Host "Írd be az `"c`" eggyütthatót"
Write-Host (-join("Az egyenlet: ", $a, "*x^2+", $b, "*x+", $c, "=0"))

$dis = $b * $b - (4 * $a * $c)
if($dis -lt 0){
    "Nincs megoldás"
}
elseif($dis -gt 0){
    $fs = (0 - $b + [Math]::Sqrt($b * $b - 4 * $a * $c)) / (2 * $a)
    $ss = (0 - $b - [Math]::Sqrt($b * $b - 4 * $a * $c)) / (2 * $a)
    Write-Host (-join("Az egyenlet megoldásai: ", $fs, " és ", $ss))
}
else{
    $fin = 0 - $b / (2 * $a)
    Write-Host (-join("Egy megoldása van: ", $fin)) 
}