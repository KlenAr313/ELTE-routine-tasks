import Data.Char

cipher :: String -> String
cipher (x:y:z:xs)
    | isLetter x && isLetter y && isDigit z = x:y:[]
    | otherwise = cipher (y:z:xs)
cipher _ = []

zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys


numberedABC :: [(Int, Char)]
numberedABC = zip' [1..] ['a'..'z']

stars :: String
stars = unwords [ ['*' | j <- [1..i]] | i <- [1..]]
