SELECT nombre_local, producto, medida, tipo
FROM tablaunica
WHERE DATE(fecha_hora) = '2023-02-12' AND nombre_oferta IS NULL
ORDER BY producto ASC, nombre_local ASC;

