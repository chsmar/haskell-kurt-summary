module Ln05 where
import Base
import Ln04    

-- Clausuras y aplicaciones parciales
-- Un patron de programacion repetido:
--    siParIncrementar_b x = siPar incrementar x
--    siParDoblar_b x      = siPar doblar x
-- Solucion:
--    genSiPar f = (\x -> siPar f x)
-- f es una Clausura: Cuando capturas un valor dentro de una funcion Lambda
-- Redefiniendo siParIncrementar:
--    siParIncrementar = genSiPar incrementar
--    siParIncrementar = (\x -> siPar incrementar x)

-- QC 5.1
genSiXPar x = (\f -> siPar f x)

-- Ejemplo: generacion de URL para un API
--    URL: nombre anfitrion, nombre recurso, id recurso, clave API: http://ejemplo.com/libro/1?clave=k0043ksll
obtenerURL anfitrion clave recurso id = anfitrion++"/"++recurso++"/"++id++"?clave="++clave
-- Modo Clausura para no repetir anfitrion
genURLConstructor anfitrion = (\clave recurso id -> obtenerURL anfitrion clave recurso id)
-- ^ Muy util y reutilizable, no tener que poner cada vez "http://ejemplo.com"
urlConstructor1 = genURLConstructor "http://ejemplo.com"   -- Funcion anonima (obtenerURLConstructor "http://ejemplo.com")
-- Si la clave tampoco cambia
genClaveConstructor anfitrionConstructor clave = (\recurso id -> anfitrionConstructor clave recurso id)
claveConstructor1 = genClaveConstructor urlConstructor1 "k0043ksll"
-- QC 5.2
genRecursoConstructor claveConstructor recurso = (\id -> claveConstructor recurso id)
recursoConstructor1 = genRecursoConstructor claveConstructor1 "libro"
-- genClaveConstructor anfitrionConstructor clave recurso = (\id -> anfitrionConstructor clave recurso id)

-- Haciendo simple las Clausuras
sumar4 a b c d = a + b + c + d
sumarX_a3 x = \b c d -> sumar4 x b c d   -- no es facil de entender
sumarXY_a2 x y = \c d -> sumar4 x y c d  -- menos facil de entender
-- Solucion Haskell: Aplicacion Parcial 
sumarX_a3' x = sumar4 x
sumarXY_a2' x y = sumar4 x y

-- QC 5.3
urlConstructor = obtenerURL "http://ejemplo.com"
miIdConstructor = urlConstructor "k0043ksll" "libro" -- id: parametro implicito
miIdConstructor' = obtenerURL "http://ejemplo.com" "k0043ksll" "libro" -- id: parametro implicito

-- Importante: Poner el orden de los parametros. De mas general a mas especifico.
-- De menos variacion a mas variacion. 
-- Si no se puede ordenar los parametros:
intercambiar' f = \x y -> f y x   
-- Operaciones infijas:
resta1 = 4 - 2
resta2 = (-) 4 2
resta3 = intercambiar (-) 4 2  -- 2 - 4 = -2

-- QC 5.4
restar2 = intercambiar (-) 2

-- Q5.1
siParIncrementar' = siPar incrementar
siParDoblar' = siPar doblar
-- siParCubicar' = siPar cubicar
-- Q5.2
aplicacionParcialBin f x = \y -> f x y
