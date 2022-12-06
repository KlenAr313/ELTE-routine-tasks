import Data.List

type Coordinate = (Int, Int)
type Sun = Int

data Plant = Peashooter Int | Sunflower Int | Walnut Int | CherryBomb Int
    deriving (Show, Eq)

data Zombie = Basic Int Int | Conehead Int Int | Buckethead Int Int | Vaulting Int Int
    deriving (Show, Eq)

data GameModel = GameModel Sun [(Coordinate, Plant)] [(Coordinate, Zombie)]
    deriving (Show, Eq)

tryPurchase :: GameModel -> Coordinate -> Plant -> Maybe GameModel
tryPurchase (GameModel sun plants zombies) (x, y) (Peashooter hp)
    | sun < 100 || x > 4 || x < 0 || y > 11 || y < 0 = Nothing
    | lookup (x,y) plants == Nothing = Just (GameModel (sun - 100) (((x,y), (Peashooter hp)):plants) zombies)
    | otherwise = Nothing
tryPurchase (GameModel sun plants zombies) (x, y) (Sunflower hp)
    | sun < 50 || x > 4 || x < 0 || y > 11 || y < 0 = Nothing
    | lookup (x,y) plants == Nothing = Just (GameModel (sun - 50) (((x,y), (Sunflower hp)):plants) zombies)
    | otherwise = Nothing
tryPurchase (GameModel sun plants zombies) (x, y) (Walnut hp)
    | sun < 50 || x > 4 || x < 0 || y > 11 || y < 0 = Nothing
    | lookup (x,y) plants == Nothing = Just (GameModel (sun - 50) (((x,y), (Walnut hp)):plants) zombies)
    | otherwise = Nothing
tryPurchase (GameModel sun plants zombies) (x, y) (CherryBomb hp)
    | sun < 150 || x > 4 || x < 0 || y > 11 || y < 0 = Nothing
    | lookup (x,y) plants == Nothing = Just (GameModel (sun - 150) (((x,y), (CherryBomb hp)):plants) zombies)
    | otherwise = Nothing

placeZombieInLane :: GameModel -> Zombie -> Int -> Maybe GameModel
placeZombieInLane (GameModel sun plants zombies) (Basic hp speed) x
    | x < 0 || x > 4 || lookup (x,11) zombies /= Nothing = Nothing
    | otherwise = Just(GameModel sun plants (((x,11), (Basic hp speed)):zombies))
placeZombieInLane (GameModel sun plants zombies) (Conehead hp speed) x
    | x < 0 || x > 4 || lookup (x,11) zombies /= Nothing = Nothing
    | otherwise = Just(GameModel sun plants (((x,11), (Conehead hp speed)):zombies))
placeZombieInLane (GameModel sun plants zombies) (Buckethead hp speed) x
    | x < 0 || x > 4 || lookup (x,11) zombies /= Nothing = Nothing
    | otherwise = Just(GameModel sun plants (((x,11), (Buckethead hp speed)):zombies))
placeZombieInLane (GameModel sun plants zombies) (Vaulting hp speed) x
    | x < 0 || x > 4 || lookup (x,11) zombies /= Nothing = Nothing
    | otherwise = Just(GameModel sun plants (((x,11), (Vaulting hp speed)):zombies))

decreasePlantHp :: [(Coordinate, Plant)] -> Coordinate -> [(Coordinate, Plant)]
decreasePlantHp [] _ = []
decreasePlantHp (((a,b),(Peashooter hp)):plants) (x,y)
    | a == x && b == y = ((a,b), (Peashooter (hp-1))):(decreasePlantHp plants (x,y))
    | otherwise = ((a,b), (Peashooter hp)) : (decreasePlantHp plants (x,y)) 
decreasePlantHp (((a,b),(Sunflower hp)):plants) (x,y)
    | a == x && b == y = ((a,b), (Sunflower (hp-1))):(decreasePlantHp plants (x,y))
    | otherwise = ((a,b), (Sunflower hp)) : (decreasePlantHp plants (x,y))
decreasePlantHp (((a,b),(Walnut hp)):plants) (x,y)
    | a == x && b == y = ((a,b), (Walnut (hp-1))):(decreasePlantHp plants (x,y))
    | otherwise = ((a,b), (Walnut hp)) : (decreasePlantHp plants (x,y))
decreasePlantHp (((a,b),(CherryBomb hp)):plants) (x,y)
    | a == x && b == y = ((a,b), (CherryBomb (hp-1))):(decreasePlantHp plants (x,y))
    | otherwise = ((a,b), (CherryBomb hp)) : (decreasePlantHp plants (x,y)) 


performZombieActions :: GameModel -> Maybe GameModel
performZombieActions gameModel = performH gameModel []
    where 
        performH :: GameModel -> [(Coordinate, Zombie)] -> Maybe GameModel
        performH (GameModel sun plants []) already = Just (GameModel sun plants already)
        performH (GameModel sun plants (((x,y),Basic hp speed):zombies)) already
            | lookup (x,y) plants /= Nothing = performH (GameModel sun (decreasePlantHp plants (x,y)) zombies) (already ++ [((x,y),(Basic hp speed))])
            | y-speed < 0 = Nothing
            | lookup (x,y) plants == Nothing = performH (GameModel sun plants zombies) (already ++ [((x,y-speed),(Basic hp speed))])

        performH (GameModel sun plants (((x,y),Conehead hp speed):zombies)) already
            | lookup (x,y) plants /= Nothing = performH (GameModel sun (decreasePlantHp plants (x,y)) zombies) (already ++ [((x,y),(Conehead hp speed))])
            | y-speed < 0 = Nothing
            | lookup (x,y) plants == Nothing = performH (GameModel sun plants zombies) (already ++ [((x,y-speed),(Conehead hp speed))])

        performH (GameModel sun plants (((x,y),Buckethead hp speed):zombies)) already
            | lookup (x,y) plants /= Nothing = performH (GameModel sun (decreasePlantHp plants (x,y)) zombies) (already ++ [((x,y),(Buckethead hp speed))])
            | y-speed < 0 = Nothing
            | lookup (x,y) plants == Nothing = performH (GameModel sun plants zombies) (already ++ [((x,y-speed),(Buckethead hp speed))])

        performH (GameModel sun plants (((x,y),Vaulting hp speed):zombies)) already
            | speed == 2 && (lookup (x,y) plants == Nothing && lookup (x,y-1) plants /= Nothing) = performH (GameModel sun plants zombies) (already ++ [((x,y-speed),(Vaulting hp (speed-1) ))])
            | speed == 2 && lookup (x,y) plants /= Nothing = performH (GameModel sun plants zombies) (already ++ [((x,y-(speed-1)),(Vaulting hp (speed-1) ))])
            | speed == 1 && lookup (x,y) plants /= Nothing = performH (GameModel sun (decreasePlantHp plants (x,y)) zombies) (already ++ [((x,y),(Vaulting hp speed))])
            | y-speed < 0 = Nothing
            | speed == 2 && lookup (x,y) plants == Nothing && lookup (x,y-1) plants == Nothing = performH (GameModel sun plants zombies) (already ++ [((x,y-speed),(Vaulting hp speed))])
            | speed == 1 && lookup (x,y) plants == Nothing = performH (GameModel sun plants zombies) (already ++ [((x,y-speed),(Vaulting hp speed))])


cleanBoard :: GameModel -> GameModel
cleanBoard (GameModel sun plants zombies) = (GameModel sun (filter plantFilter plants) (filter zombieFilter zombies))
    where
        plantFilter :: (Coordinate,Plant) -> Bool
        plantFilter (_,Peashooter hp) = hp > 0
        plantFilter (_,Sunflower hp) = hp > 0
        plantFilter (_,Walnut hp) = hp > 0
        plantFilter (_,CherryBomb hp) = hp > 0
        zombieFilter :: (Coordinate,Zombie) -> Bool
        zombieFilter (_,Basic hp _) = hp > 0
        zombieFilter (_,Conehead hp _) = hp > 0
        zombieFilter (_,Buckethead hp _) = hp > 0
        zombieFilter (_,Vaulting hp _) = hp > 0


              
defaultPeashooter :: Plant
defaultPeashooter = Peashooter 3

defaultSunflower :: Plant
defaultSunflower = Sunflower 2

defaultWalnut :: Plant
defaultWalnut = Walnut 15

defaultCherryBomb :: Plant
defaultCherryBomb = CherryBomb 2

basic :: Zombie
basic = Basic 5 1

coneHead :: Zombie
coneHead = Conehead 10 1

bucketHead :: Zombie
bucketHead = Buckethead 20 1

vaulting :: Zombie
vaulting = Vaulting 7 2
