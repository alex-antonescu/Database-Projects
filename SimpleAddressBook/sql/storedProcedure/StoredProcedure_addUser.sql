DELIMITER $$

CREATE PROCEDURE AddUser(
	IN p_first_name VARCHAR(45),
	IN p_last_name VARCHAR(45),
	IN p_phone_number VARCHAR(45),
	IN p_email_address VARCHAR(45)
)

BEGIN 
	INSERT INTO users(first_name, last_name, phone_number, email_address)
    VALUES (p_first_name, p_last_name, p_phone_number, p_email_address);
END$$

DELIMITER ;