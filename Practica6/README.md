**Objetivo:** Adquirir conocimiento en el uso de funciones con árboles en distintos escenarios.

**Tiempo requerido:** Alrededor de 3 días

**Comentario extra:** Las funciones 3,5 y 6 absorbieron gran parte del tiempo que necesité para terminar la práctica. La función 5 porque no entendía cómo hacer la comparación de los subárboles izquierdo y derecho y la raíz para elegir el mínimo de entre los tres; en la función 6 porque me costó trabajo saber cómo ir eliminando de la lista dada como parámetro de la función los elementos que ya se habían agregado al árbol, cuestión que resolví con las funciones auxiliares ; finalmente en la función 3, la que absorbió más tiempo, el problema radicó en el manejo del árbol Vacío, pues si bien fue obvio que si el árbol original era Vacío tenía que devolverse un error, cuando no lo era también tenía que controlar cuando se llegará al nodo Vacío. 

**Sintaxis:**  
**Primera parte*  

**Arbol 1** 
graph TB
    R(("1"))
    I1(("2"))
    D1(("3"))
    I2(("4"))
    D2(("Ø"))
    I4((11))
    D4((10))
    I5(("0"))
    D5(("28"))
    R --> I1
    R --> D1
    I1 --> I2
    I1 --> D2
    D1 --> I4
    D1 --> D4
    I4 --> I5
    I4 --> D5
    
**Arbol 2**
graph TB
    R(("4"))
    I1(("7"))
    D1(("3"))
    I2(("9"))
    D2(("Ø"))
    I3(("15"))
    D3(("Ø"))
    R --> I1
    R --> D1
    I1 --> I2
    I1 --> D2
    I2 --> I3
    I2 --> D3  

**Segunda parte*  
a)  
<img width="513" height="616" alt="practica6_a)" src="https://github.com/user-attachments/assets/cda65bab-c5f4-4f1e-8028-9e8432a5622d" />

b)  
<img width="458" height="625" alt="practica6_b)" src="https://github.com/user-attachments/assets/93852fba-0636-4520-aebe-7813128b979e" />
  
c)  
<img width="764" height="524" alt="practica6_c)" src="https://github.com/user-attachments/assets/894c98dc-6739-4061-b672-38f1dc6979af" />





**Actividades en la práctica:** Pregunta en función listaArboles: **¿Qué sucede cuando la lista no esta ordenada y cuando lo esta?** Cuando la lista no está ordenada entonces la raíz puede tener subárboles derecho e izquierdo distintos del Vacío. Sin embargo, si la lista está ordenada, entonces únicamente el subárbol izquierdo o el derecho de la raíz será distinto del Vacío y el otro si tendrá elementos, todo depende de si el ordenamiento de la lista es de mayor a menor o de menor a mayor. 



