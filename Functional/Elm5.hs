fact' :: Integer -> Integer
fact' 1 = 1
fact' n = n * fact' (n-1)