import Aux 


{- listaFrecuencias: Recibe una cadena de texto y a partir de ella genera una lista de tuplas de todas las letras que aparecen en la cadena de texto con su respectiva frecuencia de aparación ordenada  de mayor a menor cantidad de repeticiones.
Ejemplo:
listaFrecuencias "No soy nada. Nunca seré nada. No puedo querer ser nada. Aparte eso, tengo en mí todos los sueños del mundo." = [(' ',20),('e',11),('o',11),('a',8),('s',8),('n',7),('d',7),('r',5),('u',5),('.',4),('N',3),('t',3),('p',2),('l',2),('m',2),('y',1),('c',1),('\233',1),('q',1),('A',1),(',',1),('g',1),('\237',1),('\241',1)]
-}
listaFrecuencias :: Eq a => [a] -> [(a, Int)]
listaFrecuencias [] = [] 
listaFrecuencias xs = auxListaFrecuencias xs


{- creaArbol: Recibe una cadena de texto que transforma para ordenar sus caracteres por su frecuencia de aparición con listaFrecuencias. A partir de ello construye un arbol binario de Huffman mediante auxCreaArbol cuyas ramas derechas son hojas que contienen letras mientras que de las izquierdas siempre se derivan dos ramas. Entre menos repeticiones tenga una letra, mayor será el nivel del árbol en el que se colocará.
Ejemplo:
creaArbol "No soy nada. Nunca seré nada. No puedo querer ser nada. Aparte eso, tengo en mí todos los sueños del mundo." = Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio Vacio) (Hoja '\241')) (Hoja '\237')) (Hoja 'g')) (Hoja ',')) (Hoja 'A')) (Hoja 'q')) (Hoja '\233')) (Hoja 'c')) (Hoja 'y')) (Hoja 'm')) (Hoja 'l')) (Hoja 'p')) (Hoja 't')) (Hoja 'N')) (Hoja '.')) (Hoja 'u')) (Hoja 'r')) (Hoja 'd')) (Hoja 'n')) (Hoja 's')) (Hoja 'a')) (Hoja 'o')) (Hoja 'e')) (Hoja ' ')
-}
creaArbol :: Eq a => [a]-> HuffmanTree a
creaArbol [] = Vacio
creaArbol (x:xs) = auxCreaArbol (listaFrecuencias (x:xs))


{- codificacion: Recibe una cadena de texto y la transforma comprimiéndola en un código binario. Para esto primero crea un árbol binario de Huffman con la cadena de texto que recibe con creaArbol y, a partir de él, genera la codificación al recorrerlo buscando encontrar en las hojas  del árbol cada letra de la cadena mediante la función auxCodificacion.  
Ejemplo:
codificacion "No soy nada. Nunca seré nada. No puedo querer ser nada. Aparte eso, tengo en mí todos los sueños del mundo." = "000000000010011000010010000000000000001100000100010000001000100000000011000000000010000000010000010000000000000000100011000010100000001000000000000000001100000100010000001000100000000011000000000010011000000000000100000000101000000100110000000000000000001000000001010000000101000000011000010100000001100000100010000001000100000000011000000000000000000010000000000001000100000001000000000001011010000100100000000000000000000110000000000010100000100000000000000000000010011010000011000000000000001000000000000000000000011000000000001001000000100100001100000000000001001000011000010000000010100000000000000000000000100100001100000010100000000000001100000000000000100000000100000100000010010000000001"
-}
codificacion :: Eq a => [a] -> [Char]
codificacion [] = []
codificacion (x:xs) = auxCodificacion (creaArbol (x:xs)) (x:xs)


{- decodificacion: Recibe un árbol binario de Huffman, que se genera a partir de una cadena de texto, y el codigo binario codificado de la misma cadena. A partir de ambos decodifica el código binario generando la cadena de texto original mediante la función traductor. Observación: El árbol de Huffman que se pasa como argumento debe colocarse entre paréntesis.
Ejemplo:
decodificacion (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio Vacio) (Hoja '\241')) (Hoja '\237')) (Hoja 'g')) (Hoja ',')) (Hoja 'A')) (Hoja 'q')) (Hoja '\233')) (Hoja 'c')) (Hoja 'y')) (Hoja 'm')) (Hoja 'l')) (Hoja 'p')) (Hoja 't')) (Hoja 'N')) (Hoja '.')) (Hoja 'u')) (Hoja 'r')) (Hoja 'd')) (Hoja 'n')) (Hoja 's')) (Hoja 'a')) (Hoja 'o')) (Hoja 'e')) (Hoja ' ')) "000000000010011000010010000000000000001100000100010000001000100000000011000000000010000000010000010000000000000000100011000010100000001000000000000000001100000100010000001000100000000011000000000010011000000000000100000000101000000100110000000000000000001000000001010000000101000000011000010100000001100000100010000001000100000000011000000000000000000010000000000001000100000001000000000001011010000100100000000000000000000110000000000010100000100000000000000000000010011010000011000000000000001000000000000000000000011000000000001001000000100100001100000000000001001000011000010000000010100000000000000000000000100100001100000010100000000000001100000000000000100000000100000100000010010000000001" = "No soy nada. Nunca ser\233 nada. No puedo querer ser nada. Aparte eso, tengo en m\237 todos los sue\241os del mundo."
-}
decodificacion :: Eq a => HuffmanTree a-> [Char] -> [a]
decodificacion Vacio xs = []
decodificacion _ [] = []
decodificacion arbol xs = traductor arbol arbol xs
