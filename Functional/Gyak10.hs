module Gyak10 where
import Data.List

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f [] _ = []
zipWith' f _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

index :: [a] -> [(Int, a)]
-- index xs = zip [0..] xs
index xs = zipWith' (\x y -> (x,y)) [0..] xs

pairAdd :: Num a => [a] -> [a] -> [a]
pairAdd xs ys = zipWith' (\x y -> x + y) xs ys

applyAllThree :: (a -> a) -> (a -> a) -> (a -> a) -> a -> a
applyAllThree f g h x = f $ g $ h $ x

applyThreeTimes :: Num a => (a -> a) -> a -> a
-- applyThreeTimes f x = f $ f $ f $ x
applyThreeTimes f x = (f . f . f) x
-- applyThreeTimes f = f . f . f

groupBy' :: (a -> a -> Bool) -> [a] ->[[a]]
groupBy' p [] = []
groupBy' p (x:xs) = (x : takeWhile (p x) xs ): groupBy' p (dropWhile (p x) xs)

differences :: Num a => [a] -> [a]
differences [] = []
differences [_] = []
differences (x:xs) = map (\(a,b) -> b - a) (zip (x:xs) xs)
-- differences ys = zipWith (\x y -> y - x) ys (tail ys)

compress :: Eq a => [a] -> [(Int,a)]
compress [] = []
compress xs = map (\ x -> (length x, head x)) (group xs)

pascalTriangle :: [[Integer]]
-- pascalTriangle = [1] : pIter [1]
--     where
--         pIter xs = xs : (pIter (1: zipWith' (+) xs (tail xs) ++ [1]))
pascalTriangle = iterate (\xs -> 1 : zipWith (+) xs (tail xs) ++ [1]) [1]

concatMap' :: (a -> [b]) -> [a] -> [b]
concatMap' f xs = concat $ map f xs

indexFilter :: Integral i => (i -> a -> Bool) -> [a] -> [a]
indexFilter f xs = map (\ (i,a) -> a) $ filter (\ (i,a) -> f i a) ( zip [0..] xs)

dipsOn :: Ord a => (a -> b) -> [a] -> [a]
dipsOn f xs = map head $ gruopBy (\ x y -> f x <= f y) xs




-- zipIf :: Eq b => (a->b) -> (c -> d) -> [a] -> [c] -> [(a,c)]



