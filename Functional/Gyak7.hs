import Data.Char

newtype IPoint = P (Int, Int) deriving (Eq, Ord, Show)

data DPoint = D Int Int 
    deriving (Eq, Ord, Show)

mirror0 :: IPoint -> IPoint
mirror0 (P (a, b)) = P ((-1*a), (-1*b))

mirror0' :: DPoint -> DPoint
mirror0' (D a b) = D (-1*a) (-1*b)

translate :: (Int, Int) -> IPoint -> IPoint
translate (a, b) (P (c, d)) = P ((c+d), (b+d))

newtype Name = N String deriving (Eq)
type SN = String

upper :: String -> String
upper str =filter (<='Z') (filter (>='A') (map toUpper str))
