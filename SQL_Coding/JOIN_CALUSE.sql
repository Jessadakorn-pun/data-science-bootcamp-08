-- inner join
SELECT
	A.artisid,
	A.name artisName,
	B.title albumName

FROM
	artists A,
	album B

WHERE
	A.artistid = B.artisid AND

SELECT
	A.artisid,
	A.name artisName,
	B.title albumName

FROM artists A
INNER JOIN	album B ON a.artistid = b.artistid


  

-- Cross Join
-- create two tables: ranks and suits
-- reference: https://www.sqlitetutorial.net/sqlite-cross-join/
CREATE TABLE ranks (
    rank TEXT NOT NULL
);

CREATE TABLE suits (
    suit TEXT NOT NULL
);

INSERT INTO ranks(rank) 
VALUES('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9'),('10'),('J'),('Q'),('K'),('A');

INSERT INTO suits(suit) 
VALUES('Clubs'),('Diamonds'),('Hearts'),('Spades');

SELECT *
FROM ranks;

SELECT *
FROM suits;

--cross join no.1 
SELECT *
FROM
	ranks,
    suits
order by 1 desc;

-- cross join no.2
SELECT *
FROM
	ranks
cross JOIN suits



--SELF JOIN
SELECT
	e1.name staff,
	e2.levle staff_level,
	e2.name manager_name,
	e2.levle manager_level
	e1.name || ' report to ' || e2.name as coment

FROM
	employee e1,
	employee e2

WHERE
	e1.id = e2.manager_id

  

-- INTERSECT
SELECT id FROM book_shop
INTERSECT
SELECT id FROM favorite_book
-- EXCEPT
SELECT id FROM book_shop
EXCEPT
SELECT id FROM favorite_book


-- UNION
SELECT * FROM book_shop
UNION 
SELECT * FROM book_shop_new
-- UNION ALL
SELECT * FROM book_shop
UNION ALL
SELECT * FROM book_shop_new


