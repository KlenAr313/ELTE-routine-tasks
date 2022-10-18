one :: Int
one = 1

two :: Int
two = succ one

inc :: Int -> Int
inc x = x + 1

add :: Int -> Int -> Int
add x y = x + y

foo :: Int -> Int -> Int
foo x y = x

isDivisible :: Int -> Int -> Bool
isDivisible x y = x `mod` y == 0

f = 42

isEven :: Int -> Bool
isEven x = x `mod` 2 == 0

isOdd :: Int -> Bool
-- isOdd x = x `mod` 2 == 1
isOdd x = not (isEven x)