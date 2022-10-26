import Data.Char

listDiff :: Eq a => [a] -> [a] -> [a]
listDiff xs [] = xs
listDiff [] _ = []
listDiff (x:xs) ys = (contains x ys) ++ (listDiff xs ys)
    where 
        contains :: Eq a => a -> [a] -> [a]
        contains x [] = [x] 
        contains x (y:ys)
            | x == y = []
            | otherwise = contains x ys 

validGame :: String -> Bool
validGame str = validGameH (words str)
    where
        validGameH :: [String] -> Bool
        validGameH (x:[]) = True
        validGameH (x:y:xs)
            | (last x) == (head y) = validGameH (y:xs)
            | otherwise = False

countSingletons :: [[a]] -> Int
countSingletons xs = countSingletonsH xs 0
    where
        countSingletonsH :: [[a]] -> Int -> Int
        countSingletonsH [] c = c
        countSingletonsH ((y:[]):xs) c = countSingletonsH xs ( c + 1 )
        countSingletonsH (x:xs) c = countSingletonsH xs c

sameParity :: [Int] -> Bool
sameParity [] = True
sameParity (x:[]) = True
sameParity (x:y:xs)
    | (mod x 2) == (mod y 2) = sameParity (x:xs)
    | otherwise = False

longestChain :: String -> Int
longestChain xs = longestChainH xs 1 1
    where
        longestChainH :: String -> Int -> Int -> Int
        longestChainH [] _ _ = 0
        longestChainH (x:[]) _ max = max
        longestChainH (x:y:xs) current max
            | (x == y) && ((current + 1) > max) = longestChainH (y:xs) (current + 1) (current + 1)
            | (x == y) && ((current + 1) <= max) = longestChainH (y:xs) (current + 1) max
            | otherwise = longestChainH (y:xs) 1 max

normalizeText :: String -> String
normalizeText str = (filter isAsciiUpper (map toUpper str))

--normalizeText str = filter (<='Z') (filter (>='A') (map toUpper str))

{-normalizeText (x:xs)
    | x <= 'Z' && x >= 'A' = [x] ++ normalizeText xs
    | x <= 'z' && x >= 'a' = [(toUpper x)] ++ normalizeText xs
    | otherwise = [] ++ normalizeText xs-}
