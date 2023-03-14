SELECT nombre_local, SUM(total) 
FROM (SELECT DISTINCT pedidoID, nombre_local, total 
      FROM tablaunica 
      WHERE producto LIKE '%pizza%') AS tabla_pizza 
GROUP BY nombre_local;
