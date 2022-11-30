import Prelude hiding (Either(..))

data Box a = B a
    deriving (Eq)

instance Show a => Show (Box a) where
    show (B a) = "A dobozban " ++ show a ++ " van."

data Either a b = Left a | Right b 
    deriving (Show, Eq)

data Stack a = Empty | Cons a (Stack a)
    deriving (Eq)

instance Show a => Show (Stack a) where
    show Empty = "."
    show (Cons x s) = show x ++ ", " ++ show s

push :: a -> Stack a -> Stack a
-- push a Empty = Cons a Empty
push a s = Cons a s

pop :: Stack a -> (a, Stack a)
pop Empty = error "Stack is empty"
pop (Cons a s) = (a, s)