#3. feladat
#a részfeladat
Write-Host "a) Akiknek nincs szerdán órája:"
$szerda = Get-Content $args[0] | Where-Object {$_ -match '.*Sz,.*'}
if($szerda.Count -eq 0){
    "NINCS"
}
else{
    foreach($i in $szerda){
        $i.Split(',')[0]
    }
}
""
#b részfeladat
Write-Host "b) A tanárok, és óraszámuk"
$data = Get-Content $args[0]
foreach($i in $data){
    $orak = $i -replace '[a-z]'
    $orak = $orak -replace '-'
    $orak = $orak -replace ','

    $orak = $orak -replace '\s+', ' '
    $orak = $orak -replace '^ '
    $orak = $orak -replace ' $'
    [int]$a = (($orak.Length + 1)/ 2)
    Write-Host (-join($i.Split(',')[0], ": ", $a))
}
""
#c részfeladat
$nap = Read-Host "c) akiknek nics első órája ezen a napon (H, K, Sz, Cs, P)"

$index
switch($nap){
    "H" {$index = 1}
    "K" {$index = 2}
    "Sz" {$index = 3}
    "Cs" {$index = 4}
    "P" {$index = 5}
}


foreach($i in $data){
    [string]$b = $i.Split(',')[$index]
    $b = $b -replace '[a-z]'
    $b = $b -replace '^ '
    $b = $b -replace '^ '
    $b = $b + ' '
    if(!($b.ToCharArray()[0] -eq '1' -and $b.ToCharArray()[1] -eq ' ')){
        $i.Split(',')[0]
    }
}
