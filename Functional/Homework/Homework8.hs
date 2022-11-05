data Base = A | T | G | C
    deriving (Eq, Show)

isComplement :: [Base] -> [Base] -> Bool
isComplement [] [] = True
isComplement (x:xs) (y:ys)
    | (x, y) == (A, T) || (x, y) == (T, A) || (x, y) == (C, G) || (x, y) == (G, C) = isComplement xs ys
    | otherwise = False

data Transaction = Transfer Int Int | Purchase Int | Receive Int Int String
    deriving (Show)

netGain :: [Transaction] -> Int
netGain [] = 0
netGain ((Transfer x _):xs) = -x + netGain xs
netGain ((Purchase x):xs) = -x + netGain xs
netGain ((Receive x _ _):xs) = x + netGain xs

wasNegative :: [Transaction] -> Bool
wasNegative xs = wasNegativeH xs 0
    where
        wasNegativeH :: [Transaction] -> Int -> Bool
        wasNegativeH [] _ = False
        wasNegativeH ((Transfer x _):xs) m
            | (m - x) < 0 = True
            | otherwise = wasNegativeH xs (m - x)
        wasNegativeH ((Purchase x):xs) m
            | (m - x) < 0 = True
            | otherwise = wasNegativeH xs (m - x)
        wasNegativeH ((Receive x _ _):xs) m
            | (m + x) < 0 = True
            | otherwise = wasNegativeH xs (m + x)

foo1Solution1 = ([[1,2]],([3],"Hello world!"))

foo1Solution2 = ([[],[True,False],[True]],([True, True], "Hello:)"))

foo1 :: ([[a]],([a],String)) -> Int
foo1 ([_],(a:b,"Hello")) = 0
foo1 ([_],(a:b,'H':'e':'l':'l':'o':xs)) = 1
foo1 ([_,_,_],(a:b,'H':'e':'l':'l':'o':_:_:[])) = 2

data Gyumolcs = Alma Int Char | Barack | Cseresznye String

foo2Solution2 = (Cseresznye "piros", "p")

foo2 :: (Gyumolcs, String) -> Int
foo2 (Alma 12 'a', "Piros") = 0
foo2 (Barack, 's':'a':xs) = 1
foo2 (Cseresznye ('p':xs), 'p':[]) = 2
