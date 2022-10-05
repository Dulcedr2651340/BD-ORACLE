-- Lista codigo, nombre de especialidad y la cantidad de alumnos por especialidad
SELECT C.IDCLIENTE,
       C.NOMBRECLI,
       COUNT(P.IDPEDIDO) AS CANT_PEDIDOS
FROM CLIENTES C INNER JOIN PEDIDOS P
    ON C.IDCLIENTE=P.IDCLIENTE
GROUP BY C.IDCLIENTE, C.NOMBRECLI
   ORDER BY IDCLIENTE ASC;
   
-- de la consulta anterior, listar aquellos clientes que tengan mas de 15
-- pedidos registrados
SELECT C.IDCLIENTE,
       C.NOMBRECLI,
       COUNT(P.IDPEDIDO) AS CANT_PEDIDOS
FROM CLIENTES C INNER JOIN PEDIDOS P
    ON C.IDCLIENTE=P.IDCLIENTE
GROUP BY C.IDCLIENTE, C.NOMBRECLI
  HAVING COUNT(P.IDPEDIDO)>15
   ORDER BY IDCLIENTE ASC;

SELECT * FROM PEDIDOS;

-- de la consulta anterior, listar aquellos clientes que tengan mas de 5
-- pedidos registrados en el año 1998 y ordenados de forma ascendente por 
-- la cantidad de pedidos
SELECT C.IDCLIENTE,
       C.NOMBRECLI,
       COUNT(P.IDPEDIDO) AS CANT_PEDIDOS
FROM CLIENTES C INNER JOIN PEDIDOS P
    ON C.IDCLIENTE=P.IDCLIENTE
WHERE TO_CHAR(P.FECHA,'YYYY')='1998'
GROUP BY C.IDCLIENTE, C.NOMBRECLI
  HAVING COUNT(P.IDPEDIDO)>5
   ORDER BY CANT_PEDIDOS ASC;

-- de la consulta principal anterior, listar aquellos clientes que tengan 
-- mas de 5 pedidos registrados en el año 1998 y ordenados de forma 
-- descendente por la cantidad de pedidos
SELECT C.IDCLIENTE,
       C.NOMBRECLI,
       COUNT(P.IDPEDIDO) AS CANT_PEDIDOS
FROM CLIENTES C INNER JOIN PEDIDOS P
    ON C.IDCLIENTE=P.IDCLIENTE
WHERE EXTRACT(YEAR FROM P.FECHA)=1998
GROUP BY C.IDCLIENTE, C.NOMBRECLI
  HAVING COUNT(P.IDPEDIDO)>5
   ORDER BY CANT_PEDIDOS DESC;
