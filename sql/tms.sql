-- Procedimiento almacenado que hace consultas SELECT intensivamente.
DELIMITER $$
DROP PROCEDURE IF EXISTS select_intensivo $$
CREATE PROCEDURE select_intensivo(IN cantidad INT, OUT total INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    SET total = 0;
    WHILE contador <= cantidad DO
        SELECT * FROM `wp_posts`;
        SET contador = contador + 1;
        SET total = total + 1;
    END WHILE;
END
$$
DELIMITER ;


-- Llama al procedimiento almacenado, ingrese la cantidad de veces a consultar en el argumento de la funcion.
CALL select_intensivo(10, @total);
SELECT @total;