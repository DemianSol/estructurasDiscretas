import OperacionesNat


{-a_natural: Recibe un número entero y devuelve su representación con la notación de sucesor de Natural
Ejemplo:
a_natural 4 = (S (S (S (S Cero))))
-}
a_natural :: Int -> Natural
a_natural 0 = Cero
a_natural n = S(a_natural (n-1))

{-a_entero: Recibe un número escrito con la notación sucesor de Natural y lo devuelve en su representación de entero
Ejemplo:
a_entero (S (S (S (S (S Cero))))) = 5
-}
a_entero :: Natural -> Int
a_entero Cero = 0
a_entero (S n) = 1+ a_entero n

{- potenciaNat: Recibe dos números con su representación de sucesor Natural. El primero se eleva a la potencia del segundo y el resultado se devuelve como sucesor de natural.
Ejemplo: 
potenciaNat (S (S (S (S Cero)))) (S Cero) = S (S (S (S Cero)))
-}
potenciaNat :: Natural -> Natural -> Natural 
potenciaNat _ Cero = (S Cero) 
potenciaNat (S m) (S n) = multi_natural (S m) (potenciaNat (S m) n)

{- facNat: Recibe un numero representado como sucesor Natural y calcula su factorial. El resultado lo devuelve en la misma representación
Ejemplo:
facNat (S (S (S (S Cero)))) = S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Cero)))))))))))))))))))))))
-}
facNat :: Natural -> Natural
facNat (S Cero) = (S Cero)
facNat (S n) = multi_natural (S n) (facNat n)


