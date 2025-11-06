module Aux where

data HuffmanTree a = Vacio | Hoja Char | Nodo (HuffmanTree a) (HuffmanTree a) deriving (Eq, Ord, Show)  

-- Función que genera una lista de la frecuencias de aparición de todas las letras de la cadena de texto. Una a una, asocia en una tupla a cada letra con su respectiva frecuencia de aparición y las reúne en una única lista. 
auxListaFrecuencias :: [Char] -> [Char] -> [(Char, Int)]
auxListaFrecuencias [] [] = [] 
auxListaFrecuencias [] ys = []
auxListaFrecuencias xs [] = []
auxListaFrecuencias (x:xs) (y:ys) = (auxLista x (y:ys)):(auxListaFrecuencias xs (y:ys))


-- Función auxiliar que cuenta la cantidad de veces que aparece una letra en una cadena de texto y guarda el resultado en una tupla. Así, se asocia la letra con su frecuencia de aparición en la cadena de texto. 
auxLista :: Char -> [Char] -> (Char, Int)
auxLista n [] = error "no se recibió lista alguna" 
auxLista n xs = (n, contar n xs)

-- Función auxiliar que cuenta las veces que una letra se repite en una cadena de texto. CHECK 
contar :: Char -> [Char] -> Int
contar n [] = 0  
contar n (x:xs) = if n==x
                then 1+ contar n xs
                else contar n xs

-- Elimina las repeticiones de una cadena de texto, dejando carácteres únicos. CHECK 
filtra :: [Char] -> [Char]
filtra [] = [] 
filtra (x:xs) = if (auxFiltra x xs) 
                  then filtra xs
                  else x:(filtra xs)

-- Función auxiliar que verifica si una letra se repite a lo largo de la cadena, si se encuetra repetida devuelve FALSE, de lo contrario TRUE. 
auxFiltra :: Char -> [Char] -> Bool
auxFiltra n [] = False
auxFiltra n (x:xs) = if n==x
                     then True
                     else auxFiltra n xs  


-- Ordena una lista de tuplas en base al entero de la tupla, de mayor a menor. CHECK
ordenar :: [(Char, Int)] -> [(Char, Int)]
ordenar [] = []
ordenar ((ch, num):xs) = auxOrdenar (ch, num) (ordenar xs)

--Función auxiliar que inserta una tupla en su posición correcta dentro de una lista ya ordenada. La inserción se hace de mayor a menor de acuerdo al entero de las tuplas.  
auxOrdenar :: (Char, Int) -> [(Char, Int)] -> [(Char,Int)]
auxOrdenar (ch, num) [] = [(ch, num)]
auxOrdenar (ch, num) ((ch2, num2):ys) = if num >= num2
                                      then (ch, num):((ch2, num2):ys)
                                      else (ch2, num2):(auxOrdenar (ch, num) ys)
                                      
-- Función auxiliar que crea un árbol con todos los subárboles izquierdos como nodos sin elementos y los subárboles derechos hojas cuyos elementos son los de la lista que se recibe. 
auxcreaArbol :: [(Char, Int)] -> HuffmanTree Char
auxcreaArbol [] = (Nodo Vacio Vacio) 
auxcreaArbol ((ch, num):xs)= (Nodo (auxcreaArbol xs) (Hoja ch))

-- Une la secuencia de códigos binarios que corresponden a cada carácter de la cadena de texto que recibe dado el árbol de Huffman que corresponde a la cadena. 
auxCodificacion :: HuffmanTree Char -> [Char]-> [Char]
auxCodificacion Vacio xs = []
auxCodificacion (Nodo izq der) [] = [] 
auxCodificacion (Nodo izq der) (x:xs)= concatena (generaCodificacion (Nodo izq der) x) (auxCodificacion (Nodo izq der) xs)

-- Crea el código binario del carácter que recibe dado el árbol de Huffman de la cadena de texto .
generaCodificacion :: HuffmanTree Char -> Char -> [Char]
generaCodificacion (Nodo izq der) x = if verifica der x
                                      then ['1']
                                      else '0':(generaCodificacion izq x)
-- Recibe dos listas y pega la segunda lista al final de la primera.
concatena :: [a] -> [a] -> [a]
concatena [] ys = ys
concatena (x:xs) ys = x:(concatena xs ys)

-- Compara el elemento de la hoja que recibe con un caracter dado. Si son iguales devuelve True; Falso en otro caso. 
verifica :: HuffmanTree Char -> Char -> Bool
verifica Vacio n = False
verifica (Hoja x) n = if n==x
                      then True
                      else False
