type Title = String
type Author = String
type Book = (Int, Author, Title, Integer , Bool)

bookTitle :: Book -> Title
bookTitle (_,_,t,_,_) = t

type PredicateOn a = (a -> Bool)
type Tuple a b = (a,b)

first :: Tuple a b -> a
first (x,y) = x

data Week = Mon | Tue | Wed | Thu | Fri | Sat | Sun
    --deriving (Show, Eq)

instance Show Week where
    show Mon = "Hétfő"
    show Tue = "Kedd"
    show Wed = "Szerda"
    show Thu = "Csütörtök"
    show Fri = "Péntek"
    show Sat = "Szombat"
    show Sun = "Vasárnap"

data IntPair = IP Int Int
    deriving (Show, Eq)

data Pair a b = P
    {x :: a,
     y :: b}    
    deriving (Eq, Show)

fst' :: Pair a b -> a
fst' (P x y) = x

-- data Maybe a = Nothing | Just a

ft :: Show a => Maybe a -> String
ft (Nothing) = "Semmi"
ft (Jusr a) = show x

-- head ((:) x xs) 

data Union a b = I a | J b
    deriving (Show)

