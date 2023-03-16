-- Asignatura Bases de Datos Avanzadas - curso 2022-23
-- ETS Ingeniería Sistemas Informáticos - UPM

-- -----------------------------------------------------
-- Practica 1 - Script de creación de la Tabla inicial
-- -----------------------------------------------------

 CREATE DATABASE IF NOT EXISTS practica1bda_tablaunica; 
 USE practica1bda_tablaunica;

--
-- Creación de la tabla
--
DROP TABLE IF EXISTS tablaunica;
CREATE TABLE tablaunica (
	usuario	varchar(15), 
    clienteID integer,
    calle_cliente	varchar(20),
    zona_cliente int,
	localID int,
    nombre_local varchar(25),
	calle_local	varchar(20),
    zona_local int,
	producto varchar(20),
	tipo varchar(10),
	medida	varchar(10),
	precio	decimal(5,2),
    nombre_oferta varchar(20),
	descuento int,
    pedidoID int,
	fecha_hora datetime,
	cantidad int,
	subtotal decimal(7,2),
	total decimal(7,2),
    entrega varchar(10)
); 

-- Controlar que la oferta se aplica únicamente a productos de tipo Comida
	DROP TRIGGER IF EXISTS ComprobarOfertaComida ;

-- Creamos el trigger	
	DELIMITER //
	CREATE TRIGGER ComprobarOfertaComida
	BEFORE INSERT ON tablaunica
	FOR EACH ROW
	BEGIN
		-- Comprobamos si se registra oferta, ya que solo es válida para productos de tipo Comida
			-- Si el producto es de tipo Bebida, se cancela la insercion con SIGNAL
			--    mostrando el mensaje de error
		IF (NEW.nombre_oferta IS NOT NULL AND NEW.tipo = 'Bebida') 
		THEN
			SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'Las ofertas no se aplican a productos de tipo Bebida';
		END IF;
	END//
	DELIMITER ;

--
-- Inserción de datos
--
insert into tablaunica values
('pepe22', 11, 'Sol', 3, 1, 'La Primera', 'Luna', 3, 'Pizza Carbonara', 'Comida', 'Mediana', 12, '2 x 1 domicilio', 50, 101, '2023-02-11 20:45', 2, 12, 18, 'Domicilio');
insert into tablaunica values
('pepe22', 11, 'Sol', 3, 1, 'La Primera', 'Luna', 3, 'Cola', 'Bebida', 50 , 3, null, null, 101, '2023-02-11 20:45', 2, 6, 18, 'Domicilio');
insert into tablaunica values
('maria1', 3, null, null, 2, 'Otra', 'Italia', 2, 'Pizza Margarita', 'Comida', 'Familiar', 18 , null, null, 125, '2023-02-11 20:45', 1, 18, 18, 'Local');
insert into tablaunica values
('zampa', 25, 'Sol', 3, 1, 'La Primera', 'Luna', 3, 'Pizza Cuatro quesos', 'Comida', 'Mediana' , 12, '2 x 1 domicilio', 50, 135, '2023-02-11 20:45', 2, 12, 17, 'Domicilio');
insert into tablaunica values
('zampa', 25, 'Sol', 3, 1, 'La Primera', 'Luna', 3, 'Cola', 'Bebida', 33 , 2.5, null, null, 135, '2023-02-11 20:45', 2, 5, 17, 'Domicilio');
insert into tablaunica values
('marta23', 7, 'Arco', 1, 2, 'Otra', 'Italia', 2, 'Pizza Margarita', 'Comida', 'Mediana' , 12, null, null, 170, '2023-02-12 21:45', 1, 12, 12, 'Domicilio');
insert into tablaunica values
('laura', 30, 'Trebol', 1, 3, 'Una Más', 'Luz', 1, 'Pizza Vegana', 'Comida', 'Mediana' , 13, 'Oferta Domingo', 25, 171, '2023-02-12 21:45', 2, 19.25, 37.25, 'Local');
insert into tablaunica values
('laura', 30, 'Trebol', 1, 3, 'Una Más', 'Luz', 1, 'Pizza Carbonara ', 'Comida', 'Familiar' , 18, null, null, 171, '2023-02-12 21:45', 1, 18, 37.25, 'Local');
insert into tablaunica values
('zampa', 25, 'Sol', 3, 2, 'Otra', 'Italia', 2, 'Pizza Cuatro quesos', 'Comida', 'Mediana' , 12, '2 x 1 domicilio', 50, 208, '2023-02-14 20:45', 2, 12, 12, 'Local');
insert into tablaunica values
('maria1', 3, null, null, 3, 'Una Más', 'Luz', 1, 'Pizza Margarita', 'Comida', 'Familiar', 18 , null, null, 222, '2023-02-14 21:45', 1, 18, 18, 'Local');





