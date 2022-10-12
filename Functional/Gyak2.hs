id' :: a -> a
id' x = x

firstParam :: a -> b -> a
firstParam x y = x

f :: Num a => a -> a
f x = x + x

isZero :: Int -> Bool
isZero 0 = True
isZero x = False

oneDigetPrime :: Int -> Bool
oneDigetPrime 2 = True
oneDigetPrime 3 = True
oneDigetPrime 5 = True
oneDigetPrime 7 = True
oneDigetPrime _ = False

not' :: Bool -> Bool
not' True = True
not' False = False

or' :: Bool -> Bool -> Bool
or' True _ = True 
or' _ True = True 
or' _ _ = False

isEvenTuple :: Int -> (Int, Bool)
isEvenTuple n = (n, n `mod` 2 == 0)

isOrigo :: (Int, Int) -> Bool
isOrigo (0,0) = True
isOrigo (_,_) = False