create database VentasIDAT
Use VentasIDAT
go
Create table Medicos(
med_cod char(5) Primary key Not null,
med_nom varchar(50) not null,
med_esp varchar(50) not null,
med_fechaing datetime not null,
med_sexo varchar(20) not null,
med_foto image not null
)
go
Create proc usp_listarmedicos
As
Select * from medicos
go
Create proc usp_buscarmedico
@codigo char(5)
As
Select * from medicos where med_cod=@codigo
go
Create proc usp_registrarMedico
@nombre varchar(50),@esp varchar(50),@fechaing datetime,@sexo varchar(20),@foto image
As
Declare @codigo char(5)  --M0000
Set @codigo=(Select max(med_cod) from Medicos)
Set @codigo='M'+right('0000'+ltrim(right(isnull(@codigo,'0000'),4)+1),4)
Insert into Medicos values(@codigo,@nombre,@esp,@fechaing,@sexo,@foto)
Select @codigo
go
Select * from Medicos