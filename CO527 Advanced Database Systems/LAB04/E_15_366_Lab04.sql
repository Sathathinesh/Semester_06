-- using the Company database from Lab01
mysql> use company;
Database changed

mysql> select * from salaries
    -> where emp_no=43624;
Empty set (0.01 sec)

-- select the emp_no=201774 from salaries table.
mysql> select * from salaries
    -> where emp_no=201774;
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
| 201774 |  40000 | 1994-12-17 | 1995-12-17 |
| 201774 |  42057 | 1995-12-17 | 1996-12-16 |
| 201774 |  42599 | 1996-12-16 | 1997-03-04 |
+--------+--------+------------+------------+
3 rows in set (0.00 sec)

-- AUTOCOMMIT mode ON
mysql> SET AUTOCOMMIT = 1;
Query OK, 0 rows affected (0.00 sec)

-- Start a new transaction
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

-- Update salaries table 
mysql> UPDATE SALARIES SET SALARY = SALARY*(1.1) WHERE EMP_NO=201774;
Query OK, 3 rows affected (0.00 sec)
Rows matched: 3  Changed: 3  Warnings: 0

--save the changes invoked by a transaction to the database
mysql> COMMIT;
Query OK, 0 rows affected (0.00 sec)

--check the changes saved after the commit.
mysql> SELECT * FROM SALARIES
    -> WHERE EMP_NO = 201774;
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
| 201774 |  44000 | 1994-12-17 | 1995-12-17 |
| 201774 |  46263 | 1995-12-17 | 1996-12-16 |
| 201774 |  46859 | 1996-12-16 | 1997-03-04 |
+--------+--------+------------+------------+
3 rows in set (0.00 sec)
-- 3 rows from the salaries table would be changed .


-- start a new transaction 
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

-- Update the salaries table where emp_no = 201774
mysql> UPDATE SALARIES SET SALARY = SALARY*(1.1) WHERE EMP_NO=201774;
Query OK, 3 rows affected (0.00 sec)
Rows matched: 3  Changed: 3  Warnings: 0

-- Undo the transaction that have not already been saved to the database.
mysql> ROLLBACK;
Query OK, 0 rows affected (0.00 sec)

-- check whether the change in the table using select.
mysql> SELECT * FROM SALARIES
    -> WHERE EMP_NO = 201774;
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
| 201774 |  44000 | 1994-12-17 | 1995-12-17 |
| 201774 |  46263 | 1995-12-17 | 1996-12-16 |
| 201774 |  46859 | 1996-12-16 | 1997-03-04 |
+--------+--------+------------+------------+
3 rows in set (0.00 sec)

-- Update operation would not impact the table .

--------------------------------------------------------------------------------------------------------------------------------
                                                     -- Concurrent Accesses --
--------------------------------------------------------------------------------------------------------------------------------
-- First Window for concurrent accesses and update 

-- check the DEPARTMENTS table 
mysql> SELECT * FROM DEPARTMENTS;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d001    | Marketing          |
| d002    | Finance            |
| d003    | Human Resources    |
| d004    | Production         |
| d005    | Development        |
| d006    | Quality Management |
| d007    | Sales              |
| d008    | Research           |
| d009    | Customer Service   |
+---------+--------------------+
9 rows in set (0.00 sec)


-- STEP --> 03 check the insert saved in the first window 
-- STEP --> 02 not impact the first window before the commit
mysql> SELECT * FROM DEPARTMENTS;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d001    | Marketing          |
| d002    | Finance            |
| d003    | Human Resources    |
| d004    | Production         |
| d005    | Development        |
| d006    | Quality Management |
| d007    | Sales              |
| d008    | Research           |
| d009    | Customer Service   |
+---------+--------------------+
9 rows in set (0.00 sec)

-- STEP -->05 check the changes saved in the database after STEP-->04 commit

mysql> SELECT * FROM DEPARTMENTS;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d001    | Marketing          |
| d002    | Finance            |
| d003    | Human Resources    |
| d004    | Production         |
| d005    | Development        |
| d006    | Quality Management |
| d007    | Sales              |
| d008    | Research           |
| d009    | Customer Service   |
| d010    | Management         |
+---------+--------------------+
10 rows in set (0.00 sec)
-- d010 insert to the table after commit the transaction in second window


-- STEP-->06
-- Start a new transaction in first window 
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

-- STEP--07
-- Update the departments table using first window
mysql> UPDATE DEPARTMENTS
    -> SET DEPt_NAME='Testing'
    -> where dept_no='d010';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

-- check the update saved in the table using first window
mysql> SELECT * FROM DEPARTMENTS;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d001    | Marketing          |
| d002    | Finance            |
| d003    | Human Resources    |
| d004    | Production         |
| d005    | Development        |
| d006    | Quality Management |
| d007    | Sales              |
| d008    | Research           |
| d009    | Customer Service   |
| d010    | Testing            |
+---------+--------------------+
10 rows in set (0.00 sec)
-- d010 updated in the departments table

-- STEP-->09 commit all change invoked in the database
mysql> commit;
Query OK, 0 rows affected (0.00 sec)


-------------------------------------------------------------------------------------------------------------------
-- second window  

mysql> USE COMPANY;
Database changed
mysql> SELECT * FROM DEPARTMENTS;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d001    | Marketing          |
| d002    | Finance            |
| d003    | Human Resources    |
| d004    | Production         |
| d005    | Development        |
| d006    | Quality Management |
| d007    | Sales              |
| d008    | Research           |
| d009    | Customer Service   |
+---------+--------------------+
9 rows in set (0.01 sec)

-- STEP-->01 start a new transaction in second window

mysql> SET AUTOCOMMIT = 1;
Query OK, 0 rows affected (0.00 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

-- insert a new value in departments table 
mysql> INSERT INTO DEPARTMENTS(dept_no,dept_name)
    -> values ('d010','Management');
Query OK, 1 row affected (0.00 sec)

-- STEP --> 02 check the insert saved in the current window
mysql> SELECT * FROM DEPARTMENTS;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d001    | Marketing          |
| d002    | Finance            |
| d003    | Human Resources    |
| d004    | Production         |
| d005    | Development        |
| d006    | Quality Management |
| d007    | Sales              |
| d008    | Research           |
| d009    | Customer Service   |
| d010    | Management         |
+---------+--------------------+
10 rows in set (0.00 sec)

-- STEP --> 04 after check from first window commit the second window
mysql> commit;
Query OK, 0 rows affected (0.00 sec)


-- STEP-->08 check whether updated values impact the table from second window 
-- that would not impact the table before the commit.
mysql> SELECT * FROM DEPARTMENTS;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d001    | Marketing          |
| d002    | Finance            |
| d003    | Human Resources    |
| d004    | Production         |
| d005    | Development        |
| d006    | Quality Management |
| d007    | Sales              |
| d008    | Research           |
| d009    | Customer Service   |
| d010    | Management         |
+---------+--------------------+
10 rows in set (0.00 sec)


-- STEP-->10 check the resuls after commit the transaction in the first window 
-- that impact the departments table d010
mysql> SELECT * FROM DEPARTMENTS;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d001    | Marketing          |
| d002    | Finance            |
| d003    | Human Resources    |
| d004    | Production         |
| d005    | Development        |
| d006    | Quality Management |
| d007    | Sales              |
| d008    | Research           |
| d009    | Customer Service   |
| d010    | Testing            |
+---------+--------------------+
10 rows in set (0.00 sec)

--Before using commit in the first window, unable to access the changes in the second window.
--After using commit tin the first window, able to access the changes in the second window.


-------------------------------------------------------------------------------------------------------------------------------
                                                   --write a scenario --
-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
-- first window

mysql> use sample;
Database changed

mysql> CREATE TABLE Persons (
    ->     PersonID int,
    ->     LastName varchar(255),
    ->     FirstName varchar(255),
    ->     Address varchar(255),
    ->     City varchar(255)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> insert into Persons(PersonID,lastname,firstname,address,city)
    -> values (0001,'Sathakaran','Thinesh','Akber','kandy');
Query OK, 1 row affected (0.00 sec)

mysql> select * from Persons;
+----------+------------+-----------+---------+-------+
| PersonID | LastName   | FirstName | Address | City  |
+----------+------------+-----------+---------+-------+
|        1 | Sathakaran | Thinesh   | Akber   | kandy |
+----------+------------+-----------+---------+-------+
1 row in set (0.00 sec)

mysql> insert into Persons(PersonID,lastname,firstname,address,city)
    -> values (0002,'Wilman','Tom','Colombo','kandy');
Query OK, 1 row affected (0.00 sec)

mysql> insert into Persons(PersonID,lastname,firstname,address,city)
    -> values (0003,'Cardinal','Zbyszek','Colombo','Colombo');
Query OK, 1 row affected (0.00 sec)


-- after delete operation done in second window check the change in the database using first window
mysql> select * from Persons;
+----------+------------+-----------+---------+---------+
| PersonID | LastName   | FirstName | Address | City    |
+----------+------------+-----------+---------+---------+
|        1 | Sathakaran | Thinesh   | Akber   | kandy   |
|        2 | Wilman     | Tom       | Colombo | kandy   |
|        3 | Cardinal   | Zbyszek   | Colombo | Colombo |
+----------+------------+-----------+---------+---------+
3 rows in set (0.00 sec)

mysql>

-- after commit the transaction check the changes in table
mysql> select * from Persons;
+----------+----------+-----------+---------+---------+
| PersonID | LastName | FirstName | Address | City    |
+----------+----------+-----------+---------+---------+
|        2 | Wilman   | Tom       | Colombo | kandy   |
|        3 | Cardinal | Zbyszek   | Colombo | Colombo |
+----------+----------+-----------+---------+---------+
2 rows in set (0.00 sec)


-- start a new transaction 
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

-- after second window update Person table and same time update the person table from first window 
-- that gives error
mysql> UPDATE Persons
    -> set City='Kandy'
    -> where PersonID=3;
ERROR 1205 (HY000): Lock wait timeout exceeded; try restarting transaction

-- after commit the second window transaction 
-- update the table
mysql> UPDATE Persons
    -> set City='Kandy'
    -> where PersonID=3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Persons;
+----------+----------+-----------+---------+-------+
| PersonID | LastName | FirstName | Address | City  |
+----------+----------+-----------+---------+-------+
|        2 | Wilman   | Tom       | Jaffna  | kandy |
|        3 | Cardinal | Zbyszek   | Colombo | Kandy |
+----------+----------+-----------+---------+-------+
2 rows in set (0.00 sec)

------------------------------------------------------------------------------------------------------------------------------
-- second window

mysql> use sample;
Database changed
mysql> select * from Persons;
+----------+------------+-----------+---------+---------+
| PersonID | LastName   | FirstName | Address | City    |
+----------+------------+-----------+---------+---------+
|        1 | Sathakaran | Thinesh   | Akber   | kandy   |
|        2 | Wilman     | Tom       | Colombo | kandy   |
|        3 | Cardinal   | Zbyszek   | Colombo | Colombo |
+----------+------------+-----------+---------+---------+
3 rows in set (0.00 sec)


mysql> SET AUTOCOMMIT = 1;
Query OK, 0 rows affected (0.00 sec)

-- Start a new transaction
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> delete from Persons
    -> where PersonID=1;
Query OK, 1 row affected (0.00 sec)

mysql> select * from Persons;
+----------+----------+-----------+---------+---------+
| PersonID | LastName | FirstName | Address | City    |
+----------+----------+-----------+---------+---------+
|        2 | Wilman   | Tom       | Colombo | kandy   |
|        3 | Cardinal | Zbyszek   | Colombo | Colombo |
+----------+----------+-----------+---------+---------+
2 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)
 
-- after rollback undo the operation
mysql> select * from Persons;
+----------+------------+-----------+---------+---------+
| PersonID | LastName   | FirstName | Address | City    |
+----------+------------+-----------+---------+---------+
|        1 | Sathakaran | Thinesh   | Akber   | kandy   |
|        2 | Wilman     | Tom       | Colombo | kandy   |
|        3 | Cardinal   | Zbyszek   | Colombo | Colombo |
+----------+------------+-----------+---------+---------+
3 rows in set (0.00 sec)

mysql> delete from Persons
    -> where PersonID=1;
Query OK, 1 row affected (0.00 sec)

-- commit all the change invoked in transaction 
mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from Persons;
+----------+----------+-----------+---------+---------+
| PersonID | LastName | FirstName | Address | City    |
+----------+----------+-----------+---------+---------+
|        2 | Wilman   | Tom       | Colombo | kandy   |
|        3 | Cardinal | Zbyszek   | Colombo | Colombo |
+----------+----------+-----------+---------+---------+
2 rows in set (0.00 sec)

-- after commit rollback not impact the table 
mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from Persons;
+----------+----------+-----------+---------+---------+
| PersonID | LastName | FirstName | Address | City    |
+----------+----------+-----------+---------+---------+
|        2 | Wilman   | Tom       | Colombo | kandy   |
|        3 | Cardinal | Zbyszek   | Colombo | Colombo |
+----------+----------+-----------+---------+---------+
2 rows in set (0.00 sec)


-- start a new transaction 
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

-- Update Persons table 
mysql> update Persons
    -> set Address='Jaffna' where PersonID=2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

-- after update the table check the changes 
mysql> select * from Persons;
+----------+----------+-----------+---------+---------+
| PersonID | LastName | FirstName | Address | City    |
+----------+----------+-----------+---------+---------+
|        2 | Wilman   | Tom       | Jaffna  | kandy   |
|        3 | Cardinal | Zbyszek   | Colombo | Colombo |
+----------+----------+-----------+---------+---------+
2 rows in set (0.00 sec)

-- commit all transaction before update table from first window 
mysql> commit;
Query OK, 0 rows affected (0.00 sec)

