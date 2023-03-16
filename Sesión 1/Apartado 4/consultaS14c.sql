#Los datos de un nuevo pedido (identificador 344) del cliente zampa con identificador 25, al local "La Primera" (identificador 1) de una Pizza Cuatro quesos el 28 de febrero de 2023 a las 21:00 por un importe total de 18€ y entrega a domicilio. 

USE practica1bda_tablaunica;

START TRANSACTION;
--
SAVEPOINT punto_de_guardado;

-- Aquí puedes realizar otras inserciones o consultas, si es necesario --
select * from tablaunica;
INSERT INTO tablaunica (pedidoID,usuario,calle_cliente,zona_cliente,clienteID,nombre_local,entrega,medida,producto,nombre_oferta,subtotal,total) 
VALUES (511,'new23','calle Marte',2,35,"La Primera",'Domicilio','Mediana','Pizza Vegana','2 x 1 domicilio',13,13);
INSERT INTO tablaunica (pedidoID,usuario,calle_cliente,zona_cliente,clienteID,nombre_local,entrega,medida,producto,nombre_oferta,subtotal,total) 
VALUES (511,'new23','calle Marte',2,35,"La Primera",'Domicilio','Mediana','Pizza Vegana','2 x 1 domicilio',0,13);
/*
No ha petado
*/
select * from tablaunica;
-- Si encuentras algún error, puedes hacer rollback a la transacción anteriormente guardada:
ROLLBACK TO punto_de_guardado;
