list :: [Int] -> [[Int]]
list (x:[]) = [n | n <- [1..x]] : []
list (x:xs) = [n | n <- [1..x]] : list xs
--list (x:[]) = [n | n <- [1..x]]
--list (x:xs) = concat [[n | n <- [1..x]] ++ list xs]

listList :: Int -> [[Int]]
listList a = list [n | n <- [1..a]]

isDoubleton :: [a] -> Bool
isDoubleton (_:_:[]) = True
isDoubleton _ = False

isNegative :: (Ord a, Num a) => a -> Bool
--isNegative n = n < 0
isNegative n
  | n < 0 = True
           | otherwise = False  -- otherwise == True
