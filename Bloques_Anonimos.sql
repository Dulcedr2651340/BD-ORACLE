-- PL / SQL
-- Programing Language / SQL
-- BLOQUES
-- ANONIMO:No tiene nombre. No se almacena en la BD.

-- NOMINAL:Si tiene nombre. Se almacenan en la BD.

-- Sintaxis Bloque Anonimo:
DECLARE
  -- zona para declarar variables, constantes, excepciones de usuario y
  -- cursores
BEGIN
   -- Logica a realizar (INSTRUCCIONES_SQL, ESTRUCTURAS DE CONTROL, ETC)
   [exception
        WHEN nombre_excepcion THEN ......
    ]
END;

-- Declaracion de variables y/o constante
--   :=  Asignar
   nom_variable   [CONSTANT] tipo_dato [:= valor] ;
   
-- Imprimir resultados por pantalla
   dbms_output.put_line('texto');
   
-- Para que ORACLE permita la impresion por pantalla debemos:
-- set serveroutput on;

-- ejemplos:

set serveroutput on;
declare 
   nombre varchar2(20):='Juan Perez';
   edad   number(2);
begin
   edad:=21;
   
   DBMS_OUTPUT.put_line('Nombre: '||nombre);
   DBMS_OUTPUT.put_line('Edad: '||edad);
end;

-- ejemplo 2
SELECT * FROM CLIENTES;

SELECT IDCLIENTE, NOMBRECLI ||' - '||CIUDAD ||' - '||TELEFONO as DATOS_CLIENTE 
FROM CLIENTES WHERE IDCLIENTE='ALFKI';

declare
  codigo char(5):='ALFKI';
  datos varchar2(50);
begin
  --codigo:='ALFKI';
  SELECT IDCLIENTE, NOMBRECLI ||' - '||CIUDAD ||' - '||TELEFONO as DATOS_CLIENTE
      INTO codigo, datos
    FROM CLIENTES WHERE IDCLIENTE=codigo;

  DBMS_OUTPUT.put_line('Codigo Cliente: '||codigo);    
  DBMS_OUTPUT.put_line('Datos del Cliente: '||datos);    
end;

-- Variable de Sustitucion
-- Numeros
    &texto_descriptivo
-- Cadenas
    '&texto_descriptivo'
    

declare
  codigo char(5):='&Ingrese_Codigo';
  nombre varchar2(50);
  telefono varchar2(25);
begin
  SELECT NOMBRECLI, TELEFONO
      INTO nombre, telefono
    FROM CLIENTES WHERE IDCLIENTE=codigo;

  DBMS_OUTPUT.put_line('Codigo Cliente: '||codigo);    
  DBMS_OUTPUT.put_line('Nombre del Cliente: '||nombre);    
  DBMS_OUTPUT.put_line('Telefono del Cliente: '||telefono);    
end;


declare
  codigo char(5);
  nombre varchar2(50);
  telefono varchar2(25);
begin
  codigo:='&Ingrese_Codigo';
  SELECT NOMBRECLI, TELEFONO
      INTO nombre, telefono
    FROM CLIENTES WHERE IDCLIENTE=codigo;

  DBMS_OUTPUT.put_line('Codigo Cliente: '||codigo);    
  DBMS_OUTPUT.put_line('Nombre del Cliente: '||nombre);    
  DBMS_OUTPUT.put_line('Telefono del Cliente: '||telefono);    
end;


select * from categorias;

declare
    xcodcat number(1):=&Codigo_Categoria;
    xnomcat varchar2(20):='&Nombre_Categoria';
begin
  insert into categorias values(xcodcat, xnomcat);
  commit; -- confirma las operaciones DML que afectan a las filas
  
  DBMS_OUTPUT.PUT_LINE('Nueva Categoria grabada correctamente');
end;

select * from categorias;

