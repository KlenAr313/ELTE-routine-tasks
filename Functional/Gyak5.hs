module Gyak5 where

duplicateElements :: [a] -> [a]
duplicateElements [] = []
duplicateElements (x:xs) = x : x : duplicateElements xs


everySecond :: [a] -> [a]
everySecond [] = []
everySecond [_] = []
everySecond (x:y:xs) = y : everySecond xs

(+++) :: [a] -> [a] -> [a]
--(+++) [] [] = []
--(+++) xs [] = xs
(+++) [] ys = ys
(+++) (x:xs) ys = x : (xs +++ ys) 

concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs) = x +++ (concat' xs)

take' :: Int -> [a] -> [a]
take' _ [] = []
take' 0 _ = []
take' n (x:xs) 
    | n < 0 = []
--    | n > 0 = x : take' (n-1) xs
    | otherwise = x : take' (n-1) xs

drop' :: Int -> [a] -> [a]
drop' _ [] = []
drop'  0 xs = xs
drop' n (x:xs) = drop' (n-1) xs
 
isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf [] _ = True
isPrefixOf _ [] = False
isPrefixOf (x:xs) (y:ys)
    | x == y = isPrefixOf xs ys
    | otherwise = False

--isPrefixOf (x:xs) (y:ys) = x == y && isPrefixOf xs ys

merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = []
merge (x:xs) (y:ys)
    | x < y = x : merge xs (y:ys)
    | x >= y = y : merge (x:xs) ys

sublist :: Int -> Int -> [a] -> [a]
sublist _ _ [] = []
sublist 0 0 xs = []
sublist a b (x:xs)
    | a > 0 = sublist (a-1) (b-1) xs
    | b > 0 = x : sublist a (b-1) xs
