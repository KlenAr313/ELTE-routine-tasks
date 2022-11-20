import Data.Char

type Line = String
type File = [Line]

testFile0 :: File 
testFile0 = ["asd  qwe", "-- Foo", "", "\thello world "]

countWordsInLine :: Line -> Int
countWordsInLine l = length $ (words l)

countWords :: File -> Int
countWords l = sum $ map countWordsInLine l

countChars :: File -> Int
countChars l = sum $ map length l

capitalizeWordsInLine :: Line -> Line
capitalizeWordsInLine l = unwords $ map (\ (x:xs) -> toUpper x : xs ) $ words l

isComment :: Line -> Bool
isComment (y:x:xs) = x == '-' && y == '-'
isComment _ = False

dropComments :: File -> File
dropComments = filter (not . isComment)

numberLines :: File -> File
numberLines fl = map step (zip [1..] fl)
    where
        step :: (Int,Line) -> Line
        step (a,b) = (show a)++": "++b

dropTrailingWhitespaces :: Line -> Line
dropTrailingWhitespaces = reverse . dropWhile isSpace . reverse

replaceTab :: Int -> Char -> [Char]
replaceTab n '\t' = replicate n ' '
replaceTab _ c = [c] 

replaceTabInLine :: Int -> Line -> Line
replaceTabInLine n l = concat $ map (replaceTab n) l

replaceTabs :: Int -> File -> File
replaceTabs n ls = map (replaceTabInLine n) ls


