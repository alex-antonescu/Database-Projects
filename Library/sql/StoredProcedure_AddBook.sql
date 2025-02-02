CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBook`(
	IN p_title VARCHAR(45)
)
BEGIN
	INSERT INTO books(title, isAvailable)
    VALUES (p_title,1);
END