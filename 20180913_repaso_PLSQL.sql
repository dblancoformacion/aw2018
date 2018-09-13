/* 1) hacer una vista de las provincias de m�s de un mill�n de habitantes */

CREATE VIEW provinciotas AS
  SELECT * FROM provincias WHERE poblacion>1e6;
SELECT * FROM provinciotas;

/* 2) hacer un procedimiento que sume medio mill�n de habitantes a las provincias anteriores */

CREATE PROCEDURE sumapoblacion()
  BEGIN
    UPDATE provinciotas set poblacion=poblacion+5e5;   
  END;
CALL sumapoblacion();
SELECT * FROM provinciotas;
