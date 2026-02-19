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



