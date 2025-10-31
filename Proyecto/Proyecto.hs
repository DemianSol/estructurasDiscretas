




-- Genera una lista de tuplas de todas las letras que aparecen en la cadena de texto. Las tuplas están ordenadas de mayor a menor cantidad de veces que se repiten las letras en la cadena. 
listaFrecuencias :: [Char] -> [(Char, Int)]
listaFrecuencias [] = [] --error "no se recibió lista alguna"
listaFrecuencias xs = ordenar (auxListaFrecuencias (filtra xs) xs)


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






