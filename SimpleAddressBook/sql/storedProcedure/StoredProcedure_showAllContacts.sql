CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowAllContacts`()
BEGIN
	SELECT * FROM users;
END