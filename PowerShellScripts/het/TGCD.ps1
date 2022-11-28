[int]$a = Read-Host "Kérem az első számot"
[int]$b = Read-Host "Kérem a második számot"

if($b -gt $a){
    $c = $a
    $a = $b
    $b = $c
}

while ($b -ne 0){
    $c = $b
    $b = $a % $b
    $a = $c
}

$a = [Math]::Abs($a)

Write-Output (-join("Leggnagyobb közös osztójuk: ", $a))