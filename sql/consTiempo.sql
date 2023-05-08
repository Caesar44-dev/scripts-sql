
SET GLOBAL event_scheduler = ON; -- Establece el valor de event_scheduler en activo para que se pueda ejecutar los EVENT.

SHOW PROCESSLIST; -- Muestra estado de event_scheduler.

DROP EVENT name; -- Elimina el evento. (cambiar name por el nombre del evento).


-- Eventos recurrentes. Comienzan desde CURRENT_TIMESTAMP (tiempo actual), se ejecutan cada segundo y expiran despues de 10 minutos.

-- Hace un consulta cada segundo a la tabla wp_posts por 10 minutos.
DELIMITER $$
CREATE EVENT select_event
ON SCHEDULE EVERY 1 SECOND
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 10 MINUTE
DO
    SELECT * FROM `wp_posts`;
$$
DELIMITER ;

-- Hace un insert cada segundo a la tabla wp_posts por 10 minutos.
DELIMITER $$
CREATE EVENT insert_event
ON SCHEDULE EVERY 1 SECOND
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 10 MINUTE
DO
    INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES (NULL, '1', '2022-12-03 01:27:53', '2022-12-03 05:27:53', 'producto', 'producto', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-logo', '', '', '2022-12-03 01:28:26', '2022-12-03 05:28:26', '', '0', 'http://localhost/wordpress/producto/hoodie-with-logo/', '0', 'product', '', '0');
$$
DELIMITER ;


-- Hace un consulta cada segundo a la tabla wp_posts por 10 minutos pero 5 veces al mismo tiempo.
DELIMITER $$
CREATE EVENT select_event
ON SCHEDULE EVERY 1 SECOND
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 10 MINUTE
DO BEGIN
    SELECT * FROM `wp_posts`;
    SELECT * FROM `wp_posts`;
    SELECT * FROM `wp_posts`;
    SELECT * FROM `wp_posts`;
    SELECT * FROM `wp_posts`;
END
$$
DELIMITER ;

-- Hace un insert cada segundo a la tabla wp_posts por 10 minutos pero 5 veces al mismo tiempo.
DELIMITER $$
CREATE EVENT insert_event
ON SCHEDULE EVERY 1 SECOND
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 10 MINUTE
DO BEGIN
    INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES (NULL, '1', '2022-12-03 01:27:53', '2022-12-03 05:27:53', 'producto', 'producto', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-logo', '', '', '2022-12-03 01:28:26', '2022-12-03 05:28:26', '', '0', 'http://localhost/wordpress/producto/hoodie-with-logo/', '0', 'product', '', '0');
    INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES (NULL, '1', '2022-12-03 01:27:53', '2022-12-03 05:27:53', 'producto', 'producto', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-logo', '', '', '2022-12-03 01:28:26', '2022-12-03 05:28:26', '', '0', 'http://localhost/wordpress/producto/hoodie-with-logo/', '0', 'product', '', '0');
    INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES (NULL, '1', '2022-12-03 01:27:53', '2022-12-03 05:27:53', 'producto', 'producto', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-logo', '', '', '2022-12-03 01:28:26', '2022-12-03 05:28:26', '', '0', 'http://localhost/wordpress/producto/hoodie-with-logo/', '0', 'product', '', '0');
    INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES (NULL, '1', '2022-12-03 01:27:53', '2022-12-03 05:27:53', 'producto', 'producto', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-logo', '', '', '2022-12-03 01:28:26', '2022-12-03 05:28:26', '', '0', 'http://localhost/wordpress/producto/hoodie-with-logo/', '0', 'product', '', '0');
    INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES (NULL, '1', '2022-12-03 01:27:53', '2022-12-03 05:27:53', 'producto', 'producto', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-logo', '', '', '2022-12-03 01:28:26', '2022-12-03 05:28:26', '', '0', 'http://localhost/wordpress/producto/hoodie-with-logo/', '0', 'product', '', '0');
END
$$
DELIMITER ;