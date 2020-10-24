CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 SELECT *
 FROM Worker;
 
SELECT *
FROM bonus;
 
SELECT *
FROM title;

/* Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>. */

SELECT FIRST_NAME as WORKER_NAME
FROM worker;

/* Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case */

SELECT upper(FIRST_NAME) 
FROM worker ;

/* Write an SQL query to fetch unique values of DEPARTMENT from Worker table */

SELECT distinct DEPARTMENT 
FROM worker ;

/* Write an SQL query to print the first three characters of FIRST_NAME from Worker table. */

SELECT SUBSTRING(FIRST_NAME, 1, 3) AS ExtractString
FROM worker ;

/* Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table. */

SELECT POSITION("a" IN FIRST_NAME)
FROM Worker
WHERE FIRST_NAME="Amitabh";

/* Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side. */

SELECT RTRIM(FIRST_NAME) as First_Name
FROM Worker;

/*Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.*/

SELECT LTRIM(DEPARTMENT) as Department
FROM Worker;

/* Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length. */

SELECT distinct length(DEPARTMENT) as Department_lenght
FROM Worker;

/* Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’. */

SELECT REPLACE(FIRST_NAME, 'a', 'A') as First_Name_Replace
FROM Worker;

/* Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them. */

SELECT  CONCAT(FIRST_NAME , ' ' , LAST_NAME)  as COMPLETE_NAME
FROM Worker;

/* Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.*/

SELECT *
FROM Worker
ORDER BY FIRST_NAME ASC;

/* Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. */

SELECT *
FROM Worker
ORDER BY FIRST_NAME ASC , DEPARTMENT desc;

/*Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.*/

SELECT *
FROM Worker
WHERE FIRST_NAME in ('Vipul' , 'Satish') ;

/* Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table. */

SELECT *
FROM Worker
WHERE FIRST_NAME NOT in ('Vipul' , 'Satish') ;

/* Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”. */

SELECT *
FROM Worker
WHERE DEPARTMENT like 'Admin%' ;

/* Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’. */

SELECT *
FROM Worker
WHERE FIRST_NAME like '%a%' ;

/* Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’. */

SELECT *
FROM Worker
WHERE FIRST_NAME like '%a' ;

/* Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. */

SELECT *
FROM Worker
WHERE FIRST_NAME like '%h' AND length(FIRST_NAME)=6;

/* Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000. */

SELECT *
FROM Worker
WHERE SALARY between 100000 and 500000 ;

/*Write an SQL query to print details of the Workers who have joined in Feb’2014.*/

SELECT *
FROM Worker
WHERE JOINING_DATE BETWEEN  '2014-01-31' AND '2014-03-01'; 

/* Write an SQL query to fetch the count of employees working in the department ‘Admin’. */

SELECT COUNT(FIRST_NAME) 
FROM Worker
WHERE DEPARTMENT like 'Admin'; 

/* Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000. */

SELECT FIRST_NAME , salary
FROM Worker
WHERE salary between 50000 and 100000; 

/*Write an SQL query to fetch the no. of workers for each department in the descending order.*/

SELECT COUNT(WORKER_ID) as 'no_of_workers' , DEPARTMENT
FROM Worker
group by DEPARTMENT
order by no_of_workers desc; 

/* Write an SQL query to print details of the Workers who are also Managers. */
          
SELECT FIRST_NAME , WORKER_TITLE
FROM Worker
INNER JOIN title
ON Worker.WORKER_ID = title.WORKER_REF_ID
WHERE WORKER_TITLE='manager';

/* Write an SQL query to fetch duplicate records having matching data in some fields of a table. */

SELECT * 
FROM title
INNER JOIN(
SELECT WORKER_TITLE, AFFECTED_FROM 
FROM title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1) b
on title.WORKER_TITLE = b.WORKER_TITLE;

/*Write an SQL query to show only odd rows from a table.*/

SELECT * 
FROM Worker 
WHERE MOD (WORKER_ID, 2) <> 0;

/*  Write an SQL query to show only even rows from a table. */

SELECT * 
FROM Worker 
WHERE MOD (WORKER_ID, 2) = 0;

/* Write an SQL query to clone a new table from another table. */

CREATE TABLE new_worker LIKE worker;
 
INSERT INTO new_worker SELECT * FROM worker;

/* Write an SQL query to fetch intersecting records of two tables. */

SELECT *
FROM worker
UNION
SELECT *
FROM new_worker;

/* Write an SQL query to show records from one table that another table does not have. */

SELECT w.*
FROM worker w
LEFT JOIN bonus b
ON w.WORKER_ID = b.WORKER_REF_ID
WHERE b.WORKER_REF_ID IS NULL;

/* Write an SQL query to show the current date and time. */

SELECT CURRENT_TIMESTAMP();

/* Write an SQL query to show the top n (say 3) records of a table. */

SELECT *
FROM worker
ORDER BY WORKER_ID asc
LIMIT 3;

/* Write an SQL query to determine the nth (say n=5) highest salary from a table. */

SELECT FIRST_NAME, salary
FROM worker
ORDER BY salary desc
LIMIT 5;

/* Write an SQL query to determine the 5th highest salary without using TOP or limit method. */

SELECT FIRST_NAME, salary
FROM (
SELECT FIRST_NAME, salary,
ROW_NUMBER() OVER (ORDER BY salary desc) AS ROWNUM
FROM worker
) T
WHERE ROWNUM <6;

/* Write an SQL query to fetch the list of employees with the same salary. */

SELECT worker.FIRST_NAME , worker.salary
FROM worker
INNER JOIN new_worker
on worker.salary = new_worker.salary and worker.WORKER_ID <> new_worker.WORKER_ID;


/* Write an SQL query to show the second highest salary from a table. */

SELECT FIRST_NAME, MAX(salary) AS salary
  FROM worker
 WHERE salary < (SELECT MAX(salary)
                 FROM worker); 


                   







