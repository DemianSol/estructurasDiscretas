module Practica6 where
import Aux 

{- nVacios: Recibe un árbol y, mediante la funció auxiliar auxVacios, devuelve un entero que representa el número de nodos vacíos que contiene dicho árbol. Como el arbol vacío no tiene nodos, entonces tiene 0 nodos vacíos. Si el árbol recibido no es vacío, entonces se pasa como argumento de la función auxiliar.
Ejemplo:
nVacios (AB 1 (AB 2 (AB 4 Vacio Vacio) (AB 5 Vacio Vacio)) (AB 3 (AB 6 Vacio Vacio) (AB 7 Vacio Vacio)) ) = 8
-}
nVacios :: Arbol a -> Int
nVacios Vacio = 0
nVacios (AB n izq der)  = auxVacios izq + auxVacios der

{- refleja: Recibe un árbol y devuele un árbol que es su imagen invertida de forma perpendicular. 
Ejemplo:
refleja (AB 1 (AB 2 (AB 4 Vacio Vacio) (AB 5 Vacio Vacio)) (AB 3 (AB 6 Vacio Vacio) (AB 7 Vacio Vacio)) ) = AB 1 (AB 3 (AB 7 Vacio Vacio) (AB 6 Vacio Vacio)) (AB 2 (AB 5 Vacio Vacio) (AB 4 Vacio Vacio))
-}
refleja :: Arbol a -> Arbol a
refleja Vacio = Vacio
refleja (AB n Vacio Vacio) = (AB n Vacio Vacio)
refleja (AB n izq der) = (AB n (refleja der) (refleja izq) )

{- minimo: Devuelve el elemento mínimo del árbol. Como el arbol vacío no tiene elementos, entonces se devuelve un error.
Ejemplo:
minimo  (AB 9 Vacio (AB 3 (AB 6 Vacio Vacio) (AB 7 Vacio Vacio))) = 3
-}
minimo :: (Ord a) => Arbol a -> a
minimo Vacio = error "El árbol vacío no tiene elemento mínimo"
minimo (AB n Vacio Vacio) = n
minimo (AB n izq Vacio) = compara n (minimo izq)
minimo (AB n Vacio der) = compara n (minimo der)
minimo (AB n izq der) = compara n (compara (minimo izq) (minimo der) )

{- recorrido: Devuelve una lista de los elementos del árbol. La lista está ordenada de acuerdo al recorrido Inorden del árbol
Ejemplo:
recorrido (AB 9 Vacio (AB 3 (AB 6 Vacio Vacio) (AB 7 Vacio Vacio))) = [9,3,6,7]
-}
recorrido :: Arbol a -> [a]
recorrido Vacio = []
recorrido (AB n Vacio Vacio) = [n]
recorrido (AB n izq der) = concatena [n] (concatena (recorrido izq) (recorrido der))

{- esBalanceado: Determina si el árbol es balanceado o no. 
Ejemplo:
esBalanceado (AB 1 (AB 2 (AB 4 Vacio (AB 7 Vacio Vacio)) (AB 5 Vacio Vacio)) (AB 3 Vacio (AB 6 (AB 8 Vacio Vacio) Vacio)) ) = False
-}
esBalanceado :: Arbol a -> Bool
esBalanceado Vacio = True
esBalanceado (AB n izq der) = if abs (altura izq - altura der) > 1 then False else esBalanceado izq && esBalanceado der

{- listaArbol: Transforma la lista que recibe en un árbol binario de búsqueda.
Ejemplo:
listaArbol [1,2,4,5,8,7,1,9,6] = AB 1 (AB 1 Vacio Vacio) (AB 2 Vacio (AB 4 Vacio (AB 5 Vacio (AB 8 (AB 7 (AB 6 Vacio Vacio) Vacio) (AB 9 Vacio Vacio))))) 
-}
listaArbol :: (Ord a) => [a] -> Arbol a
listaArbol [] = Vacio 
listaArbol (x:xs) = (AB x (listaArbol (listaMenores x xs)) (listaArbol (listaMayores x xs)) )


