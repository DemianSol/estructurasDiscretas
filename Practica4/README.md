**Respuesta a pregunta de la práctica 3** La estructura de la canción es en esencia siempre la misma, lo que cambia en cada repetición es que se añaden progresivamente nuevos animales y sus respectivos sonidos a la canción. Es decir, cada vez repite a los animales anteriores y sus sonidos, y añade al final un nuevo animal. Entonces, cada verso de la canción depende del verso anterior,  siendo el caso base el atropellamiento, lo que permite que la canción termine. 

**Práctica 4**

**Objetivo** Definir e implementar nuevos tipos de datos mediante recursión, así como operaciones con estos nuevos tipos, aprovechando el uso de         módulos.

1. a_natural
Para el caso base pensé en el elemento mínimo (minimal) del conjunto de los número naturales, el cero, cuya equivalencia en los números enteros es el 0. Por decirlo de alguna manera, el Cero es el único elemento de Natural que tenemos seguro, y tiene la característica de que si, se aplican sucesores, entonces "crece". Lo contrario pasa con el número entero que se tiene que convertir, pues el único límite que le conocemos en el 0. Así, noté que su evolución tenía que ser opuesta: en cada paso de la recursión al entero tenía que disminuirlo mientras que al Natural incrementarlo, con lo que conseguí establecer el caso recursivo.

2.  a_entero
Para definir el caso base apliqué la misma idea, de que el elemento mínimo que se puede representar con Natural es Cero. Ahora, para el recursivo aproveché la inferencia de tipos de Haskell: como la función recibe un Natural, entonces si recibe (S m) infiere que m también es Natural. Entonces hice que en cada paso recursivo "perdiera" un sucesor el Natural dado al mismo tiempo que sumara 1, con lo que las veces que se "pierde" un sucesor se agrega un entero, lo que construye el entero buscado.

3. potenciaNat
Para definir el caso base recordé que como trabajamos con naturales entonces los números racionales no están definidos, por lo que el exponente debe ser necesariamente un entero positivo o 0. A partir de esto, pensé en que el primer elemento se mantiene fijo: en cada paso de la recursión se opera con otro número, entonces  el único elemento por cambiar sería el segundo y, como solo está definido su "límite inferior" entonces concluí que tenía que ser el caso base cuando el segundo Natural llegase a Cero.  Por esto concluí que en cada paso recursivo entonces tenía que disminuir el segundo argumento para que se sumara el primer elemento el numero de veces que el Natural dado como segundo argumento estableciera.

4. facNat
Ya que el factorial es una multiplicación, entonces el caso base no podía ser 0, pues haría al resultado siempre 0. Por esta misma lógica, llegué a la conclusión de que tenía que ser 1, pues mantendría al resultado igual. Como es una multiplicación, entonces me di cuenta de que para que se mutiplicara siempre el elemento dado por ese elemento menos 1 tenía que usar a la función como un argumento de la multiplicación, dando como su argumento al número reducido.

5. mayorIgual
Para definir el caso base tuve que pensar en las situaciones que podían darse al comparar dos Matrioskas, con lo que llegué a tres: que fuera mayor, menor o igual, lo que me llevó a definir tres casos base. Ahora, como la comparación implica "abrir" las Matrioskas, entonces en el caso recursivo hice que en cada paso recursivo las Matrioskas recibidas se abrieran.

6. aplana
Para el caso base pensé en el elemento minimal de las Matrioskas, es decir, en Mati, por lo que necesariamente tenía que ser esta muñeca, por lo que, respetando la definición de la función ":", que pega un elemento con una lista, definí a Mati como una lista unitaria, lo que asegura que se pueda pegar en los pasos recursivos. En el caso recursivo lo que tenía que suceder era que siempre fuera disminuyendo el "tamaño" de la Matrioska recibida, por lo que hice que "pagará" siempre el elemento Matrioska más grande y diera como argumento esa Matrioska abierta. 

**Tiempo requerido** Me tomó alrededor de  3 horas terminar la práctica

**Comentarios** Me costó algo de trabajo usar correctamente los modulos, porque estaba definiendo a los Naturales tanto en el modulo como en el archivo al que lo importaba. 



