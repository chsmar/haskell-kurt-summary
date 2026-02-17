module Ln04 where
import Base(t1, t2, comparar)

-- Funciones de primera clase

-- Funciones como argumentos
siParIncrementar x = if even x then x + 1 else x
siParDoblar x = if even x then x * 2 else x
-- Abstraer la lógica común
siPar f x = if even x then f x else x
incrementar n = n + 1
doblar n = n * 2

siParIncrementar_b x = siPar incrementar x
siParDoblar_b x = siPar doblar x
-- Las funciones tienen precedencia sobre los operadores
resultado1 = 1 + 2 * 3 -- 7
resultado2 = incrementar 2 * 3 -- 9

-- Funciones lambda como argumentos
siParIncrementar_c x = siPar (\n -> n + 1) x
-- QC 4.1
siParCubicar x = siPar (\n -> n^3) x

-- QC 4.2
compararApellidos persona1 persona2 = if apellido1 > apellido2 then GT 
                                      else if apellido1 < apellido2 then LT
                                           else if nombre1 > nombre2 then GT
                                                else if nombre1 < nombre2 then LT
                                                     else EQ  
  where apellido1 = t2 persona1
        apellido2 = t2 persona2
        nombre1 = t1 persona1
        nombre2 = t1 persona2

-- compararApellidos_b persona1 persona2 = case comparar (t2 persona1) (t2 persona2) of
--   EQ -> comparar (t1 persona1) (t1 persona2)
--   r -> r
compararApellidos_c persona1 persona2 = comparar (t2 persona1) (t2 persona2) <> comparar (t1 persona1) (t1 persona2)

-- Funciones como resultado
direccionCorreo persona loc = formatoFuncion persona
  where formatoFuncion = funcionLocalizacion loc
funcionLocalizacion loc = case loc of
  "bo" -> formatoBolivia       -- funcion como resultado
  "br" -> formatoBrasil
  "ar" -> formatoArgentina
  _    -> formatoDefecto
formatoBolivia persona = "(" ++ t1 persona ++ " " ++ t2 persona ++ ") Bolivia."  -- ejemplo inventado
formatoBrasil persona = "Brasil | " ++ t2 persona ++ ", " ++ t1 persona ++ "."   -- ejemplo inventado
formatoArgentina persona = "" ++ t2 persona ++ " " ++ t1 persona ++ " AR."       -- ejemplo inventado
formatoDefecto persona = "" ++ t1 persona ++ " "++ t2 persona ++ "."

-- Q4.1
compararApellidos_b persona1 persona2 = case comparar (t2 persona1) (t2 persona2) of
  EQ -> comparar (t1 persona1) (t1 persona2)
  r -> r
-- Q4.2 formato "ar"
