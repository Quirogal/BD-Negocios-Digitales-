--sp con pararametros de salida
create or alter proc sumadediez
 @valor int = 10  --Parametro de entrada 
as 
declare @resultado int = 0 --Declaracion de variable 

set @resultado = @valor +10 --Suma 
print('El resultado es:' +cast(@resultado as varchar(10)))

exec sumadediez
exec sumadediez @valor =30
--sp2
create or alter proc sumadediez2
@valor int, @resultado int output
as 
set @resultado = @valor +10
declare @result int 
exec sumadediez2 @valor =50, @resultado=@result output
print('El resultado es:' +cast(@result as varchar(10)))

--Realizar un sp que permita calculara una suma y una resta 
--Solicitando dos numeros y el reultado de la operacion 
--deben guardarlas en los parametros de salida correspondientes

CREATE PROCEDURE CalculoSumaResta
    @Numero1 INT,
    @Numero2 INT,
    @Suma INT OUT,
    @Resta INT OUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Calcula la suma de los dos números
    SET @Suma = @Numero1 + @Numero2;

    -- Calcula la resta de los dos números
    SET @Resta = @Numero1 - @Numero2;
END
DECLARE @Numero1 INT = 10;
DECLARE @Numero2 INT = 5;
DECLARE @ResultadoSuma INT;
DECLARE @ResultadoResta INT;

EXEC CalculoSumaResta @Numero1, @Numero2, @ResultadoSuma OUT, @ResultadoResta OUT;

PRINT 'La suma de ' + CAST(@Numero1 AS VARCHAR(10)) + ' y ' + CAST(@Numero2 AS VARCHAR(10)) + ' es: ' + CAST(@ResultadoSuma AS VARCHAR(10));
PRINT 'La resta de ' + CAST(@Numero1 AS VARCHAR(10)) + ' y ' + CAST(@Numero2 AS VARCHAR(10)) + ' es: ' + CAST(@ResultadoResta AS VARCHAR(10));