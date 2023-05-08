-- Active: 1670045441601@@127.0.0.1@3306@scripts
CREATE TABLE `products`(
`id` int NOT NULL AUTO_INCREMENT,
`nombre` varchar(250) NULL,
`precio` varchar(15) NULL,
PRIMARY KEY(`id`)
)

-- ////////////////////////////// generate products ///////////////////////////////

DELIMITER $$
DROP PROCEDURE IF EXISTS generateProduct $$
CREATE PROCEDURE generateProduct(IN cantidad INT)
BEGIN
  DECLARE contador INT;
  SET contador = 1;
  WHILE contador <= cantidad DO

    INSERT INTO products (nombre, precio) VALUES ('producto', '55$');

    SET contador = contador + 1;
  END WHILE;
END
$$
DELIMITER ;

CALL generateProduct(100);

-- //////////////////////////////  fetch data ///////////////////////////////

DELIMITER $$
DROP PROCEDURE IF EXISTS fetchData $$
CREATE PROCEDURE fetchData(IN cantidad INT)
BEGIN
  DECLARE contador INT;
  SET contador = 1;
  WHILE contador <= cantidad DO
        SELECT * FROM `products`;
    SET contador = contador + 1;
  END WHILE;
END
$$
DELIMITER ;

CALL fetchData(10000);

-- //////////////////////////////  set event ///////////////////////////////

SET GLOBAL event_scheduler = ON;

SHOW PROCESSLIST;

SHOW EVENTS FROM classicmodels;

DROP EVENT RECURRING_EVENT;

-- //////////////////////////////  events ///////////////////////////////
Evento Recurrente

DELIMITER $$
CREATE EVENT RECURRING_EVENT
ON SCHEDULE EVERY 1 SECOND
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
    INSERT INTO products (nombre, precio) VALUES ('producto', '55$');
$$
DELIMITER ;


DELIMITER $$
CREATE EVENT RECURRING_EVENT
ON SCHEDULE EVERY 1 SECOND
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO BEGIN
    INSERT INTO products (nombre, precio) VALUES ('producto', '55$');
    SELECT * FROM `products`;
END 
$$
DELIMITER ;

DELIMITER $$
CREATE EVENT RECURRING_EVENT
ON SCHEDULE EVERY 1 SECOND
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO BEGIN
    INSERT INTO products (nombre, precio) VALUES ('producto', '55$');
    INSERT INTO products (nombre, precio) VALUES ('producto', '55$');
    INSERT INTO products (nombre, precio) VALUES ('producto', '55$');
    SELECT * FROM `products`;
END
$$
DELIMITER ;