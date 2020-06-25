-- Create database company security
CREATE DATABASE company_security;

use company_security;

-- create user1 and user2
create user  'user1'@'localhost' IDENTIFIED BY'password1';
create user  'user2'@'localhost' IDENTIFIED BY'password2';


SELECT USER,HOST from MYSQL.USER;

--the new user has only read only permission to ‘Employee’ table.
grant select on company_security.employee to 'user1'@'localhost';

--  Make sure the new user has only read only permission to ‘Employee’ table. using insert command
insert into employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno) values
(Thinesh,C,Satha,999998877,1996-04-01,jaffna,M,30000,98755525,6);
--ERROR 1142 (42000): INSERT command denied to user 'user1'@'localhost' for table 'employee'


-- open user1 
mysql -u user1 -p
/*Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.6.12-log MySQL Community Server (GPL)

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

*/
-- change the database
use company_security;

-- check user1 only have read permission
select * from employee;
/* output: 
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+
| Fname    | Minit | Lname   | Ssn       | Bdate      | Address                  | Sex  | Salary   | Super_ssn | Dno |
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+
| John     | B     | Smith   | 123456789 | 1965-01-09 | 731 Fondren, Housten, TX | M    | 30000.00 | 333445555 |   5 |
| Franklin | T     | Wong    | 333445555 | 1955-12-08 | 638 Voss, Housten, TX    | M    | 40000.00 | 888665555 |   5 |
| Joyce    | A     | English | 453453453 | 1972-07-31 | 5631 Rice, Houston, TX   | F    | 25000.00 | 333445555 |   5 |
| Ramesh   | K     | Narayan | 666884444 | 1962-09-15 | 975 Fire Oak, Humble, TX | M    | 38000.00 | 333445555 |   5 |
| James    | E     | Borg    | 888665555 | 1937-11-10 | 450 Stone, Houston, TX   | M    | 30000.00 | NULL      |   1 |
| Jennifer | S     | Wallace | 987654321 | 1941-06-20 | 291 Berry, Bellaire, TX  | F    | 43000.00 | 888665555 |   4 |
| Ahmad    | V     | Jabbar  | 987987987 | 1969-03-29 | 980 Dallas, Houston, TX  | M    | 25000.00 | 987654321 |   4 |
| Alicia   | J     | Zelaya  | 999887777 | 1968-01-19 | 3321 Castle, Spring, TX  | F    | 25000.00 | 987654321 |   4 |
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+
8 rows in set (0.02 sec)
*/

-- run insert command and check user1 have any insert permission 
insert into employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno) values
(Thinesh,C,Satha,999998877,1996-04-01,jaffna,M,30000,98755525,6);
--ERROR 1142 (42000): INSERT command denied to user 'user1'@'localhost' for table 'employee'

-- grant insert permission to user1 on employee table
grant insert on employee to 'user1'@'localhost';

-- insert a value
insert into employee (Fname,Lname,Ssn,Bdate,Address,Salary,Dno) values
('Thinesh','Satha','999998877',1996-04-01,'jaffna',30000,5);
--Query OK, 1 row affected, 1 warning (0.00 sec)


-- create view 
grant create view on company_security.* to 'user1'@'localhost';
--Query OK, 0 rows affected (0.00 sec)

grant select on works_on to 'user1'@'localhost';
--Query OK, 0 rows affected (0.00 sec)

create view works_on1 as select Fname,Lname,Pno from employee,works_on;
--Query OK, 0 rows affected (0.02 sec)

grant select on works_on1 to 'user2'@'localhost';
--Query OK, 0 rows affected (0.00 sec)



-- open user2 and check the view 
mysql -u user2 -p
/*
Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 7
Server version: 5.6.12-log MySQL Community Server (GPL)

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
*/
use company_security;

select * from works_on1;
/*
+----------+---------+-----+
| Fname    | Lname   | Pno |
+----------+---------+-----+
| John     | Smith   |   1 |
| Franklin | Wong    |   1 |
| Joyce    | English |   1 |
| Ramesh   | Narayan |   1 |
| James    | Borg    |   1 |
| Jennifer | Wallace |   1 |
| Ahmad    | Jabbar  |   1 |
| Alicia   | Zelaya  |   1 |
| Thinesh  | Satha   |   1 |
| John     | Smith   |   1 |
| Franklin | Wong    |   1 |
| Joyce    | English |   1 |
| Ramesh   | Narayan |   1 |
| James    | Borg    |   1 |
| Jennifer | Wallace |   1 |
| Ahmad    | Jabbar  |   1 |
| Alicia   | Zelaya  |   1 |
| Thinesh  | Satha   |   1 |
| John     | Smith   |   2 |
| Franklin | Wong    |   2 |
| Joyce    | English |   2 |
| Ramesh   | Narayan |   2 |
| James    | Borg    |   2 |
| Jennifer | Wallace |   2 |
| Ahmad    | Jabbar  |   2 |
| Alicia   | Zelaya  |   2 |
| Thinesh  | Satha   |   2 |
| John     | Smith   |   2 |
| Franklin | Wong    |   2 |
| Joyce    | English |   2 |
| Ramesh   | Narayan |   2 |
| James    | Borg    |   2 |
| Jennifer | Wallace |   2 |
| Ahmad    | Jabbar  |   2 |
| Alicia   | Zelaya  |   2 |
| Thinesh  | Satha   |   2 |
| John     | Smith   |   2 |
| Franklin | Wong    |   2 |
| Joyce    | English |   2 |
| Ramesh   | Narayan |   2 |
| James    | Borg    |   2 |
| Jennifer | Wallace |   2 |
| Ahmad    | Jabbar  |   2 |
| Alicia   | Zelaya  |   2 |
| Thinesh  | Satha   |   2 |
| John     | Smith   |   3 |
| Franklin | Wong    |   3 |
| Joyce    | English |   3 |
| Ramesh   | Narayan |   3 |
| James    | Borg    |   3 |
| Jennifer | Wallace |   3 |
| Ahmad    | Jabbar  |   3 |
| Alicia   | Zelaya  |   3 |
| Thinesh  | Satha   |   3 |
| John     | Smith   |   3 |
| Franklin | Wong    |   3 |
| Joyce    | English |   3 |
| Ramesh   | Narayan |   3 |
| James    | Borg    |   3 |
| Jennifer | Wallace |   3 |
| Ahmad    | Jabbar  |   3 |
| Alicia   | Zelaya  |   3 |
| Thinesh  | Satha   |   3 |
| John     | Smith   |  10 |
| Franklin | Wong    |  10 |
| Joyce    | English |  10 |
| Ramesh   | Narayan |  10 |
| James    | Borg    |  10 |
| Jennifer | Wallace |  10 |
| Ahmad    | Jabbar  |  10 |
| Alicia   | Zelaya  |  10 |
| Thinesh  | Satha   |  10 |
| John     | Smith   |  10 |
| Franklin | Wong    |  10 |
| Joyce    | English |  10 |
| Ramesh   | Narayan |  10 |
| James    | Borg    |  10 |
| Jennifer | Wallace |  10 |
| Ahmad    | Jabbar  |  10 |
| Alicia   | Zelaya  |  10 |
| Thinesh  | Satha   |  10 |
| John     | Smith   |  10 |
| Franklin | Wong    |  10 |
| Joyce    | English |  10 |
| Ramesh   | Narayan |  10 |
| James    | Borg    |  10 |
| Jennifer | Wallace |  10 |
| Ahmad    | Jabbar  |  10 |
| Alicia   | Zelaya  |  10 |
| Thinesh  | Satha   |  10 |
| John     | Smith   |  20 |
| Franklin | Wong    |  20 |
| Joyce    | English |  20 |
| Ramesh   | Narayan |  20 |
| James    | Borg    |  20 |
| Jennifer | Wallace |  20 |
| Ahmad    | Jabbar  |  20 |
| Alicia   | Zelaya  |  20 |
| Thinesh  | Satha   |  20 |
| John     | Smith   |  20 |
| Franklin | Wong    |  20 |
| Joyce    | English |  20 |
| Ramesh   | Narayan |  20 |
| James    | Borg    |  20 |
| Jennifer | Wallace |  20 |
| Ahmad    | Jabbar  |  20 |
| Alicia   | Zelaya  |  20 |
| Thinesh  | Satha   |  20 |
| John     | Smith   |  20 |
| Franklin | Wong    |  20 |
| Joyce    | English |  20 |
| Ramesh   | Narayan |  20 |
| James    | Borg    |  20 |
| Jennifer | Wallace |  20 |
| Ahmad    | Jabbar  |  20 |
| Alicia   | Zelaya  |  20 |
| Thinesh  | Satha   |  20 |
| John     | Smith   |  30 |
| Franklin | Wong    |  30 |
| Joyce    | English |  30 |
| Ramesh   | Narayan |  30 |
| James    | Borg    |  30 |
| Jennifer | Wallace |  30 |
| Ahmad    | Jabbar  |  30 |
| Alicia   | Zelaya  |  30 |
| Thinesh  | Satha   |  30 |
| John     | Smith   |  30 |
| Franklin | Wong    |  30 |
| Joyce    | English |  30 |
| Ramesh   | Narayan |  30 |
| James    | Borg    |  30 |
| Jennifer | Wallace |  30 |
| Ahmad    | Jabbar  |  30 |
| Alicia   | Zelaya  |  30 |
| Thinesh  | Satha   |  30 |
| John     | Smith   |  30 |
| Franklin | Wong    |  30 |
| Joyce    | English |  30 |
| Ramesh   | Narayan |  30 |
| James    | Borg    |  30 |
| Jennifer | Wallace |  30 |
| Ahmad    | Jabbar  |  30 |
| Alicia   | Zelaya  |  30 |
| Thinesh  | Satha   |  30 |
+----------+---------+-----+
144 rows in set (0.00 sec)
*/

-- Remove privileges of user1 on WORKS ON and EMPLOYEE
REVOKE SELECT
ON company_security.EMPLOYEE
from 'user1'@'localhost';
--Query OK, 0 rows affected (0.00 sec)

REVOKE SELECT
ON company_security.WORK_ON
from 'user1'@'localhost';

select * from works_on1;
/*
+----------+---------+-----+
| Fname    | Lname   | Pno |
+----------+---------+-----+
| John     | Smith   |   1 |
| Franklin | Wong    |   1 |
| Joyce    | English |   1 |
| Ramesh   | Narayan |   1 |
| James    | Borg    |   1 |
| Jennifer | Wallace |   1 |
| Ahmad    | Jabbar  |   1 |
| Alicia   | Zelaya  |   1 |
| Thinesh  | Satha   |   1 |
| John     | Smith   |   1 |
| Franklin | Wong    |   1 |
| Joyce    | English |   1 |
| Ramesh   | Narayan |   1 |
| James    | Borg    |   1 |
| Jennifer | Wallace |   1 |
| Ahmad    | Jabbar  |   1 |
| Alicia   | Zelaya  |   1 |
| Thinesh  | Satha   |   1 |
| John     | Smith   |   2 |
| Franklin | Wong    |   2 |
| Joyce    | English |   2 |
| Ramesh   | Narayan |   2 |
| James    | Borg    |   2 |
| Jennifer | Wallace |   2 |
| Ahmad    | Jabbar  |   2 |
| Alicia   | Zelaya  |   2 |
| Thinesh  | Satha   |   2 |
| John     | Smith   |   2 |
| Franklin | Wong    |   2 |
| Joyce    | English |   2 |
| Ramesh   | Narayan |   2 |
| James    | Borg    |   2 |
| Jennifer | Wallace |   2 |
| Ahmad    | Jabbar  |   2 |
| Alicia   | Zelaya  |   2 |
| Thinesh  | Satha   |   2 |
| John     | Smith   |   2 |
| Franklin | Wong    |   2 |
| Joyce    | English |   2 |
| Ramesh   | Narayan |   2 |
| James    | Borg    |   2 |
| Jennifer | Wallace |   2 |
| Ahmad    | Jabbar  |   2 |
| Alicia   | Zelaya  |   2 |
| Thinesh  | Satha   |   2 |
| John     | Smith   |   3 |
| Franklin | Wong    |   3 |
| Joyce    | English |   3 |
| Ramesh   | Narayan |   3 |
| James    | Borg    |   3 |
| Jennifer | Wallace |   3 |
| Ahmad    | Jabbar  |   3 |
| Alicia   | Zelaya  |   3 |
| Thinesh  | Satha   |   3 |
| John     | Smith   |   3 |
| Franklin | Wong    |   3 |
| Joyce    | English |   3 |
| Ramesh   | Narayan |   3 |
| James    | Borg    |   3 |
| Jennifer | Wallace |   3 |
| Ahmad    | Jabbar  |   3 |
| Alicia   | Zelaya  |   3 |
| Thinesh  | Satha   |   3 |
| John     | Smith   |  10 |
| Franklin | Wong    |  10 |
| Joyce    | English |  10 |
| Ramesh   | Narayan |  10 |
| James    | Borg    |  10 |
| Jennifer | Wallace |  10 |
| Ahmad    | Jabbar  |  10 |
| Alicia   | Zelaya  |  10 |
| Thinesh  | Satha   |  10 |
| John     | Smith   |  10 |
| Franklin | Wong    |  10 |
| Joyce    | English |  10 |
| Ramesh   | Narayan |  10 |
| James    | Borg    |  10 |
| Jennifer | Wallace |  10 |
| Ahmad    | Jabbar  |  10 |
| Alicia   | Zelaya  |  10 |
| Thinesh  | Satha   |  10 |
| John     | Smith   |  10 |
| Franklin | Wong    |  10 |
| Joyce    | English |  10 |
| Ramesh   | Narayan |  10 |
| James    | Borg    |  10 |
| Jennifer | Wallace |  10 |
| Ahmad    | Jabbar  |  10 |
| Alicia   | Zelaya  |  10 |
| Thinesh  | Satha   |  10 |
| John     | Smith   |  20 |
| Franklin | Wong    |  20 |
| Joyce    | English |  20 |
| Ramesh   | Narayan |  20 |
| James    | Borg    |  20 |
| Jennifer | Wallace |  20 |
| Ahmad    | Jabbar  |  20 |
| Alicia   | Zelaya  |  20 |
| Thinesh  | Satha   |  20 |
| John     | Smith   |  20 |
| Franklin | Wong    |  20 |
| Joyce    | English |  20 |
| Ramesh   | Narayan |  20 |
| James    | Borg    |  20 |
| Jennifer | Wallace |  20 |
| Ahmad    | Jabbar  |  20 |
| Alicia   | Zelaya  |  20 |
| Thinesh  | Satha   |  20 |
| John     | Smith   |  20 |
| Franklin | Wong    |  20 |
| Joyce    | English |  20 |
| Ramesh   | Narayan |  20 |
| James    | Borg    |  20 |
| Jennifer | Wallace |  20 |
| Ahmad    | Jabbar  |  20 |
| Alicia   | Zelaya  |  20 |
| Thinesh  | Satha   |  20 |
| John     | Smith   |  30 |
| Franklin | Wong    |  30 |
| Joyce    | English |  30 |
| Ramesh   | Narayan |  30 |
| James    | Borg    |  30 |
| Jennifer | Wallace |  30 |
| Ahmad    | Jabbar  |  30 |
| Alicia   | Zelaya  |  30 |
| Thinesh  | Satha   |  30 |
| John     | Smith   |  30 |
| Franklin | Wong    |  30 |
| Joyce    | English |  30 |
| Ramesh   | Narayan |  30 |
| James    | Borg    |  30 |
| Jennifer | Wallace |  30 |
| Ahmad    | Jabbar  |  30 |
| Alicia   | Zelaya  |  30 |
| Thinesh  | Satha   |  30 |
| John     | Smith   |  30 |
| Franklin | Wong    |  30 |
| Joyce    | English |  30 |
| Ramesh   | Narayan |  30 |
| James    | Borg    |  30 |
| Jennifer | Wallace |  30 |
| Ahmad    | Jabbar  |  30 |
| Alicia   | Zelaya  |  30 |
| Thinesh  | Satha   |  30 |
+----------+---------+-----+
144 rows in set (0.00 sec)
*/

-- open user1 and check the revoke
mysql -u user1 -p
/*
Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 5.6.12-log MySQL Community Server (GPL)

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
*/
use company_security;

select * from works_on1;
--ERROR 1142 (42000): SELECT command denied to user 'user1'@'localhost' for table 'works_on1'


----------------------------------------------------SQL Injection Attacks-----------------------------------------------

select * from employee
where ssn=999887777;
/*
+--------+-------+--------+-----------+------------+-------------------------+------+----------+-----------+-----+
| Fname  | Minit | Lname  | Ssn       | Bdate      | Address                 | Sex  | Salary   | Super_ssn | Dno |
+--------+-------+--------+-----------+------------+-------------------------+------+----------+-----------+-----+
| Alicia | J     | Zelaya | 999887777 | 1968-01-19 | 3321 Castle, Spring, TX | F    | 25000.00 | 987654321 |   4 |
+--------+-------+--------+-----------+------------+-------------------------+------+----------+-----------+-----+
1 row in set (0.01 sec)
*/
select * from employee
where ssn=999887777 or 'x'='x';
/*
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+
| Fname    | Minit | Lname   | Ssn       | Bdate      | Address                  | Sex  | Salary   | Super_ssn | Dno |
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+
| John     | B     | Smith   | 123456789 | 1965-01-09 | 731 Fondren, Housten, TX | M    | 30000.00 | 333445555 |   5 |
| Franklin | T     | Wong    | 333445555 | 1955-12-08 | 638 Voss, Housten, TX    | M    | 40000.00 | 888665555 |   5 |
| Joyce    | A     | English | 453453453 | 1972-07-31 | 5631 Rice, Houston, TX   | F    | 25000.00 | 333445555 |   5 |
| Ramesh   | K     | Narayan | 666884444 | 1962-09-15 | 975 Fire Oak, Humble, TX | M    | 38000.00 | 333445555 |   5 |
| James    | E     | Borg    | 888665555 | 1937-11-10 | 450 Stone, Houston, TX   | M    | 30000.00 | NULL      |   1 |
| Jennifer | S     | Wallace | 987654321 | 1941-06-20 | 291 Berry, Bellaire, TX  | F    | 43000.00 | 888665555 |   4 |
| Ahmad    | V     | Jabbar  | 987987987 | 1969-03-29 | 980 Dallas, Houston, TX  | M    | 25000.00 | 987654321 |   4 |
| Alicia   | J     | Zelaya  | 999887777 | 1968-01-19 | 3321 Castle, Spring, TX  | F    | 25000.00 | 987654321 |   4 |
| Thinesh  | NULL  | Satha   | 999998877 | 0000-00-00 | jaffna                   | NULL | 30000.00 | NULL      |   5 |
+----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+-----+
9 rows in set (0.00 sec)
*/

----------------------------------------------------- Assignment -----------------------------------------------------------

-- CREATE USERS A,B,C,D,E

create user  'A'@'localhost' IDENTIFIED BY'passwordA';
--Query OK, 0 rows affected (0.01 sec)

create user  'B'@'localhost' IDENTIFIED BY'passwordB';
--Query OK, 0 rows affected (0.00 sec)

create user  'C'@'localhost' IDENTIFIED BY'passwordC';
--Query OK, 0 rows affected (0.00 sec)

create user  'D'@'localhost' IDENTIFIED BY'passwordD';
--Query OK, 0 rows affected (0.00 sec)

create user  'E'@'localhost' IDENTIFIED BY'passwordE';
--Query OK, 0 rows affected (0.00 sec)

 --01.Account A can retrieve or modify any relation except DEPENDENT and can grant any of 
 --   these privileges to other users. 

GRANT SELECT, UPDATE
ON EMPLOYEE
TO A WITH GRANT OPTION;

GRANT SELECT, UPDATE
ON DEPARTMENT
TO A WITH GRANT OPTION;

GRANT SELECT, UPDATE
ON DEPT_LOCATIONS
TO A WITH GRANT OPTION;

GRANT SELECT, UPDATE
ON PROJECT
TO A WITH GRANT OPTION;

GRANT SELECT, UPDATE
ON WORKS_ON 
TO A WITH GRANT OPTION;

SHOW GRANTS FOR A;
/*
+------------------------------------------------------------------------------------------+
| Grants for A@%                                                                           |
+------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'A'@'%'                                                            |
| GRANT SELECT, UPDATE ON `company_security`.`department` TO 'A'@'%' WITH GRANT OPTION     |
| GRANT SELECT, UPDATE ON `company_security`.`project` TO 'A'@'%' WITH GRANT OPTION        |
| GRANT SELECT, UPDATE ON `company_security`.`employee` TO 'A'@'%' WITH GRANT OPTION       |
| GRANT SELECT, UPDATE ON `company_security`.`dept_locations` TO 'A'@'%' WITH GRANT OPTION |
| GRANT SELECT, UPDATE ON `company_security`.`works_on` TO 'A'@'%' WITH GRANT OPTION       |
+------------------------------------------------------------------------------------------+
6 rows in set (0.00 sec)
*/


--02.Account B can retrieve all the attributes of EMPLOYEE and DEPARTMENT except for
--   Salary, Mgr ssn, and Mgr start date.
 
CREATE VIEW EMP_VIEW AS SELECT FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS, SEX SUPERSSN, DNO FROM EMPLOYEE;
GRANT SELECT ON EMP_VIEW TO B; 
CREATE VIEW DEPT_VIEW AS SELECT DNAME, DNUMBER FROM DEPARTMENT; 
GRANT SELECT ON DEPT_VIEW TO B;

SHOW GRANTS FOR B;
/*
+-----------------------------------------------------------+
| Grants for B@%                                            |
+-----------------------------------------------------------+
| GRANT USAGE ON *.* TO 'B'@'%'                             |
| GRANT SELECT ON `company_security`.`emp_view` TO 'B'@'%'  |
| GRANT SELECT ON `company_security`.`dept_view` TO 'B'@'%' |
+-----------------------------------------------------------+
3 rows in set (0.00 sec)
*/


--03.Account C can retrieve or modify WORKS ON but can only retrieve the Fname, Minit,               
--   Lname, and Ssn attributes of EMPLOYEE and the Pname and Pnumber attributes of             
--   PROJECT. 
GRANT SELECT, UPDATE ON WORKS_ON TO C;
--Query OK, 0 rows affected (0.00 sec)

CREATE VIEW EMP_VIEW1 AS SELECT FNAME, MINIT, LNAME, SSN FROM EMPLOYEE;
--Query OK, 0 rows affected (0.01 sec)

GRANT SELECT ON EMP_VIEW1 TO C;
--Query OK, 0 rows affected (0.00 sec)

CREATE VIEW PROJ_VIEW AS SELECT PNAME, PNUMBER FROM PROJECT;
--Query OK, 0 rows affected (0.01 sec)

GRANT SELECT ON PROJ_VIEW TO C;
--Query OK, 0 rows affected (0.00 sec)

SHOW GRANTS FOR C;
/*
+------------------------------------------------------------------+
| Grants for C@%                                                   |
+------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'C'@'%'                                    |
| GRANT SELECT ON `company_security`.`emp_view1` TO 'C'@'%'        |
| GRANT SELECT, UPDATE ON `company_security`.`works_on` TO 'C'@'%' |
| GRANT SELECT ON `company_security`.`proj_view` TO 'C'@'%'        |
+------------------------------------------------------------------+
4 rows in set (0.00 sec)
*/

--04.Account D can retrieve any attribute of EMPLOYEE or DEPENDENT and can modify             
--   DEPENDENT. 

GRANT SELECT ON EMPLOYEE TO D;
--Query OK, 0 rows affected (0.00 sec)

GRANT SELECT ON DEPENDENT TO D;
--Query OK, 0 rows affected (0.00 sec)

SHOW GRANTS FOR D;
/*
+-----------------------------------------------------------+
| Grants for D@%                                            |
+-----------------------------------------------------------+
| GRANT USAGE ON *.* TO 'D'@'%'                             |
| GRANT SELECT ON `company_security`.`dependent` TO 'D'@'%' |
| GRANT SELECT ON `company_security`.`employee` TO 'D'@'%'  |
+-----------------------------------------------------------+
3 rows in set (0.00 sec)
*/

-- 05.Account E can retrieve any attribute of EMPLOYEE but only for EMPLOYEE tuples that
--   have Dno = 3

CREATE VIEW DNO_VIEW AS SELECT * FROM EMPLOYEE WHERE DNO = 3;
--Query OK, 0 rows affected (0.02 sec)

GRANT SELECT ON DNO_VIEW TO E;
--Query OK, 0 rows affected (0.00 sec)

SHOW GRANTS FOR E;
/*
+----------------------------------------------------------+
| Grants for E@%                                           |
+----------------------------------------------------------+
| GRANT USAGE ON *.* TO 'E'@'%'                            |
| GRANT SELECT ON `company_security`.`dno_view` TO 'E'@'%' |
+----------------------------------------------------------+
2 rows in set (0.00 sec)
*/