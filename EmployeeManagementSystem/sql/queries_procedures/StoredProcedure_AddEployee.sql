CREATE DEFINER=`root`@`localhost` PROCEDURE `AddEmployee`(
	IN p_first_name VARCHAR(45),
    IN p_last_name VARCHAR(45),
    IN p_salary FLOAT
)
BEGIN
	INSERT INTO employees(
		first_name, 
        last_name,
        salary,
        roles_id_role,
        departments_id_department)
    VALUES(p_first_name, p_last_name, p_salary, 3, 4);
END