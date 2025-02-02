CREATE DEFINER=`root`@`localhost` PROCEDURE `EnrollStudent`(
	IN p_id_student INT,
	IN p_id_course	INT,
	IN p_grade INT
)
BEGIN
	INSERT INTO students_has_courses
    VALUES (p_id_student, p_id_course, p_grade);
END