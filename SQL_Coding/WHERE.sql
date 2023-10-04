-- AND OR NOT
SELECT *
FROM customers
WHERE
	NOT(country = 'USA' OR
    country = 'CA' OR 
    country = 'France')

-- in  
SELECT *
FROM customers
WHERE
 country in ('Brazil', 'Germany', 'Norway')

-- BETWEEN
SELECT *
FROM customers
WHERE
	customerid BETWEEN 5 AND 10

SELECT *
FROM invoices
WHERE
	invoicedate BETWEEN '2009-01-01 00:00:00' AND '2009-01-31 00:00:00'


-- NULL VALUE
SELECT *
FROM customers
WHERE
	company IS NOT NULL

-- DEALING WITH NULL VALUE 
SELECT 
	company,
	COALESCE(company , "End Customer") AS 'Company Clean'
From customers

SELECT
	company,
	CASE
		WHEN company IS NULL THEN 'End Customer'
		ELSE 'Coperate'
	END AS 'Company Clean'
FROM customers

-- PATTERN MATCHING
SELECT *
FROM customers
WHERE 
	email LIKE '%@gmail.com'

SELECT *
FROM customer
WHERE 
	firstname LIKE "J_hn"

