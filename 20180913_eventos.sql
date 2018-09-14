CREATE TABLE instantes(
  id_instante int AUTO_INCREMENT,
  instante datetime,
  PRIMARY KEY(id_instante)
  );
SELECT * FROM instantes;
INSERT INTO instantes (instante) VALUES (NOW());

CREATE EVENT rellenador
  ON SCHEDULE EVERY 10 SECOND
  DO
    INSERT INTO instantes (instante) VALUES (NOW());