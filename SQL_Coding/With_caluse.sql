-- FROM Sub query 
SELECT sub1.firstname, sub2.total
FROM (
  SELECT * FROM customers
  where country = 'USA'
) as sub1
join ( SELECT * FROM invoices
       where STRFTIME("%Y", invoicedate) = "2009"
) as sub2
on sub1.customerid = sub2.customerid

-- To With caluse (local table)
-- commond table expression -> WITH
WITH sub1 as (
  SELECT * FROM customers
  where country = 'USA'
), sub2 as ( SELECT * FROM invoices
       where STRFTIME("%Y", invoicedate) = "2009"
)

SELECT
	sub1.firstname,
  sub2.total
from sub1
JOIN sub2 on sub1.customerid = sub2.customerid

-- FROMAT
WITH sub1 as () sub2 as ()
SELECT *
FROM sub1
JOIN sub2 on sub1.pk = sub2.fk
