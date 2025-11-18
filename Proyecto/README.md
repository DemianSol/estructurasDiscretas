**Variante del algoritmo de codificación de Huffman**

Esta implementación alternativa de la codificación de Huffman se distingue fundamentalmente porque se crea un árbol binario sesgado a la izquierda, pues todos los subárboles izquierdos tienen hijos izquierdos y derechos pero los subárboles derechos son hojas. Por un lado, esto provoca que la implementación general del algoritmo sea más sencilla, tanto en la creación del árbol como en los procesos de codificación y decodificación, sin embargo, lo hace más ineficiente, pues la cantidad de niveles que tienen que recorrerse para realizar la codificación/decodificación de un símbolo se incrementa.

El algoritmo se puede dividir en dos:
- Codificación
    * Se crea una lista de tuplas (un elemento y una frecuencia) en la que se registran la cantidad de apariciones de cada elemento en la cadena original.
    * A partir de la lista de tuplas se crea binario cuyas ramas derechas almacenan los elementos de la lista de tuplas; en los niveles más bajos se guardan los elementos con mayor aparición en la cadena original
    *  Se recorre el árbol buscando el elemento en la cabeza de la lista original, si se encuentra en el subárbol derecho se devuelve '1',  de lo contrario desciende por el subárbol izquierdo acumulando cada vez un '0' hasta localizarlo. Esto se repite para cada elemento de la cadena original.  

- Decodificación
    * Se crea  un árbol de Huffman y un cadena binaria codificada, ambos creados a partir de la cadena de entrada
    * Se recorre la lista hasta que el elemento visitado sea '1'. Al mismo tiempo, y mientras no se consiga el '1', se desciende sobre el árbol.
    * Cuando se llega al '1' se devuelve el elemento en almacenado en el hijo izquierdo del nodo en el que se está.
    * Se repite el proceso hasta terminar la lista binaria. 

Para completarlo, se usaron cuatro funciones principales. Se muestra un ejemplo de su funcionamiento:

listaFrecuencias: Recibe una cadena de texto y a partir de ella genera una lista de tuplas de todas las letras que aparecen en la cadena de texto con su respectiva frecuencia de aparación ordenada  de mayor a menor cantidad de repeticiones.
Ejemplo:
listaFrecuencias "No soy nada. Nunca seré nada. No puedo querer ser nada. Aparte eso, tengo en mí todos los sueños del mundo." = [(' ',20),('e',11),('o',11),('a',8),('s',8),('n',7),('d',7),('r',5),('u',5),('.',4),('N',3),('t',3),('p',2),('l',2),('m',2),('y',1),('c',1),('\233',1),('q',1),('A',1),(',',1),('g',1),('\237',1),('\241',1)]

creaArbol: Recibe una cadena de texto que transforma para ordenar sus caracteres por su frecuencia de aparición con listaFrecuencias. A partir de ello construye un arbol binario de Huffman mediante auxCreaArbol cuyas ramas derechas son hojas que contienen letras mientras que de las izquierdas siempre se derivan dos ramas. Entre menos repeticiones tenga una letra, mayor será el nivel del árbol en el que se colocará.
Ejemplo:
creaArbol "No soy nada. Nunca seré nada. No puedo querer ser nada. Aparte eso, tengo en mí todos los sueños del mundo." = Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio Vacio) (Hoja '\241')) (Hoja '\237')) (Hoja 'g')) (Hoja ',')) (Hoja 'A')) (Hoja 'q')) (Hoja '\233')) (Hoja 'c')) (Hoja 'y')) (Hoja 'm')) (Hoja 'l')) (Hoja 'p')) (Hoja 't')) (Hoja 'N')) (Hoja '.')) (Hoja 'u')) (Hoja 'r')) (Hoja 'd')) (Hoja 'n')) (Hoja 's')) (Hoja 'a')) (Hoja 'o')) (Hoja 'e')) (Hoja ' ')

codificacion: Recibe una cadena de texto y la transforma comprimiéndola en un código binario. Para esto primero crea un árbol binario de Huffman con la cadena de texto que recibe con creaArbol y, a partir de él, genera la codificación al recorrerlo buscando encontrar en las hojas  del árbol cada letra de la cadena mediante la función auxCodificacion.  
Ejemplo:
codificacion "No soy nada. Nunca seré nada. No puedo querer ser nada. Aparte eso, tengo en mí todos los sueños del mundo." = "000000000010011000010010000000000000001100000100010000001000100000000011000000000010000000010000010000000000000000100011000010100000001000000000000000001100000100010000001000100000000011000000000010011000000000000100000000101000000100110000000000000000001000000001010000000101000000011000010100000001100000100010000001000100000000011000000000000000000010000000000001000100000001000000000001011010000100100000000000000000000110000000000010100000100000000000000000000010011010000011000000000000001000000000000000000000011000000000001001000000100100001100000000000001001000011000010000000010100000000000000000000000100100001100000010100000000000001100000000000000100000000100000100000010010000000001"

decodificacion: Recibe un árbol binario de Huffman, que se genera a partir de una cadena de texto, y el codigo binario codificado de la misma cadena. A partir de ambos decodifica el código binario generando la cadena de texto original mediante la función traductor. Observación: El árbol de Huffman que se pasa como argumento debe colocarse entre paréntesis.
Ejemplo:
decodificacion (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio Vacio) (Hoja '\241')) (Hoja '\237')) (Hoja 'g')) (Hoja ',')) (Hoja 'A')) (Hoja 'q')) (Hoja '\233')) (Hoja 'c')) (Hoja 'y')) (Hoja 'm')) (Hoja 'l')) (Hoja 'p')) (Hoja 't')) (Hoja 'N')) (Hoja '.')) (Hoja 'u')) (Hoja 'r')) (Hoja 'd')) (Hoja 'n')) (Hoja 's')) (Hoja 'a')) (Hoja 'o')) (Hoja 'e')) (Hoja ' ')) "000000000010011000010010000000000000001100000100010000001000100000000011000000000010000000010000010000000000000000100011000010100000001000000000000000001100000100010000001000100000000011000000000010011000000000000100000000101000000100110000000000000000001000000001010000000101000000011000010100000001100000100010000001000100000000011000000000000000000010000000000001000100000001000000000001011010000100100000000000000000000110000000000010100000100000000000000000000010011010000011000000000000001000000000000000000000011000000000001001000000100100001100000000000001001000011000010000000010100000000000000000000000100100001100000010100000000000001100000000000000100000000100000100000010010000000001" = "No soy nada. Nunca ser\233 nada. No puedo querer ser nada. Aparte eso, tengo en m\237 todos los sue\241os del mundo."


El objetivo fundamental de la implementación es la aplica del conocimiento adquirido en el curso sobre las estructuras listas, árboles binarios y sobre Haskell.  Completarlo tomó alrededor de una semana


