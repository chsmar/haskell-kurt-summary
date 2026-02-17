module Ln03 where

-- Funciones Lambda, funciones anónimas, funciones sin nombre
lambda1 = \x -> x + 1

-- QC 3.1
-- lambda2 = \x -> x * 2
ejemplo1 = (\x -> x * 2) 5 -- 10
ejemplo2 = (\x y -> x + y) 3 4 -- 7
ejemplo3 = (\x -> \y -> x + y) 3 4 -- 7

-- Lambda en reemplazo de where
suma2_2suma_a x y = if s1 > s2 then s1 else s2
  where s1 = x^2 + y^2
        s2 = (x + y)^2
-- reemplazamos la logica principal por una función lambda        
suma2_2suma_b x y = (\s1 s2 -> if s1 > s2 then s1 else s2) (x^2 + y^2) ((x + y)^2)

-- QC 3.2
doble2_a x = (* 2) (x*2)
doble2_b x = (\y -> y * 2) (x*2)

-- De lambda a let -- sobreescibir una variable
sobreescribir x = let x = 2
                  in let x = 3
                     in let x = 4
                        in x

-- QC 3.3
-- sobreescribir_b x = (...) 2
-- sobreescribir_b x = ((...) 3) 2
-- sobreescribir_b x = (((...) 4) 3) 2
sobreescribir_b x = (\x -> (\x -> (\x -> x) 4) 3) 2

-- Ventajas de las funciones lambda - alcance léxico (lexical scope)
x = 4
suma1 y = x + y -- 4 + y : encuentra x en el entorno global
suma2 y = (\x -> x + y) 4 -- 4 + y : encuentra x en el entorno local de la función lambda
suma3 y = (\y -> (\x -> x + y) 4) 5 -- 4 + 5 : ignora el argumento de la funcion suma3

-- Q3.1
-- Q3.2
contador x = (\x -> (\x -> x) (x + 1)) (x + 1)
             
