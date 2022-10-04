SELECT * FROM CLIENTES;
SELECT * FROM CUENTAS;
SELECT * FROM MOVIMIENTOS;
SELECT * FROM TIPO_CUENTAS;

--1.- Crear un bloque nombre del cliente PLSQL que de acuerdo a un código de cliente muestre por pantalla: 
 -- El nombre del cliente 
-- El teléfono 
-- La cantidad de números de cuentas perteneciente al Cliente 

DECLARE
  CODCLI CHAR(5)= '&INGRESECODIGO';
  NOMCLI VARCHAR2(50);
  TELF CHAR(7);
  CANTCUENTAS NUMBER;
BEGIN
    CODCLI:='C0001';
    SELECT C.CLI_CODIGO, C.CLI_NOMBRE, C.CLI_TELEFONO, COUNT(CN.NUM_CTA) INTO CODCLI, NOMCLI, TELF, CANTCUENTAS 
    FROM CLIENTES C INNER JOIN CUENTAS CN
    ON C.CLI_CODIGO = C.CLI_CODIGO;
    GROUP BY C.CLI_CODIGO, C.CLI_NOMBRE, C.CLI_TELEFONO
    HAVING C.CLI_CODIGO = CODCLI;
       
     DBMS_OUTPUT.PUT_LINE('CODIGO: '||CODCLIENTE);
     DBMS_OUTPUT.PUT_LINE('NOMBRE: '||NOMCLIENTE);
     DBMS_OUTPUT.PUT_LINE('TELEFONO: '||TELEFONO);
     DBMS_OUTPUT.PUT_LINE('CANTIDAD CUENTAS: '||CANTCUENTAS);    
    EXCEPTION WHEN VALUE_ERROR THEN
	DBMS_OUTPUT.PUT.LINE('ERROR!! EL CODIGO DE CLIENTE NO ES VALIDO');
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT.LINE('VALOR INCORRECTO');
END;

--EJERCICIO 2
--Crear un bloque PLSQL que de acuerdo a un código de tipo de cuenta muestre por pantalla: 
--La descripción de un tipo de cuenta perteneciente al código del tipo de cuenta enviado. 
--La cantidad de clientes que posean una cuenta perteneciente a este codigo de tipo de cuenta enviado. 
--La suma de los saldos que posean las cuentas pertenecientes a este codigo de tipo de cuenta enviado.


DECLARE
CODCUENTA CHAR(5)= '&INGRESECODIGO';
DESCUENTO CHAR(50);
CANTCLI NUMBER;
SUMSALDOS NUMBER(8,3);
BEGIN
    CODCUENTA:='C0001';
    SELECT DESCUENTO_CTA INTO DESCUENTO FROM TIPOCUENTAS WHERE COD_CTA = CODCUENTA;
    SELECT COUNT(CLI_CODIGO) INTO CANTCLIENTES FROM CUENTAS WHERE COD_CTA = CODCUENTA;
    SELECT SUM(SALDO) INTO SALDOS FROM CUENTAS WHERE COD_CTA = CODCUENTA;
   
    DBMS_OUTPUT.PUT_LINE('CODIGO: '||CODCUENTA);
    DBMS_OUTPUT.PUT_LINE('DESCRIPCION DE TIPO DE CUENTA: '||DESCUENTO);
    DBMS_OUTPUT.PUT_LINE('CANTIDAD CLIENTES DE TIPO DE CUENTA: '||CANTCLIENTES);
    DBMS_OUTPUT.PUT_LINE('SUMA DE SALDOS: '||SUMSALDOS);
   
    EXCEPTION WHEN VALUE_ERROR THEN
      DBMS_OUTPUT.PUT_LINE('ERROR!! EL CODIGO DE CLIENTE NO ES VALIDO')
      WHEN OTHERS THEN
      DBMS_OUTPUT.PUT.LINE('VALOR INCORRECTO');
END;

--3.- Liste el numero de cuenta, fecha del movimiento, el nombre del cliente de acuerdo a un año 
--y un numero de mes. Utilice las tablas Movimientos, Cuentas y Clientes. 



--4.- Liste el nombre del Cliente, la descripcion del tipo de cuenta y la cantidad de movimientos 
--realizados de tipo Depósito, ordenados por la cantidad de 
--movimientos, visualizando solo a aquellos clientes y descripción de cuenta que tengan una cantidad de operaciones mayor a 15.

SELECT C.CLI_NOMBRE, TD.DESC_CTA, COUNT(TIP_MOV) AS CANTIDAD_MOV
FROM CLIENTES CL INNER JOIN CUENTAS CU
    ON C.CLI_CODIGO = C.CLI_CODIGO
    INNER JOIN MOVIMIENTOS MV
    ON MV.NUM_CTA= C.NUM_CTA CN
    INNER JOIN TIPO_CUENTAS TC
    ON TC.COD_CTA = CT.COD_CTA
GROUP BY CL.CLI_NOMBRE, T.DESC_CTA
    HAVING COUNT(MV.TIP_MOV)>15 
    ORDER BY C.CLI_NOMBRE ASC;


