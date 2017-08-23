--Ejercicios Haskell
--Edgar Adrian Garcia Villegas A01021730

import Data.Char

--Todos los valores posibles para x, y, z de los numeros 1 hasta 100
[(x, y, z) | x<-[1..100], y<-[1..100], z<-[1..100], z^2 == x^2 + y^2]

--Cuantos # negativos hay entre  [-1000..1000]
length[x | x<-[-1000 .. 100], x > 0]

--La suma de todos los numeros impares abajo de 10000
sum[x | x <-[1..1000000], mod x 2 == 1]

--Cambiar un texto en minusculas a mayusculas usando list comprehension

map toUpper [x | x <- "abcdefg"]

-- Recursividad
maxlist[] = error "e"
maxlist[e] = e
maxlist(h:t) = max h maxlist t

--Factorial recursivo
factorial[0] = 1
factorial[1] = 1
factorial(x) = x * (factorial(x-1))

--Funcion que obtiene los "n" ultimos elemntos de una lista
lastt a [] = error "e"
lastt a [e] = e

