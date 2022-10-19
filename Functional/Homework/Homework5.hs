password :: [Char] -> [Char]
password [] = []
password (x:xs) = '*' : password xs

lookup' :: Eq a => a -> [(a, b)] -> b
--lookup' _ [] = NULL
lookup' n ((a,b):xs)
    | n == a = b
    | otherwise = lookup' n xs


toBin :: Integer -> [Int]
toBin a = toBinH [] a
    where
        toBinH :: [Int] -> Integer -> [Int]
        toBinH xs 0 = xs
        toBinH xs n = toBinH  ( xs ++ [(fromIntegral(mod n 2))])  (div n 2) 


remdup :: Eq a => [a] -> [a]
remdup [] = []
remdup xs = remdupH [] xs
    where 
        remdupH :: Eq a => [a] -> [a] -> [a]
        remdupH ls (x:[]) = ls ++ [x]
        remdupH ls (x:y:xs)
            | x == y = remdupH ls (y:xs)
            | otherwise = remdupH (ls ++ [x]) (y:xs)
