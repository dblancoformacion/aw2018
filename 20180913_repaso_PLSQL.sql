/* 1) hacer una vista de las provincias de más de un millón de habitantes */

CREATE VIEW provinciotas AS
  SELECT * FROM provincias WHERE poblacion>1e6;
SELECT * FROM provinciotas;

/* 2) hacer un procedimiento que sume medio millón de habitantes a las provincias anteriores */

CREATE PROCEDURE sumapoblacion()
  BEGIN
    UPDATE provinciotas set poblacion=poblacion+5e5;   
  END;
CALL sumapoblacion();
SELECT * FROM provinciotas;

/* 3) hacer una función que calcule los habitantes de una comunidad autónoma facilitada por el usuario a través de un parámetro de entrada */

SELECT SUM(poblacion)
  FROM provincias WHERE autonomia='Galicia';

SELECT sumaautonomia('Galicia');