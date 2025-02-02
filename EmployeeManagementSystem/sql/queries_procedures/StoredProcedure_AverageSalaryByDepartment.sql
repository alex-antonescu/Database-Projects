CREATE DEFINER=`root`@`localhost` PROCEDURE `AverageSalaryByDepartment`(
	IN p_id_department INT
)
BEGIN
	SELECT 
		d.name,
        AVG(e.salary) AS avg_salary
    FROM employees e 
    JOIN departments d
		ON e.departments_id_department = d.id_department
	JOIN roles r
		ON e.roles_id_role = r.id_role
	WHERE d.id_department = p_id_department
    GROUP BY d.id_department;
END