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

