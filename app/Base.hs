module Base where

imprimir :: String -> IO ()
imprimir = putStrLn

leer :: IO String
leer = getLine

par = even
impar = odd

t1 = fst
t2 = snd 

comparar :: Ord a => a -> a -> Ordering
comparar = compare

intercambiar = flip

l1 = head
ls = tail
ln = last
invertir = reverse
