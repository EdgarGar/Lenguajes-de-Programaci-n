data Tree x = EmptyTree | Node x (Tree x) (Tree x) deriving (Show)


insert x EmptyTree = Node x EmptyTree EmptyTree
insert x (Node z left rigth)
    | x == z = Node left rigth
    | x < z = Node z (insert x left) rigth
    | x > z  = Node z left (insert)

insertl (x:xs) l
    | length xs == 0 = insert x l
    | otherwise = insertl xs (insert x l)
