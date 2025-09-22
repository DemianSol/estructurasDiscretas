data Matrioska = Mati | Cont Matrioska deriving (Eq, Show)

{- mayotIgual: Recibe dos elementos de tipo Matrioska y evalúa si el primero es mayor o igual al segundo. Si alguna de estas condiciones es verdadera entonces devuelve True, de lo contrario False.
Ejemplo:
mayorIgual (Cont (Cont Mati) (Cont (Cont (Cont (Cont Mati)))) = False
-}
mayorIgual :: Matrioska -> Matrioska -> Bool
mayorIgual Mati (Cont m) = False
mayorIgual Mati Mati = True
mayorIgual (Cont m) Mati = True
mayorIgual (Cont m1) (Cont m2) = mayorIgual m1 m2


{- aplana: recibe una Matrioska y devuelve su representación en lista. Esta representación guarda como elemento de la lista a cada una de las Matrioskas contenidas en la original, yendo de mayor a menor contención.
Ejemplo:
aplana (Cont (Cont (Cont (Cont (Cont Mati))))) = [Cont (Cont (Cont (Cont (Cont Mati)))),Cont (Cont (Cont (Cont Mati))),Cont (Cont (Cont Mati)),Cont (Cont Mati),Cont Mati,Mati]
-}
aplana :: Matrioska -> [Matrioska]
aplana Mati = [Mati]
aplana (Cont m) = (Cont m):(aplana m)

