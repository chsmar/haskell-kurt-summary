module Ln02 where
import Base
-- Fundamentos de la programacion funcional
-- Historicamente los programadores ha estado limitados por la arquitectura Von Neumann
-- Programacion funcional es una alternativa a la programacion imperativa
-- basado en la abstraccion matematica que traciende una implementacion especifica.

-- Funciones y Programacion Funcional
-- Funciones en Haskell
-- - Mismo comportamiento que en las matematicas (3 Reglas)
-- - f(x) = y : funcion 'f': cada 'x' (argumento) tiene uno y solo un 'y' (resultado) 
-- - : transparencia referencial

simple x = x

-- Programacion funcional
-- Basado en el calculo lambda, modelo computacional equivalente a la Maquina de Turing

-- Variables
x = 5
-- x = 6 -- Error!: Multiple declarations of ‘x’

dobleMasDos x = dobleX + 2
    where dobleX = x * 2   -- variable local

-- Q2.1 : Para cumplir la regla 2: devolver un resultado
-- Q2.2 : 
inc x = x + 1
doble x = 2 * x
cuadrado x = x * x
-- Q2.3 :
q2_3 x = if par x then x - 2 else 3*x + 1
 