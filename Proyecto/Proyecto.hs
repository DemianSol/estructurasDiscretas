import Aux

-- Genera una lista de tuplas de todas las letras que aparecen en la cadena de texto. Las tuplas están ordenadas de mayor a menor cantidad de veces que se repiten las letras en la cadena. 
listaFrecuencias :: [Char] -> [(Char, Int)]
listaFrecuencias [] = [] --error "no se recibió lista alguna"
listaFrecuencias xs = ordenar (auxListaFrecuencias (filtra xs) xs)








