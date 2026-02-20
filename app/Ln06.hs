module Ln06 where
import Base

-- Listas: Estructura de datos fundamental en Haskell. 
-- Naturaleza recursiva: vacio o un elemento seguido del resto de la lista.
encabezado1 = l1 [1,2,3,4,5]  -- 1
resto1      = ls [1,2,3,4,5]  -- [2,3,4,5]
-- Constructor de listas: operador infijo (:) o el operador de 'cons' (de Lisp, abbr: constructor).
lista1 = 1:[]
lista2 = 2:lista1    -- [2,1]
lista1_3 = 1:2:3:[]  -- [1,2,3]
lista0_3 = 0:[1,2,3] -- [0,1,2,3]
-- Concatenación de listas: operador infijo (++).
lista4 = lista2 ++ [3,4]  -- [2,1,3,4]

-- Listas y Evaluacion perezosa
listaR1 = [1..5]  -- [1,2,3,4,5]  -- '..' operador (especial) de rango (sintaxis Haskell)
                                  -- que funciona con tipos enumerables (Enum)
listaR2 = [1..]   -- lista infinita de enteros positivos.
                  -- existe gracias a la evaluación perezosa (evalua cuando se necesita)
                  -- desventaja: Performance, dificil de evaluar.
                  --   Puede almacenar grandes estructuras de funciones no evaluadas que 
                  --   representan pocos datos simples                 

-- QC 6.1: False

