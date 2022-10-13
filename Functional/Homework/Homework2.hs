waterTheFlowers :: Int
waterTheFlowers = round (50 / 4 / 1.8)


isLeapYear :: Int -> Bool
isLeapYear x = (x `mod` 4 == 0) && ((x `mod` 100 /= 0) || (x `mod` 400 == 0))


equivalent :: Bool -> Bool -> Bool
equivalent x y = x == y


implies :: Bool -> Bool -> Bool
implies x y = y || x == y
