module Aux (HuffmanTree, auxListaFrecuencias, auxCreaArbol, auxCodificacion, traductor) where

data HuffmanTree a = Vacio | Hoja a | Nodo (HuffmanTree a) (HuffmanTree a) deriving (Eq, Ord, Show)  

{- auxListaFrecuencias: Recibe una cadena de texto y a partir de ella genera una lista de tuplas de todas las letras que aparecen en la cadena de texto con su respectiva frecuencia de aparación. Elimina las repeticiones de la lista con filtra para obtener caracteres únicos y con auxListaFrecuencias asocia a cada carácter único con su frecuencia de aparición en la cadena. La lista se ordena de mayor a menor cantidad de repeticiones de la letra en la cadena completa mediante la función ordena.
Ejemplo:
auxListaFrecuencias "No soy nada. Nunca seré nada. No puedo querer ser nada. Aparte eso, tengo en mí todos los sueños del mundo." = [(' ',20),('e',11),('o',11),('a',8),('s',8),('n',7),('d',7),('r',5),('u',5),('.',4),('N',3),('t',3),('p',2),('l',2),('m',2),('y',1),('c',1),('\233',1),('q',1),('A',1),(',',1),('g',1),('\237',1),('\241',1)]
-}
auxListaFrecuencias :: Eq a => [a] -> [(a, Int)]
auxListaFrecuencias xs = ordenar (generaListaFrecuencias (filtra xs) xs)
  

{- generaListaFrecuencias: Recibe una lista que tiene las letras que conforman una cadena de texto pero sin repeticiones y otra lista que es la cadena original con repeticones. Con ambas genera una lista de tuplas cuyo a representa a la letra y el Int a sus repeticiones en la cadena original. 
Ejemplo:
generaListaFrecuencias "yc\233NqApar,g\237t\241sel mundo." "No soy nada. Nunca seré nada. No puedo querer ser nada. Aparte eso, tengo en mí todos los sueños del mundo." = [('y',1),('c',1),('\233',1),('N',3),('q',1),('A',1),('p',2),('a',8),('r',5),(',',1),('g',1),('\237',1),('t',3),('\241',1),('s',8),('e',11),('l',2),(' ',20),('m',2),('u',5),('n',7),('d',7),
-}
generaListaFrecuencias ::  Eq a => [a] -> [a] -> [(a, Int)]
generaListaFrecuencias [] ys = []
generaListaFrecuencias (x:xs) (y:ys) = (x, (contar x (y:ys))):(generaListaFrecuencias xs (y:ys))


{- contar: Recbe un carácter y una cadena de texto y cuenta las veces que una letra se repite en una cadena de texto.
Ejemplo:
contar 'a' "No soy nada. Nunca seré nada. No puedo querer ser nada. Aparte eso, tengo en mí todos los sueños del mundo." = 8
-}
contar :: Eq a => a -> [a] -> Int
contar n [] = 0  
contar n (x:xs) = if n==x
                then 1+ contar n xs
                else contar n xs


{- filtra: Recibe una cadena de texto y elimina las letras que se repiten en ella, dejando una cadena de carácteres únicos. Para esto usa a auxFiltra: si devuelve True entonces omite la cabeza de la lista y se vuelve a llamar con la cola, en caso contrario mantiene la cabeza y se llama nuevamente con la cola de la lista; esto lo repite hasta recorrer toda la lista.
Ejemplo:
filtra "No soy nada. Nunca seré nada. No puedo querer ser nada. Aparte eso, tengo en mí todos los sueños del mundo." = "yc\233NqApar,g\237t\241sel mundo."
-} 
filtra :: Eq a => [a] -> [a]
filtra [] = [] 
filtra (x:xs) = if (auxFiltra x xs) 
                  then filtra xs
                  else x:(filtra xs)


{- auxFiltra: Recibe un carácter y una cadena de texto. Verifica si una letra se repite a lo largo de la cadena, si se encuetra repetida devuelve FALSE, de lo contrario TRUE.
Ejemplo:
auxFiltra 'N' "No soy nada. Nunca seré nada. No puedo querer ser nada. Aparte eso, tengo en mí todos los sueños del mundo." = True
-}
auxFiltra :: Eq a => a -> [a] -> Bool
auxFiltra n [] = False
auxFiltra n (x:xs) = if n==x
                     then True
                     else auxFiltra n xs  


{- ordenar: Recibe una lista de tuplas que ordena en base al entero de la tupla, de mayor a menor. Para realizar el ordenamiento usa a auxOrdenar.
Ejemplo:
ordenar [('y',1),('c',1),('\233',1),('N',3),('q',1),('A',1),('p',2),('a',8),('r',5),(',',1),('g',1),('\237',1),('t',3),('\241',1),('s',8),('e',11),('l',2),(' ',20),('m',2),('u',5),('n',7),('d',7),('o',11),('.',4)] = [(' ',20),('e',11),('o',11),('a',8),('s',8),('n',7),('d',7),('r',5),('u',5),('.',4),('N',3),('t',3),('p',2),('l',2),('m',2),('y',1),('c',1),('\233',1),('q',1),('A',1),(',',1),('g',1),('\237',1),('\241',1)]
-}
ordenar :: Eq a => [(a, Int)] -> [(a, Int)]
ordenar [] = []
ordenar ((ch, num):xs) = auxOrdenar (ch, num) (ordenar xs)


{- auxOrdenar: Recibe una tupla de a e Int y una lista de tuplas. Inserta a la tupla en su posición correcta dentro de una lista ya ordenada. La inserción se hace de mayor a menor de acuerdo al entero de las tuplas. Si el entero de la tupla es mayor o igual al entero de la cabeza de la lista, entonces coloca a la cabeza de la lista a la tupla, en caso contrario recorre la lista.
Ejemplo:
auxOrdenar ('s',8) [('y',1),('c',1),('\233',1),('N',3),('q',1),('A',1),('p',2),('a',8),('r',5),(',',1),('g',1),('\237',1),('t',3),('\241',1),('e',11),('l',2),(' ',20),('m',2),('u',5),('n',7),('d',7),('o',11),('.',4)] = [('s',8),('y',1),('c',1),('\233',1),('N',3),('q',1),('A',1),('p',2),('a',8),('r',5),(',',1),('g',1),('\237',1),('t',3),('\241',1),('e',11),('l',2),(' ',20),('m',2),('u',5),('n',7),('d',7),('o',11),('.',4)]
-}
auxOrdenar :: Eq a => (a, Int) -> [(a, Int)] -> [(a,Int)]
auxOrdenar (ch, num) [] = [(ch, num)]
auxOrdenar (ch, num) ((ch2, num2):ys) = if num >= num2
                                      then (ch, num):((ch2, num2):ys)
                                      else (ch2, num2):(auxOrdenar (ch, num) ys)

                                           
{- auxCreaArbol: Recibe una lista de tuplas ordenadas de mayor a menor de acuerdo a sus enteros y con ella crea un árbol binario de Huffman en donde todos los subárboles izquierdos son nodos sin elementos, que tienen subárboles izquierdo y derecho, y todos los subárboles derechos son hojas con los carácteres de la lista que se recibe.
Ejemplo:
auxCreaArbol [(' ',20),('e',11),('o',11),('a',8),('s',8),('n',7),('d',7),('r',5),('u',5),('.',4),('N',3),('t',3),('p',2),('l',2),('m',2),('y',1),('c',1),('\233',1),('q',1),('A',1),(',',1),('g',1),('\237',1),('\241',1)] = Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio Vacio) (Hoja '\241')) (Hoja '\237')) (Hoja 'g')) (Hoja ',')) (Hoja 'A')) (Hoja 'q')) (Hoja '\233')) (Hoja 'c')) (Hoja 'y')) (Hoja 'm')) (Hoja 'l')) (Hoja 'p')) (Hoja 't')) (Hoja 'N')) (Hoja '.')) (Hoja 'u')) (Hoja 'r')) (Hoja 'd')) (Hoja 'n')) (Hoja 's')) (Hoja 'a')) (Hoja 'o')) (Hoja 'e')) (Hoja ' ')
-}
auxCreaArbol :: Eq a => [(a, Int)] -> HuffmanTree a
auxCreaArbol [] = (Nodo Vacio Vacio) 
auxCreaArbol ((ch, num):xs)= (Nodo (auxCreaArbol xs) (Hoja ch))


{- auxCodificacion: Une la secuencia de códigos binarios que corresponden a cada carácter de la cadena de texto que recibe dado el árbol de Huffman que corresponde a la cadena original. Para cada letra en la cada llama a generaCodificación para obtener su representación codificada dado el árbol.
Ejemplo:
auxCodificacion (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio Vacio) (Hoja '\241')) (Hoja '\237')) (Hoja 'g')) (Hoja ',')) (Hoja 'A')) (Hoja 'q')) (Hoja '\233')) (Hoja 'c')) (Hoja 'y')) (Hoja 'm')) (Hoja 'l')) (Hoja 'p')) (Hoja 't')) (Hoja 'N')) (Hoja '.')) (Hoja 'u')) (Hoja 'r')) (Hoja 'd')) (Hoja 'n')) (Hoja 's')) (Hoja 'a')) (Hoja 'o')) (Hoja 'e')) (Hoja ' ')) "No soy nada. Nunca seré nada. No puedo querer ser nada. Aparte eso, tengo en mí todos los sueños del mundo." = "0000000000100110000100100000000000000011000001000100000010001000000000110000000000100000000100000100000000000000001000110000101000000010000000000000000011000001000100000010001000000000110000000000100110000000000001000000Aux00101000000100110000000000000000001000000001010000000101000000011000010100000001100000100010000001000100000000011000000000000000000010000000000001000100000001000000000001011010000100100000000000000000000110000000000010100000100000000000000000000010011010000011000000000000001000000000000000000000011000000000001001000000100100001100000000000001001000011000010000000010100000000000000000000000100100001100000010100000000000001100000000000000100000000100000100000010010000000001"
-}
auxCodificacion :: Eq a => HuffmanTree a -> [a]-> [Char]
auxCodificacion Vacio xs = []
auxCodificacion (Nodo izq der) [] = [] 
auxCodificacion (Nodo izq der) (x:xs)= concatena (generaCodificacion (Nodo izq der) x) (auxCodificacion (Nodo izq der) xs)


{- generaCodificación: Crea el código binario del carácter que recibe dado el árbol de Huffman de la cadena de texto orginal. Si el carácter está en el subárbol derecho, devuelve '1', de lo contrario avanza recursivamente sobre el subárbol izquierdo añadiendo '0' en cada llamada recursiva hasta encontrar el carácter en el árbol.
Ejemplo:
generaCodificacion (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio Vacio) (Hoja '\241')) (Hoja '\237')) (Hoja 'g')) (Hoja ',')) (Hoja 'A')) (Hoja 'q')) (Hoja '\233')) (Hoja 'c')) (Hoja 'y')) (Hoja 'm')) (Hoja 'l')) (Hoja 'p')) (Hoja 't')) (Hoja 'N')) (Hoja '.')) (Hoja 'u')) (Hoja 'r')) (Hoja 'd')) (Hoja 'n')) (Hoja 's')) (Hoja 'a')) (Hoja 'o')) (Hoja 'e')) (Hoja ' ')) '.' = "0000000001"
-}
generaCodificacion :: Eq a => HuffmanTree a -> a -> [Char]
generaCodificacion (Nodo izq (Hoja n)) x = if n == x
                                          then ['1']
                                          else '0':(generaCodificacion izq x)
                   
                                           
{- concatena: Recibe dos listas y pega la segunda lista al final de la primera.
Ejemplo:
concatena "0000000000" "111111111111111111" = "0000000000111111111111111111"
-}
concatena :: Eq a => [a] -> [a] -> [a]
concatena [] ys = ys
concatena (x:xs) ys = x:(concatena xs ys)



{- traductor: Recibe el árbol de Huffman de la cadena orignal y la cadena codificada. La función traduce la secuencia de la cadena codificada en carácteres al recorrer el árbol. Si la cabeza de la lista es '0' entonces avanza recursivamente en el árbol izquierdo, si es '1' entonces toma el elemento del subárbol derecho, que es siempre una hoja, lo agrega en la lista y se llama recursivamente con la raíz del árbol. Repite el proceso hasta haber aplicado este proceso para todos los elementos de la cadena binaria que recibe.
traductor (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio Vacio) (Hoja '\241')) (Hoja '\237')) (Hoja 'g')) (Hoja ',')) (Hoja 'A')) (Hoja 'q')) (Hoja '\233')) (Hoja 'c')) (Hoja 'y')) (Hoja 'm')) (Hoja 'l')) (Hoja 'p')) (Hoja 't')) (Hoja 'N')) (Hoja '.')) (Hoja 'u')) (Hoja 'r')) (Hoja 'd')) (Hoja 'n')) (Hoja 's')) (Hoja 'a')) (Hoja 'o')) (Hoja 'e')) (Hoja ' ')) (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio Vacio) (Hoja '\241')) (Hoja '\237')) (Hoja 'g')) (Hoja ',')) (Hoja 'A')) (Hoja 'q')) (Hoja '\233')) (Hoja 'c')) (Hoja 'y')) (Hoja 'm')) (Hoja 'l')) (Hoja 'p')) (Hoja 't')) (Hoja 'N')) (Hoja '.')) (Hoja 'u')) (Hoja 'r')) (Hoja 'd')) (Hoja 'n')) (Hoja 's')) (Hoja 'a')) (Hoja 'o')) (Hoja 'e')) (Hoja ' '))  "000000000010011000010010000000000000001100000100010000001000100000000011000000000010000000010000010000000000000000100011000010100000001000000000000000001100000100010000001000100000000011000000000010011000000000000100000000101000000100110000000000000000001000000001010000000101000000011000010100000001100000100010000001000100000000011000000000000000000010000000000001000100000001000000000001011010000100100000000000000000000110000000000010100000100000000000000000000010011010000011000000000000001000000000000000000000011000000000001001000000100100001100000000000001001000011000010000000010100000000000000000000000100100001100000010100000000000001100000000000000100000000100000100000010010000000001" = "No soy nada. Nunca ser\233 nada. No puedo querer ser nada. Aparte eso, tengo en m\237 todos los sue\241os del mundo."
-}
traductor :: HuffmanTree a -> HuffmanTree a -> String -> [a]
traductor _ _ [] = []
traductor arbol (Nodo izq der) ('0':xs) = traductor arbol izq xs
traductor arbol (Nodo izq (Hoja e)) ('1':xs) = e:(traductor arbol arbol xs)
