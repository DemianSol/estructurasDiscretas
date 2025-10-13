module Aux where

data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

{- auxVacios: Recibe un árbol y devuelve un entero que representa el número de nodos vacíos que contiene dicho árbol.
auxVacios (AB 1 (AB 2 (AB 4 Vacio Vacio) (AB 5 Vacio Vacio)) (AB 3 (AB 6 Vacio Vacio) (AB 7 Vacio Vacio)) ) = 8
-}
auxVacios :: Arbol a -> Int
auxVacios Vacio = 1
auxVacios (AB n izq der) = auxVacios izq + auxVacios der

{- compara: Recibe dos elementos comparables y devuelve el menor de ellos.
compara 2 3 = 2
-}
compara :: (Ord a) => a -> a -> a
compara a1 a2 = if a1 <= a2 then a1 else a2 

{- concatena: Recibe dos listas y pega la segunda lista al final de la primera.
concatena [2,5,6,7] [5,8,9,1,0] = [2,5,6,7,5,8,9,1,0]
-}
concatena :: [a] -> [a] -> [a]
concatena [] ys = ys
concatena (x:xs) ys = x:(concatena xs ys)

{-altura: Calcula la altura del árbol que recibe.
altura (AB 9 Vacio (AB 3 (AB 6 Vacio Vacio) (AB 7 Vacio Vacio))) = 3
-}
altura :: Arbol a -> Int
altura Vacio = 0
altura (AB n Vacio Vacio) = 1
altura (AB n izq der) = 1 + max (altura izq) (altura der)

{- listaMenores: Recibe una lista y un elemento y filtra la lista que recibe para devolver únicamente los valores, en una lista, que son menores o iguales al elemento .
listaMenores 5 [4,5,8,9,1,0] = [4,5,1,0]
-}
listaMenores :: (Ord a) => a -> [a] -> [a]
listaMenores n [] = [] 
listaMenores n (x:xs) = if x<= n then x:(listaMenores n xs) else listaMenores n xs

{- listaMayores: Recibe una lista y un elemento y filtra la lista que recibe para devolver únicamente los valores, en una lista, que mayores al elemento .
listaMayores 5 [4,5,8,9,1,0] = [8,9]
-}
listaMayores :: (Ord a) => a -> [a] -> [a]
listaMayores n [] = [] 
listaMayores n (x:xs) = if x>n then x:(listaMayores n xs) else listaMayores n xs

