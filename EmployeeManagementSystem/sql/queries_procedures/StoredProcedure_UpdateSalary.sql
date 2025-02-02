CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateSalary`(
	IN p_id INT,
    IN p_salary FLOAT
)
BEGIN
	UPDATE employees
    SET salary = p_salary
    WHERE id_employee = p_id;
END