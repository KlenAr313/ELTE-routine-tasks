[int]$n = Read-Host "Írj be egy természetes számot"
if($n -lt 0){
    "Szar ügy, nem természetes számpt írtál be!"
}
elseif($n -eq 0){
    "A szám nem prím"
}
elseif($n -eq 1){
    "A szám se nem prím, se nem összetett"
}
else{
    $i = 2
    for($i = 2; $i -lt $n; $i++){
        if(($n % $i) -eq 0){
            "A szám nem prím"
            break
        }
    }
    if($n -eq $i){
        "A szám prím"
    }
}