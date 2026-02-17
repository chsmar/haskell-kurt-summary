module Main (main) where
import Base
import Ln01
import Ln02
import Ln03

main :: IO ()
-- main = putStrLn "Hello, Haskell!"
main = do 
    -- modularizado
    imprimir (simple "5")
