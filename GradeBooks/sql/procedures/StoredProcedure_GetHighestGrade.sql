CREATE DEFINER=`root`@`localhost` PROCEDURE `HighestGradeStudent`(
	IN p_id_course INT
)
BEGIN
	SELECT 
		s.first_name,
        s.last_name,
        shc.grade
    FROM students_has_courses shc
    JOIN students s
		ON s.id_student = shc.id_student
    WHERE shc.courses_id_course = p_id_course
    ORDER BY shc.grade DESC
    LIMIT 1;
END