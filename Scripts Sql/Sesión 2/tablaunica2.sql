CREATE DATABASE IF NOT EXISTS practica1bda_tablaunica2; 
 USE practica1bda_tablaunica2;

DROP TABLE IF EXISTS clienteUEC;
CREATE TABLE clienteUEC (
	usuario	varchar(15), 
    clienteID integer UNIQUE,
    calle_cliente varchar(20),
    PRIMARY KEY (usuario)
); 
create unique index clienteIDIndice on clienteUEC (clienteID);

DROP TABLE IF EXISTS localidadClienteCZ;
CREATE TABLE localidadClienteCZ (
	calle_cliente	varchar(20),
    zona_cliente int,
    PRIMARY KEY (calle_cliente)
); 

DROP TABLE IF EXISTS localLNJ;
CREATE TABLE localLNJ (
	localID int,
    nombre_local varchar(25),
	calle_local	varchar(20),
    PRIMARY KEY (localID)
); 
create unique index nombre_localIndice on localLNJ (nombre_local);

DROP TABLE IF EXISTS localidadLocalJK;
CREATE TABLE  localidadLocalJK(
	calle_local	varchar(20),
	zona_local int,
    PRIMARY KEY (calle_local)
); 

DROP TABLE IF EXISTS ofertaOD;
CREATE TABLE  ofertaOD(
	nombre_oferta varchar(20),
	descuento int,
    PRIMARY KEY (nombre_oferta)
); 

DROP TABLE IF EXISTS pedidoLFIEBH;
CREATE TABLE  pedidoLFIEBH(
	localID int,
    fecha_hora datetime,
    pedidoID int,
    clienteID integer,
    total decimal(7,2),
    entrega varchar(10),
    PRIMARY KEY (localID, fecha_hora)
    
); 

create unique index pedidoIDIndice on pedidoLFIEBH (pedidoID);
create unique index horaClienteIndice on pedidoLFIEBH (clienteID, fecha_hora);

DROP TABLE IF EXISTS productoPA;
CREATE TABLE  productoPA(
	producto varchar(20),
    tipo varchar(10),
	
    PRIMARY KEY (producto)
); 

DROP TABLE IF EXISTS precioProductoPMR;
CREATE TABLE  precioProductoPMR(
	producto varchar(20),
    medida	varchar(10),
    precio	decimal(5,2),
    PRIMARY KEY (producto, precio)
); 

DROP TABLE IF EXISTS precioPedidoIPMGOS;
CREATE TABLE  precioPedidoIPMGOS(
	pedidoID int,
	producto varchar(20),
    medida	varchar(10),
    cantidad int,
	subtotal decimal(7,2),
    nombre_oferta varchar(20),
    PRIMARY KEY (pedidoID, producto, medida)
); 
