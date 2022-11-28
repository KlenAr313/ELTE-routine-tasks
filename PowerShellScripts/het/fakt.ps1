param(
    [parameter(mandatory=$true)][int]$szam
)


    [int]$a = $szam
    $mul = 1
    while($a -ne 1){
        $mul = $mul * $a
        $a = $a-1
    }
    Write-Host (-join("A(z) ", $szam, " faktoriálisa: ", $mul))
