-- Mintát konstruktorra lehet illeszteni

safeHead :: [a] -> Maybe a
safeHead (x:_) = Just x
safeHead [] = Nothing

data CardinalPoint = East | West | Noth | South
    deriving (Show)

data Colour = RGB Int Int Int -- | Black | White
    deriving ()

instance Show Colour where
    show (RGB r g b) = "R = " ++ show r ++ " \nG = " ++ show g ++ " \nB = " ++ show b

instance Eq Colour where
    (==) (RGB r1 g1 b1) (RGB r2 g2 b2) = r1 == r2 && g1 == g2 && b1 == b2

isGreen :: Colour -> Bool
--isGreen (RGB r g b) = r == 0 && g == 255 && b == 0
isGreen (RGB 0 255 0) = True
isGreen _ = False

isGray :: Colour -> Bool
isGray (RGB 0 0 0) = False
isGray (RGB 255 255 255) = False
isGray (RGB r g b) = r == g && g == b

data SignedInt =  Positive Integer | Negative Integer | Zero 
    deriving (Show, Eq)

toSignedInt :: Integer -> SignedInt
toSignedInt x
    | x > 0 = Positive x
    | x < 0 = Negative x
    | otherwise = Zero

fromSignedInt :: SignedInt -> Integer
fromSignedInt (Positive x) = x
fromSignedInt (Negative x) = x
fromSignedInt Zero = 0

addPositive :: [SignedInt] -> SignedInt
addPositive xs = toSignedInt (sum [ x | (Positive x) <- xs])
 
safeDiv :: Double -> Double -> Maybe Double
safeDiv _ 0 = Nothing
safeDiv a b = Just (a / b)

safeIndex :: [a] -> Int -> Maybe a
safeIndex [] _ = Nothing
safeIndex (x:_) 0 = Just x
safeIndex (x:xs) n
    | n < 0 = Nothing
    | otherwise = safeIndex xs (n - 1)

safeIndex' xs n = head [x | (i, x) <- zip [1..] xs , n == i]
