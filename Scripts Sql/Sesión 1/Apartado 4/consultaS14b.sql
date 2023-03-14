#Los datos de un nuevo pedido (identificador 344) del cliente zampa con identificador 25, al local "La Primera" (identificador 1) de una Pizza Cuatro quesos el 28 de febrero de 2023 a las 21:00 por un importe total de 18€ y entrega a domicilio. 

USE practica1bda_tablaunica;

START TRANSACTION;
--
SAVEPOINT punto_de_guardado;

-- Aquí puedes realizar otras inserciones o consultas, si es necesario --
select * from tablaunica;
INSERT INTO tablaunica (pedidoID,usuario,clienteID,nombre_local
,localID,producto,fecha_hora,total,entrega) 
VALUES (344,'zampa',25,"La Primera",1,'Pizza Cuatro quesos','2023-02-28 21:00:00',18,'Domicilio');
/*
No ha petado
*/
select * from tablaunica;
-- Si encuentras algún error, puedes hacer rollback a la transacción anteriormente guardada:
ROLLBACK TO punto_de_guardado;

