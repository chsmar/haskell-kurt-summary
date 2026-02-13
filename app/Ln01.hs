-- Codigo monolitico - modularizado
module Ln01 where
import Base

todoEnUno :: IO ()
todoEnUno = do
    imprimir "¿Para quién es el correo?"
    destinatario <- leer
    imprimir "¿Cuál es el título?"
    titulo <- leer
    imprimir "¿Quién es el autor?"
    autor <- leer
    imprimir ("Estimado/a " ++ destinatario ++ ",\n" ++
        "Gracias por comprar " ++ titulo ++ "\nAtentamente,\n" ++
        autor )

modularizado :: IO ()
modularizado = do
    imprimir "¿Para quién es el correo?"
    destinatario <- leer
    imprimir "¿Cuál es el título?"
    titulo <- leer
    imprimir "¿Quién es el autor?"
    autor <- leer
    imprimir (crearCorreo destinatario titulo autor)

crearCorreo destinatario tituloLibro autor = cabecera destinatario ++ contenido tituloLibro ++ despedida autor

cabecera destinatario = "Estimado/a " ++ destinatario ++ ",\n"
contenido tituloLibro = "Gracias por comprar " ++ tituloLibro ++ ".\n"
despedida autor = "Atentamente,\n" ++ autor
