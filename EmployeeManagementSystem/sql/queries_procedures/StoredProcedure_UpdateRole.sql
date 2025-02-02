CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateRole`(
	IN p_id_employee INT,
    IN p_id_role INT
)
BEGIN
	UPDATE employees
    SET roles_id_role = p_id_role
    WHERE id_employee = p_id_employee;
END