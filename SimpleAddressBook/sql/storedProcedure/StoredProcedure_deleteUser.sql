CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUser`(
	IN p_user_id INT
)
BEGIN
	DELETE 
	FROM users
	WHERE id_user = p_user_id;
END