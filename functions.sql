CREATE DATABASE internship;
USE internship;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Alice', 50000, 'HR'),
(2, 'Bob', 70000, 'IT'),
(3, 'Charlie', 60000, 'Finance');


-- DELIMITER //

CREATE PROCEDURE UpdateSalary(
    IN empID INT,
    IN newSalary DECIMAL(10,2)
)
BEGIN
    UPDATE employees
    SET salary = newSalary
    WHERE emp_id = empID
END //

DELIMITER ;

CALL UpdateSalary(2, 80000);
 
-- write a function that returns the salary of an employee.
DELIMITER //

CREATE FUNCTION GetSalary(empID INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE sal DECIMAL(10,2);
    SELECT salary INTO sal FROM employees WHERE emp_id = empID;
    RETURN sal;
END //

DELIMITER ;

SELECT GetSalary(2) AS salary;

