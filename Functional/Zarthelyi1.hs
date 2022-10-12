-- Mert az Int típusban nem használható az '/' jel, és az Int-et nem lehet implicit Double-lé konvertálni

true2 :: Bool -> Bool -> Bool -> Bool
true2 True True False = True
true2 True False True = True
true2 False True True = True
true2 _ _ _ = False

splitQuadruple :: (a,b,c,d) -> ((a,b),(c,d))
splitQuadruple (a,b,c,d) = ((a,b),(c,d))

arithmeticSeq :: Integer -> Integer -> [Integer]
arithmeticSeq x y = [n | n <- [x,(x+y)..]]
