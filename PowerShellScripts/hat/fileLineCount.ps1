$a = Get-Content $args[0] | Measure-Object
"A $args sorainak száma " + $a.Count