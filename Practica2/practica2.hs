sayHello :: String -> String
sayHello cadena = "Hello , " ++ show cadena ++ "!"


calcularPropina :: Double -> Double
calcularPropina cuenta = cuenta*(0.15)

menor :: Int -> Int -> Int -> Int
menor a b c =
   if a<=b && b<=c then a
   else if b<a && a<c then b
   else c

decide :: Bool -> String -> String -> String
decide bo a b = if bo == True then a else b

esDescendiente :: Int -> Int -> Int -> Int -> Bool
esDescendiente x y z w = if x>=y && y>=z && z>=w then True else False

esDivisible :: Int -> Int -> String
esDivisible x y = if y == 0 then " No se puede dividie entre 0"
  else if mod x y == 0 then show x ++ " es divisible entre" ++ show y
  else show x ++ " no es divisible entre " ++ show y
  
hipotenusa :: Float -> Float -> Float
hipotenusa b h = sqrt(b^2 + h^2)

pendiente :: (Float, Float) -> (Float, Float) -> Float
pendiente (x1, y1) (x2, y2) = (y2-y1) / (x2-x1)

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1,y1) (x2, y2) = sqrt((x2-x1)^2 + (y2-y1)^2)


cuadrados :: [Int] -> [Int]
cuadrados [] = []
cuadrados (x:xs) = x*x: cuadrados (xs)


                                        
