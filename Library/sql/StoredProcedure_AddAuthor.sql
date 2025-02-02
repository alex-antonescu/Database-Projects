CREATE DEFINER=`root`@`localhost` PROCEDURE `AddAuthor`(
	IN p_first_name VARCHAR(45),
    IN p_last_name VARCHAR(45)
)
BEGIN
	INSERT INTO authors(first_name, last_name)
    VALUES (p_first_name, p_last_name);
END