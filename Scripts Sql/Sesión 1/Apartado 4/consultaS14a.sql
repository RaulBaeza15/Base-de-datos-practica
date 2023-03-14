#Los datos de un nuevo local de la cadena de pizzerías con identificador 4, nombre La Cuarta, y situada en la calle Venus y zona 3
USE practica1bda_tablaunica;

START TRANSACTION;
--
SAVEPOINT punto_de_guardado;

-- Aquí puedes realizar otras inserciones o consultas, si es necesario --
select * from tablaunica;
INSERT INTO tablaunica (localID,nombre_local ,calle_local ,zona_local,producto,medida,pedidoID) VALUES (4, 'La Cuarta', 'calle Venus',3,"bordes quemados","8",7);
/*
Error Code: 1364. Field 'producto' doesn't have a default value
-Le añado un prducto
Error Code: 1364. Field 'medida' doesn't have a default value
-le añado una medida 
Error Code: 1364. Field 'pedidoID' doesn't have a default value
-le añado un pedidoId
funciona
*/
select * from tablaunica;
-- Si encuentras algún error, puedes hacer rollback a la transacción anteriormente guardada:
ROLLBACK TO punto_de_guardado;

