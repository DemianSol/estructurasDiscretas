{-
creditos: La función recibe un entero y una lista. La lista tiene información de  materias escolares, tanto su nombre como sus respectivos créditos. 
Lo que hace es devolver una lista con las materias que tengan los mismo creditos que el entero que se va como input
Ejemplo:
creditos [Materias "Estructuras Discretas" 10, Materias"Inglés 1" 04, Materias "Introducción a las ciencias de la computación" 12] 12 = ["Introducción a las ciencias de la computación"] 	
-}

data Materias = Materias String Int deriving (Show, Eq)
creditos :: [Materias] -> Int -> [String]
creditos listado n = [materia | Materias materia credito <- listado, credito == n] 

{-
negativos: Recibe una lista de números y devuelve la cantidad de números negativos que contiene.
Ejemplo:
negativos [1,2,3,5,4,8,1] = 0
-}
negativos list = length [x | x <- list, x < 0]

{-
auxNoDivide : recibe dos enteros y calcula su residuo. Si es distinto de 0 devuelve True, si es 0 devuelve False
Ejemplo:
auxNoDivide 4 2 = False
-}
auxNoDivide :: Int -> Int -> Bool
auxNoDivide n ref = if mod n ref /= 0 then True else False
{-
auxEsPrimo: Recibe un entero n. Evalúa si n es mayor a 1 y si al dividirlo entre todos números que se encuentre entre 2 y n-1 el resultado es siempre distinto de 0 . Si cumple ambas condiciones devuelve True, si no False
auxEsPrimo 7 = True 
-}
auxEsPrimo :: Int -> Bool
auxEsPrimo n = n>1 && all (auxNoDivide n) [2 .. n-1]
{-
primos: Recibe una lista de números y devuelve una lista con los números primos que contiene la lista input.
Ejemplo:
primos [1,2,3,4,5,6,7,8,9,10,11] = [2,3,5,7,11]
-}
primos list = [x | x <- list, (auxEsPrimo x) == True]

{-
auxVerifica: Recibe un elemento a, con la única condición de que a sea de un tipo que pueda compararse, y una lista. La función itera sobre la lista comparando a "a"  con cada elemento. Si encuentra que "a" es igual a algún elemento en la lista devuelve True, si no False. 
-}
auxVerifica :: (Eq a) => a -> [a] -> Bool 
auxVerifica n [] = False
auxVerifica n (x:xs) = if n == x then True else auxVerifica n xs
{-
conjuntoLista: Recibe una lista. Usa la función auxVerifica para saber si la cabeza de la lista es igual a alguno de los elementos de su cola. Si no hay ningún elemento igual a la cabeza entonces pega la cabeza en una nueva lista. Si encuentra que si hay un elemento igual a la cabeza entonces la omite y se llama otra vez pero ahora únicamente con la cola.
Ejemplo:
conjuntoLista [1,2,2,3,4,5,3,1,6,7,8]= [1,2,3,4,5,6,7,8]
-}
conjuntoLista :: (Eq a) => [a] -> [a]
conjuntoLista [] = []
conjuntoLista (x:xs) = if (auxVerifica x (xs)) == False then x:(conjuntoLista (xs)) else conjuntoLista (xs)  
