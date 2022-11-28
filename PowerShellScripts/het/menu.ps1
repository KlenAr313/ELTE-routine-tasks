do
{
    Clear-Host
    "Kérem válaszzon!"
    "1. Első menüpont"
    "2. Második menüpont"
    "3. Kilépés"
    $a = Read-Host
    if($a -eq "1"){
        "Első Menüpontot választotta"
    }
    elseif($a -eq "2"){
        "Második Menüpontot választotta"
    }
    elseif($a -eq "3"){
        "Kilépés!"
    }
    else{
        "Hibás választás!"
    }
    Start-Sleep 3
} until ($a -eq "3")