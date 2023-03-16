CREATE DATABASE IF NOT EXISTS practica1bda_normalizada; 
 USE practica1bda_normalizada;


DROP TABLE IF EXISTS localidadClienteCZ;
CREATE TABLE localidadClienteCZ (
	calle_cliente	varchar(20),
    zona_cliente int,
    PRIMARY KEY (calle_cliente)
); 
DROP TABLE IF EXISTS clienteUEC;
CREATE TABLE clienteUEC (
  usuario varchar(15) PRIMARY KEY,
  clienteID integer not null,
  calle_cliente varchar(20),
  FOREIGN KEY (calle_cliente) REFERENCES localidadClienteCZ(calle_cliente)
);
create unique index clienteIDIndice on clienteUEC (clienteID);

DROP TABLE IF EXISTS localidadLocalJK;
CREATE TABLE  localidadLocalJK(
	calle_local	varchar(20),
	zona_local int,
    PRIMARY KEY (calle_local)
     
); 

DROP TABLE IF EXISTS localLNJ;
CREATE TABLE localLNJ (
	localID int,
    nombre_local varchar(25) not null,
	calle_local	varchar(20),
    PRIMARY KEY (localID),
    FOREIGN KEY (calle_local) REFERENCES localidadLocalJK (calle_local)
); 
create unique index nombre_localIndice on localLNJ (nombre_local);


DROP TABLE IF EXISTS ofertaOD;
CREATE TABLE  ofertaOD(
	nombre_oferta varchar(20),
	descuento int,
    PRIMARY KEY (nombre_oferta)
); 

DROP TABLE IF EXISTS pedidoLFIEBH;

CREATE TABLE  pedidoLFIEBH(
	localID int,
    fecha_hora datetime  not null,
    pedidoID int  not null ,
    clienteID integer  not null,
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

