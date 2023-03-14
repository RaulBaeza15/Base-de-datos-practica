
START TRANSACTION;
select * from tablaunica;
DELETE FROM tablaunica WHERE pedidoID = 170;
select * from tablaunica;
ROLLBACK;
