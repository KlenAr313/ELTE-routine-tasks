or' :: [Bool] -> Bool
or' = foldr (||) False

and' :: [Bool] -> Bool
and' = foldr (&&) True

concat' :: [[a]] -> [a]
concat' = foldr (++) []

length' :: [a] -> Int
length' = foldr (\ _ acc -> 1 + acc) 0

maximum' :: [Int] -> Int
maximum' = foldr (\ x acc -> if x > acc then x else acc) 0
