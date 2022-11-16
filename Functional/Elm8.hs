import Data.List (foldl)

map' :: ( a -> b ) -> [a] -> [b]
map' f [] = []
map' f (x:xs) = f x : map' f xs

sqrEvery :: Num a => [a] -> [a]
sqrEvery xs = map' (^2) xs

-- [1,2,3,0] "abcde" -> "a" : "ab" : "abc" : "" : []
prefixes :: [Int] -> [a] -> [[a]]
-- prefixes [] _ = []
-- prefixes (i:is) ls = take i ls : prefixes is ls
-- prefixes is ls = map (take' ls) is 
--     where
--         take' ls i = take i ls
-- prefixes is ls = map (`take` ls) is
-- prefixes is ls = map (\i -> take i ls) is
prefixes is ls = map (flip take ls) is
-- (\x -> x +1) -- (+1)

flip' :: (a -> b -> c) -> b -> a -> c
flip' f b a =  f a b

-- fügvényre nem lehet mintát illeszteni, ha függvény nevet használunk változónak, akkor leárnyékoljuk, és változó névként fog viselkedni

-- func $ e = func e
-- ($) func e = func e

sum' :: Num a => [a] -> a 
-- sum' [] = 0
-- sum' (x:xs) = x + sum' xs
sum' = foldR (+) 0
-- (sum') [1..10] -> (foldR (+) 0) [1..10] 

product' :: Num a => [a] -> a
-- product' [] = 1
-- product' (x:xs) = x * product' xs
product' = foldR (*) 1

foldR :: ( a -> b -> b ) -> b -> [a] -> b
foldR _ e [] = e
foldR  f e (x:xs) = x `f` foldR f e xs

length' :: [a] -> Int
-- length' [] = 0
-- length' (_:xs) = 1 + length' xs
length' ls = foldR (\_ acc -> 1 + acc ) 0 ls

maP :: ( a -> b ) -> [a] -> [b]
-- maP f ls = foldR (\ x acc -> f x : acc) [] ls
maP f ls = foldr step [] ls -- a paramétereket látja a lokális definíció, ha ott nem árnyékolja le
    where
        -- pl.: i = length ls
        step x acc = f x : acc

reverse'' :: [a] -> [a]
reverse'' ls = foldR (\x acc -> acc ++ [x]) [] ls

filter' :: (a -> Bool) -> [a] -> [a]
-- filter' p [] = []
-- filter' p (x:xs)
--     | p x = x : filter' p xs
--     | otherwise = filter' p xs
filter' p ls = foldr step [] ls
    where
        step x acc
            | p x = x : acc
            | otherwise = acc

lengtH :: [a] -> Int
lengtH ls = len 0 ls
    where
        len i [] = i
        len i (_:xs) = len (i+1) xs

lengtH' :: [a] -> Int
lengtH' ls = foldl (\ acc _ -> acc + 1 ) 0 ls

foldL :: (b -> a -> b) -> b -> [a] -> b
foldL f e [] = e
foldL f e (x:xs) = foldL f (e `f` x) xs

and' :: [Bool] -> Bool
-- and' [] = True
-- and' (x:xs) = x && and' xs
and' ls = foldr (&&) True ls


and'' :: [Bool] -> Bool
-- and'' ls = andH True ls
--     where
--         andH b [] = b
--         andH b (x:xs) = andH (b && x) xs

and'' ls = foldl (&&) True ls

(+:+) :: [a] -> [a] -> [a]
(+:+) [] k = k
(+:+) l [] = l
(+:+) (x:xs) k = x : (xs +:+ k)
