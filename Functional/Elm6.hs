table = 9

queens :: Int -> [[Int]]
queens 0 = [[]]
queens n = [q:b | b <- queens (n-1), q <- [0..table -1], safe' b q ]

safe :: [Int] -> Int -> Bool
safe b q = and [ not (checks b q i) | i <- [0..length b-1]]

checks :: [Int] -> Int -> Int -> Bool
checks b q i = q == b !! i || abs (q - b !! i ) == i + 1

safe' :: [Int] -> Int -> Bool
safe' b q = and [ not (checks' q' q i) | (i,q') <- zip [0..] b ]

checks' :: Int -> Int -> Int -> Bool
checks' q' q i = q == q' || abs (q - q' ) == i + 1

safe'' b q = sfT b q 0
    where
        sfT [] q i = True
        sfT (q':qs) q i = q /= q' && abs (q - q' ) /= i + 1 && sfT qs q (i + 1)

main = print $ length $ queens table
