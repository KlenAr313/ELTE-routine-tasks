map' :: ( a -> b ) -> [a] -> [b]
map' f [] = []
map' f (x:xs) = f x : map' f xs

sqrEvery :: Num a => [a] -> [a]
sqeEvery xs = map' (^2) xs

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

-- maP :: ( a -> b ) -> [a] -> [b]
-- maP f ls = foldR

reverse'' :: [a] -> [a]
reverse'' ls = foldR (\x acc -> acc ++ [x]) [] ls
