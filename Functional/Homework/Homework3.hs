onAxis :: (Integral a, Integral b) => (a, b) -> Bool
onAxis (_, 0) = True
onAxis (0, _) = True
onAxis (_, _) = False

shift :: (Int, Int) -> Int -> (Int, Int)
shift (a, b) c = ( mod (a + (div (b + c) 60 )) 24, mod (b + c) 60) 

areAmicableNumbers :: Integral a => a -> a -> Bool
areAmicableNumbers a b = sum[n | n <- [1..(div a 2)], (mod a n) == 0] == b && sum[m | m <- [1..(div b 2)], (mod b m) == 0] == a
