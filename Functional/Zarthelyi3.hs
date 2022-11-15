data Vehicle = Car String Int | Boat String Bool | Bicycle

vehicle2 = [Bicycle,(Car ['a'] 1),(Boat [] False),(Boat "" True)]

f :: [Vehicle] -> Int
f (_:_:Boat _ True:_)           = 0
f (_:_:Boat [] _:[])            = 1
f (_:Car [_] _:Boat [] _:[xs])  = 2
f (_:Car _ _:Boat _ _:xs)       = 3

data Weather = Sunny | Cloudy | Rainy Int | Snowy Int
    deriving (Eq, Show)

niceDayForHiking :: Weather -> Bool
niceDayForHiking Sunny = True
niceDayForHiking Cloudy = True
niceDayForHiking _ = False

weatherForecastInaccuracy :: [Weather] -> [Weather] -> Int
weatherForecastInaccuracy [] _ = 0
weatherForecastInaccuracy _ [] = 0
weatherForecastInaccuracy (Sunny:xs) (Sunny:ys) = 0 + weatherForecastInaccuracy xs ys
weatherForecastInaccuracy (Cloudy:xs) (Cloudy:ys) = 0 + weatherForecastInaccuracy xs ys
weatherForecastInaccuracy (Rainy _:xs) (Rainy _:ys) = 0 + weatherForecastInaccuracy xs ys
weatherForecastInaccuracy (Snowy _:xs) (Snowy _:ys) = 0 + weatherForecastInaccuracy xs ys
weatherForecastInaccuracy (_:xs) (_:ys) = 1 + weatherForecastInaccuracy xs ys


