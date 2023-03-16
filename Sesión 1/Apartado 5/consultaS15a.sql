START TRANSACTION;
select * from tablaunica;
UPDATE tablaunica SET zona_cliente = 4 WHERE calle_cliente = 'Sol';
UPDATE tablaunica SET zona_local = 4 WHERE calle_local = 'Sol';
select * from tablaunica;
ROLLBACK;

