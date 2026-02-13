module Base where

imprimir :: String -> IO ()
imprimir = putStrLn

leer :: IO String
leer = getLine

par = even
impar = odd
 