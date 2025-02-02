CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCourse`(
	IN p_title VARCHAR(45)
)
BEGIN
	INSERT INTO courses(title)
    VALUES (p_title);
END