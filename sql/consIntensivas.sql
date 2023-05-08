-- Procedimiento almacenado que hace consultas SELECT intensivamente.

DELIMITER $$
DROP PROCEDURE IF EXISTS select_intensivo $$
CREATE PROCEDURE select_intensivo(IN cantidad INT)
BEGIN
  DECLARE contador INT;
  SET contador = 1;
  WHILE contador <= cantidad DO
        SELECT * FROM `wp_posts`;
    SET contador = contador + 1;
  END WHILE;
END
$$
DELIMITER ;

-- Llama al procedimiento almacenado, ingrese la cantidad de veces a consultar en el argumento de la funcion.
CALL select_intensivo(100);


-- Procedimiento almacenado que inserta un producto cierta cantidad de veces.
DELIMITER $$
DROP PROCEDURE IF EXISTS insert_intensivo $$
CREATE PROCEDURE insert_intensivo(IN cantidad INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    WHILE contador <= cantidad DO
        INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES (NULL, '1', '2022-12-03 01:27:53', '2022-12-03 05:27:53', 'producto', 'producto', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-logo', '', '', '2022-12-03 01:28:26', '2022-12-03 05:28:26', '', '0', 'http://localhost/wordpress/producto/hoodie-with-logo/', '0', 'product', '', '0');
        SET contador = contador + 1;
    END WHILE;
END
$$
DELIMITER ;

-- Llama al procedimiento almacenado, ingrese la cantidad de veces a generar en el argumento de la funcion.
CALL insert_intensivo(100);