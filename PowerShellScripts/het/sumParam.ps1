[int]$sum = 0
if((@($input).Count) -eq 0){
    $args | ForEach-Object -Process {$sum = $sum + $_}
}
else{
    $input.Reset()
    foreach($i in $input){
        $sum = $sum + $i
    }
}
Write-Host $sum
