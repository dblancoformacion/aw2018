USE provincias;

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

/* 3) hacer una funci�n que calcule los habitantes de una comunidad aut�noma facilitada por el usuario a trav�s de un par�metro de entrada */



SELECT SUM(poblacion)
  FROM provincias WHERE autonomia='Galicia';
DROP FUNCTION sumaautonomia;
CREATE FUNCTION sumaautonomia(vautonomia varchar(255))
  RETURNS int
  BEGIN
   RETURN (
    SELECT SUM(poblacion)
      FROM provincias WHERE autonomia=vautonomia    
    );
  END;
SELECT sumaautonomia('Andalucia');

/* 4) hacer un disparador que guarde las contrase�as cifradas */

SELECT MD5('');
CREATE TABLE usuarios(
  id_usuario int AUTO_INCREMENT,
  login varchar(127),
  passwd varchar(255),
  PRIMARY KEY(id_usuario),
  UNIQUE(login)
  );
INSERT INTO usuarios (login, passwd) VALUES ('Rub�n','hola');
UPDATE usuarios set passwd='hola' WHERE id_usuario=1;
SELECT * FROM usuarios;
CREATE TRIGGER cifrador
  BEFORE INSERT
  ON usuarios FOR EACH ROW
  BEGIN
    SET new.passwd=MD5(new.passwd);
  END;
CREATE TRIGGER cifrador2
  BEFORE UPDATE
  ON usuarios FOR EACH ROW
  BEGIN
    SET new.passwd=MD5(new.passwd);
  END;




/*
4) hacer un disparador que guarde las contrase�as cifradas

5) hacer un evento que cada minuto guarde el instante en el que se ha dado ese registro de alta
  */