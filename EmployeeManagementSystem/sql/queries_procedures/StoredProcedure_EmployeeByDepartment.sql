CREATE DEFINER=`root`@`localhost` PROCEDURE `EmployeeByDepartment`(
	IN p_name VARCHAR(45)
)
BEGIN
	SELECT *
    FROM employees e
    JOIN departments d
		ON e.departments_id_department = d.id_department
	WHERE p_name = d.name;
END