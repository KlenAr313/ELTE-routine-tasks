{-
A zok a magasabb rendű függvények, amik paramterként egy függvént várnak, 
és ezt használják az implementációban.
A "map (+1)" nem egy felsőbb rendű függvény, mert csak egy listát vár paraméterül, 
mert a függvény már meg van addva "(+1)".
A szimpla "map" az lenne.
-}

import Data.List hiding (findIndices)
doubleTheEven :: Integral a => [a] -> [a]
doubleTheEven xs = map (*2) $ filter even xs

selectiveApply :: (a -> a) -> (a -> Bool) -> [a] -> [a]
selectiveApply f p [] = []
selectiveApply f p (x:xs)
    | p x = f x : selectiveApply f p xs
    | otherwise = x : selectiveApply f p xs

findIndices :: (a -> Bool) -> [a] -> [Int]
findIndices f xs = map fst $ filter (\ (a,b) -> f b ) $ zip [0..] xs
