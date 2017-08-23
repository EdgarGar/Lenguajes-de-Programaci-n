--Reversa de una lista
reverse listRev = rev lisRev []
        where rev x (x:xs) b
                | xs == [rev] ++ b
                | otherwise = rev(xs)([x] ++ b)  


--Fucnion que recibe un lista y debuelve una tupla con el valor maximo y mínimo
-- En duda
--otherwise -> si no es el caso base se pasa al siguiente
maxmin x = mm x (tailx) (headx) (headx)
        where mm x maxx minn
                | x == [] = (max, min)
                | (headx) > max = mm(tail x)(headx) minn
                | (headx) < min = mm (tail x) maxx (headx)
                | otherwise = mm (tail x) max min