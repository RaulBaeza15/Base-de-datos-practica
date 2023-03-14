alter table tablaunica add primary key(pedidoID, producto, medida);
create unique index PMFL on tablaunica (producto, medida,fecha_hora,localID);
create unique index PMFN on tablaunica (producto, medida,fecha_hora,nombre_local);
create unique index PMFE on tablaunica (producto, medida,fecha_hora,clienteID);
create unique index PMFU on tablaunica (producto, medida,fecha_hora,usuario);

