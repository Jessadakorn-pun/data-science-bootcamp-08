## Drop table
DROP TABLE table_name ;

## Create Table
CREATE TABLE table_name (
	column_1 TEXT UNIQUE,
	column_2 INT,
	column_3 REAL,
	....
);

## INSERT
INSERT INTO table_name
	('A', 5, 3),
	('B', 2, 7),
	(...);

/*INSERT INTO employee VALUES
	(1,'David','Marketing','CEO',100000),
    (2,'John','Marketing','VP', 85000    ),
    (3,'Marry','Sales','Manager', 60000); */
    
INSERT INTO employee VALUES
	(4, 'Harry', 'IT', 'Senior Manager', 88000)
    (5, 'Walker', 'IT' , 'Manager')

## SELECT
SELECT Column_1, Column_2, Column_3, ....

FROM table_name

LIMIT 3 ;

## INSERT CALCULATED COLUMN USING SELECT
SELECT
	name,
	salary,
	salary * 1.15 AS new_salary -- make a new salary column
	UPPER(name) || '@gmail.com' AS company_email -- make a new company email column

## WHERE
SELECT *
FROM employee
Where
	Department IN ('Martketing', 'IT') ;

## UPDATE
UPDATE employee
SET 
	salary = 90000
WHERE
	id = 1 ;

FROM employee ;


## DELETE
DELETE FROM employee
Where
	id in (1,2,3,....)

DELETE FROM employee

## ALTER TABLE
ALTER TABLE employee RENAME TO MyEmployee;

## BACKUP TABLE
ALTER TABLE employee RENAME TO MyEmployee;


