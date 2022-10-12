fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact(n-1)

sumN :: Int -> Int
sumN 1 = 1
sumN x = x + sumN(x-1)

null' :: [a] -> Bool
null' [] = True
null' _ = False

head' :: [a] -> a
head' (x:xs) = x 

isSingleton :: [a] -> Bool
--isSingleton [_] = True
--isSingleton _ = False
isSingleton (x:[]) = True
isSingleton _ = False

headZero :: (Num a, Eq a) => [a] -> Bool
headZero (x:xs) = x == 0

tail' :: [a] -> [a]
tail' (x:xs) = xs

length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length (xs)

sum' :: Num a => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' (xs)

last' :: [a] -> a
last' (x:[]) = x
last' (x:xs) = last' xs 

init' :: [a] -> [a]
init' (x:[]) = []
init' (x:xs) = [x] ++ init' xs


