CREATE DEFINER=`root`@`localhost` FUNCTION `BorrowingCount`() RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE borrow_count INT;
    
	SELECT COUNT(*) INTO borrow_count
    FROM users_borrows_books u
    WHERE u.borrow_date IS NOT NULL;
RETURN borrow_count;
END