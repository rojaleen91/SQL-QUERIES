CREATE DATABASE testDB;

/*...create table....*/

CREATE TABLE CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);
/*...Insert query....*/

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (3, 'kaushik', 23, 'Kota', 2000.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (6, 'Komal', 22, 'MP', 4500.00 );

/*...select query with where condition....*/

SELECT * FROM CUSTOMERS;
SELECT ID, NAME, SALARY 
FROM CUSTOMERS
WHERE SALARY > 2000;
SELECT ID, NAME, SALARY 
FROM CUSTOMERS
WHERE NAME = 'Hardik';
SELECT ID, NAME, SALARY 
FROM CUSTOMERS
WHERE SALARY > 2000 AND age < 25;
SELECT ID, NAME, SALARY 
FROM CUSTOMERS
WHERE SALARY > 2000 OR age < 25;

/*...update query....*/

UPDATE CUSTOMERS
SET ADDRESS = 'Pune'
WHERE ID = 6;
DELETE FROM CUSTOMERS
WHERE ID = 6;

/*...wildcard operator like....*/

SELECT * FROM CUSTOMERS 
WHERE SALARY LIKE '200%';
SELECT * FROM CUSTOMERS
WHERE SALARY LIKE '_%_%0%0';
SELECT * FROM CUSTOMERS
WHERE SALARY LIKE '2%_%_0';
SELECT * FROM CUSTOMERS
WHERE SALARY LIKE '2___3';
SELECT TOP 3 * FROM CUSTOMERS;
SELECT * FROM CUSTOMERS;

/*...order by....*/

SELECT * FROM CUSTOMERS 
ORDER BY NAME;
SELECT * FROM CUSTOMERS 
ORDER BY NAME, SALARY;

/*...group by....*/

SELECT NAME, SUM(SALARY) FROM CUSTOMERS
GROUP BY NAME;
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (6, 'Chaitali', 22, 'MP', 4500.00 );
SELECT NAME, SUM(SALARY) FROM CUSTOMERS
GROUP BY NAME;
SELECT NAME,SUM(SALARY) FROM CUSTOMERS
WHERE SALARY>6000
GROUP BY NAME
ORDER BY NAME DESC;

/*...distinct....*/

SELECT DISTINCT SALARY FROM CUSTOMERS
ORDER BY SALARY;
CREATE TABLE ORDERS(
OID INT   NOT NULL,
DATE DATETIME,
CUSTOMER_ID INT,
AMOUNT INT
);
INSERT INTO ORDERS(
OID,DATE,CUSTOMER_ID,AMOUNT)
VALUES(
102 ,2009-10-08,3,3000);
INSERT INTO ORDERS(
OID,DATE,CUSTOMER_ID,AMOUNT)
VALUES(
100  ,2009-10-08,3,1500);
INSERT INTO ORDERS(
OID,DATE,CUSTOMER_ID,AMOUNT)
VALUES(
101 ,2009-11-20,2,1560);
INSERT INTO ORDERS(
OID,DATE,CUSTOMER_ID,AMOUNT)
VALUES(
103 ,2008-05-20,4,2060);
SELECT * FROM ORDERS;
SELECT ID, NAME, AGE, AMOUNT
FROM CUSTOMERS, ORDERS
WHERE  CUSTOMERS.ID = ORDERS.CUSTOMER_ID;

/*...LEFT JOIN....*/

SELECT  ID, NAME, AMOUNT, DATE
FROM CUSTOMERS
LEFT JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;

/*...RIGHT JOIN....*/

SELECT  ID, NAME, AMOUNT, DATE
FROM CUSTOMERS
RIGHT JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;

/*...TABLE ALIAS AND COLUMN ALIAS....*/
SELECT C.ID, C.NAME, C.AGE, O.AMOUNT 
   FROM CUSTOMERS AS C, ORDERS AS O
   WHERE  C.ID = O.CUSTOMER_ID;
   SELECT  ID AS CUSTOMER_ID, NAME AS CUSTOMER_NAME
   FROM CUSTOMERS
   WHERE SALARY IS NOT NULL;

   /*...HAVING....*/

SELECT ID
FROM CUSTOMERS
GROUP BY ID
HAVING ID >= 2;

  /*...2ND HIGHEST SALARY....*/

SELECT * FROM CUSTOMERS;
SELECT MAX(SALARY) FROM CUSTOMERS
WHERE SALARY < (
SELECT MAX(SALARY) FROM CUSTOMERS);

 /*...2ND HIGHEST SALARY USING TABLE ALIAS....*/

SELECT * FROM CUSTOMERS CUST1
WHERE (2)=
(SELECT COUNT (DISTINCT (CUST2.SALARY))
FROM CUSTOMERS CUST2
WHERE CUST1.SALARY>=CUST2.SALARY);

