-- #1 a head visszaadja az első elemet egy listából
--    a last visszaadja az utolsó elemet egy listából, ez a költségesebb

-- #2 [(2,3),(4,5),(6,9),(8,8)]

sumPairs :: Num a => [(a,a)] -> [a]
sumPairs [] = []
sumPairs ((a,b):xs) = (a + b) : sumPairs(xs)

signumList :: (Num a, Ord a) => [a] -> [Int]
signumList [] = []
signumList (x:xs)
    | x == 0 = 0 : signumList xs
    | x > 0 = (1) : signumList xs
    | x < 0 = (-1) : signumList xs

isSuffixOf :: Eq a => [a] -> [a] -> Bool
isSuffixOf [] _ = True
isSuffixOf _ [] = False
isSuffixOf xs ys = isSuffixOfR (reverse xs) (reverse ys)
    where
        isSuffixOfR :: Eq a => [a] -> [a] -> Bool
        isSuffixOfR [] _ = True
        isSuffixOfR (x:xs) (y:ys)
            | x == y = isSuffixOfR xs ys
            | otherwise = False 
