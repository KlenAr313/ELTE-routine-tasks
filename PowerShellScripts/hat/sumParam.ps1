$a=[Int]$args[1]+[Int]$args[0]
Write-Host (-join($args[0]," és ",$args[1]," összege: ",$a))
$a=[Int]$args[1]*[Int]$args[0]
Write-Host (-join($args[0]," és ",$args[1]," szorzata: ",$a))