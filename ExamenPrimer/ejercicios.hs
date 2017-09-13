import Data.List

--Ejercico1
--2520 es el entero positivo más pequeño que puede ser dividido por cualquier de los números entre 1 y 10 sin que exista un residuo.
--Encuentra el entero positivo más pequeño que puede ser dividido por cualquiera de los números entre 1 y 20 sin que exista residuo (residuo cero)


dividido = foldr1 lcm[1..20]


--Ejercico2
--Dada una secuencia de números primos, siendo el primer primo el número 2,
--el tercer primo el 3 y así sucesivamente,  cuál es el número primo 10,001 de la secuencia?

primo n = null [ x | x <- [2..n-1], n `mod` x  == 0]
res = (filter primo [2..])!!10001

--Ejercico3
--Un número palíndromo es aquel que se lee igual de izquierda a derecha que de derecha a izquierda.
--El palíndromo más grande formado por el producto de dos enteros de dos dígitos es el número 9009 (formado a partir del producto de 91x99).
--Cuál es el palíndromo más grande formado a partir del producto de dos números de 3 dígitos?

isPalindrome = maximum[a*b | a<-[100..999], b<-[100..999], reverse(a*b) == show(a*b)]


--Ejercicio4
--Realiza una función que reciba un árbol y que imprima los valores del árbol en INORDER

data Tree x = Empty | Node x (Tree x ) (Tree x) deriving (Show)

treeToList Empty = []
treeToList (Node n lf rt) = treeToList lf ++ [n] ++ treeToList rt
