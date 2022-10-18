headTail :: [a] -> (a, [a])
headTail (x:xs) = (x, xs)

doubleHead :: [a] -> [b] -> (a, b)
doubleHead (x:xs) (y:ys) = (x,y)

hasZero :: [Int] -> Bool
hasZero (0:xs) = True 
hasZero (_:xs) = hasZero xs
hasZero _ = False

hasEmpty :: [[a]] -> Bool
hasEmpty ([]:xs) = True 
hasEmpty (_:xs) = hasEmpty xs
hasEmpty _ = False

doubleAll :: [Int] -> [Int]
doubleAll [] = []
doubleAll (x:[]) = (x*2) : []
doubleAll (x:xs) = (x*2) : doubleAll xs

last' :: [a] -> a
last' (x:[]) = x
last' (x:xs) = last' xs

init' :: [a] -> [a]
init' (x:[]) = []
init' (x:xs) = [x] ++ init' xs
