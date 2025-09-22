module OperacionesNat where 

data Natural = Cero | S Natural deriving (Eq, Show)

{- suma_natural: Eecibe dos numeros representados como  sucesor de Natural y devuelve el resultado de su suma como sucesor de Natural
Ejemplo:
suma_natural (S Cero) (S (S Cero)) = (S (S (S Cero)))
-}
suma_natural :: Natural -> Natural -> Natural
suma_natural n Cero = n
suma_natural n (S m) = suma_natural (S n) m

{- milti_natural: Recibe dos numeros representados como  sucesor de Natural y devuelve el resultado de su producto como sucesor de Natural
Ejemplo:
multi_natural -(S (S (S Cero))) (S (S Cero)) = ( S ( S (S (S (S (S Cero)))))) 
-}
multi_natural :: Natural -> Natural -> Natural
multi_natural Cero n = Cero
multi_natural (S m) n = suma_natural n (multi_natural m n)
