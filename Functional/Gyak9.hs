import Prelude hiding (map, filter, takeWhile, dropWhile)

add3 :: (Int -> (Int -> (Int -> Int)))
add3 a b c = a + b + c

--apply :: (a -> a) -> a -> a
apply :: (a -> b) -> a -> b
apply f x = f x

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = (f x) : map f xs 

filter :: (a -> Bool) -> [a] -> [a]
filter f xs = [x | x <- xs, f x]
-- filter _ [] = []
-- filter f (x:xs)
--     | (f x) = x : filter f xs
--     | otherwise = filter f xs

count :: (a -> Bool) -> [a] -> Int
count _ [] = 0
count f (x:xs)
    | f x = 1 + count f xs
    | otherwise = 0 + count f xs

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile f (x:xs)
    | f x = x : takeWhile f xs
    | otherwise = []

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile _ [] = []
dropWhile f (x:xs)
    | f x = dropWhile f xs
    | otherwise = x:xs
