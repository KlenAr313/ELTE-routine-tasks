if (Test-Path .\OddLines.txt){
    Remove-Item .\OddLines.txt
}
if (Test-Path .\EvenLines.txt){
    Remove-Item .\EvenLines.txt
}
if (!(Test-Path $args[0])){
    Write-Host (-join("Nem létezik ", $args[0], " file"))
}
else{
    $data = Get-Content $args[0]
    for([int]$i = 0; $i -lt $data.Count; $i = $i + 1){
        $a = ($i + 1) % 2
        if($a -eq 0){
            Write-Output $data[$i] >> EvenLines.txt
        }
        else{
            Write-Output $data[$i] >> OddLines.txt
        }
    }
}
