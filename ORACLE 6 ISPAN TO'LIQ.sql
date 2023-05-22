SELECT ( 'I''m ' || USER || '. Today''s date: ' || SYSDATE ) "Ma`lumot"
FROM dual;

SELECT
    first_name,
    salary,
    hire_date,
    manager_id
FROM
    employee
WHERE 
    department_id IN(6, 7, 8)
ORDER BY 4, 2, 3;

--SUBSTR ( N, x [, y] )
SELECT SUBSTR( 'Olma_Uzum_Anor_Nok', 10)
FROM dual;

SELECT 
SUBSTR( '1#3#5#7#9#1#3#5#7#9' , 9) "SUBSTR ( N, x )", 
SUBSTR( '1#3#5#7#9#1#3#5#7#9' , -5) "SUBSTR ( N, -x )", 
SUBSTR( '1#3#5#7#9#1#3#5#7#9' , 9, 6) "SUBSTR ( N, x [, y] )",
SUBSTR( '1#3#5#7#9#1#3#5#7#9' , -5, 3) "SUBSTR ( N, -x [, -y] )"
FROM dual;


SELECT
    concat(concat(substr(first_name, 1, 1),
                  '. '),
           last_name) fio
FROM
    employee
WHERE
    SUBSTR(last_name, 1, 2) = 'Hu' ;
    
--INSTR(c1, c2)
SELECT INSTR('sirdosh', 'osh')
FROM dual;

SELECT INSTR('sirdosh', 'qosh')
FROM dual;

SELECT 
SYSDATE,
INSTR(SYSDATE, '4.2')
FROM dual;

SELECT 
INSTR( '1#3#5#7#9#7#5' , '#')
FROM dual;

--4- belgidan keyin keladigan # ni tartib nomerini topish:
SELECT 
INSTR( '12#456#8#' , '#', 4)
FROM dual;

SELECT
  INSTR( 'This is a playlist', 'is',-2 ) substring_location
FROM dual;

Select
INSTR('Tech on the net', 'e', -2)
from dual;

SELECT 
INSTR( '1#3#5#7#9#7#5' , '#', 1, 3)
FROM dual;

SELECT 
INSTR( '1#3#5#7#9#7#5' , '#', 3, 4)
FROM dual;

SELECT 
INSTR( '1#3#5#7#9#7#5' , '#', -3, 2)
FROM dual;

SELECT 
first_name,
hire_date
FROM employee
WHERE INSTR(first_name, 'on') = 4;

--Length()
SELECT 
LENGTH('1#3#5#7#9#')
FROM dual;

SELECT 
('1 + 2 = 3') "yigindi",
LENGTH( '1 + 2 = ' || 3 )
FROM dual;

SELECT
    first_name,
    last_name
FROM
    employee
WHERE
    length(first_name) > 9;
    
--LOWER()
SELECT
    first_name, 
    last_name,
    LOWER(last_name)
FROM 
    employee
WHERE LOWER(last_name) LIKE '%be%';

--LPAD, RPAD
SELECT
    lpad('abcd', 6),
    length(lpad('abcd', 6)) "L=LPAD",
    rpad('abcd', 6),
    length(rpad('abcd', 6)) "L=RPAD"
FROM
    dual;
    
SELECT
    lpad('abcd', 6, '*'),
    rpad('abcd', 6, '*')
FROM
    dual;
    
SELECT
    lpad(first_name, 10) lpad_name,
    lpad(salary, 8, '*') lpad_salary
FROM
     employee
WHERE first_name LIKE 'J%';    

--REPLACE(c1, c2 [, c3])
SELECT
    replace('downtown', 'down') replace1,
    replace('downtown', 'down', 'up') replace2,
    replace('downtown', 'own', 'up') replace3
FROM 
    dual;

SELECT
    first_name,
    salary,
    REPLACE(salary, '0', '000' ) "3x"
FROM 
    employee; 
    
--TO_CHAR
SELECT  
    TO_CHAR(SYSDATE, 'DD') this_day1,
    TO_CHAR(SYSDATE, 'Mon') this_mon1,
    TO_CHAR(SYSDATE, 'Day') this_day,
    TO_CHAR(SYSDATE, 'Month') this_month,
    TO_CHAR(SYSDATE, 'Year') this_year
FROM dual;

SELECT
    last_name,
    TO_CHAR(hire_date, 'fmDD Month YYYY') hire_date1,
    TO_CHAR(hire_date, 'DD Month YYYY') hire_date2
FROM employee;

--TO_DATE
SELECT
    first_name,
    hire_date
FROM
    employee
WHERE
    hire_date > TO_DATE('01/12/2015', 'DD/MM/YYYY');
    
--ADD_MONTHS
SELECT
    SYSDATE,
    ADD_MONTHS(SYSDATE, -12) OLD_YEAR,
    ADD_MONTHS(SYSDATE, 12) NEW_YEAR    
FROM dual;

--MONTHS_BETWEEN
SELECT
    MONTHS_BETWEEN('31.03.08', '30/09/08') f1,
    MONTHS_BETWEEN('15/03/08', '30/09/08') f2,
    ROUND(MONTHS_BETWEEN('15/03/08', '30/09/08')) f3,
    ROUND(MONTHS_BETWEEN('15/03/08', '30/09/08'), 1) f4
FROM dual;

SELECT
    SYSDATE,
    Last_day(SYSDATE) oy_oxiri,
    LAST_DAY(SYSDATE) + 1 keyigi_oy_boshi
FROM dual;

SELECT
    first_name,
    NVL(department_id, 0)
FROM employee
ORDER BY 2;

SELECT
    GREATEST(60, 50, 90, 80) eng_kopi
FROM dual;

SELECT
    first_name,
    salary,
    GREATEST(salary*0.15, 8000) bonus
FROM employee;

SELECT
    LEAST(60, 50, 90, 80) eng_kami
FROM dual;

SELECT
    GREATEST(SYSDATE, '24-03-2000', '20-03-2000') eng_katta,
    LEAST(SYSDATE, '24-03-2000', '20-03-2000') eng_kichik
FROM dual;

SELECT
    GREATEST('24-03-2000', '20-03-2000') eng_katta,
    LEAST('24-03-2000', '20-03-2000') eng_kichik 
FROM dual;

SELECT
    COUNT(DISTINCT department_id) NOLSIZ,
    COUNT(DISTINCT NVL(department_id, 0)) NOL_BILAN
FROM employee;

SELECT 
    AVG(salary),
    TRUNC(AVG(salary)),
    TRUNC(AVG(salary), 1),
    FLOOR(AVG(salary))
FROM employee;

SELECT * FROM employee
WHERE
    length(first_name) = (
        SELECT
            MAX(length(first_name))
        FROM employee);
        
SELECT
    ROUND(AVG((SYSDATE - hire_date)/365.25), 1)
FROM employee;  

SELECT
    2*COUNT(*),
    SUM(2)
FROM employee;

SELECT
    SUM(salary),
    SUM(DISTINCT salary)
FROM employee;

SELECT
    SUM(SYSDATE - hire_date)/365.25
FROM employee;

SELECT
    (SUM(SYSDATE - hire_date)/365.25)/COUNT(*)
FROM employee;

SELECT
    MAX(LENGTH(first_name)) eng_uzun_ism,
    MIN(LENGTH(first_name)) eng_qisqa_ism
FROM employee;

SELECT
    department_id,
    COUNT(*),
    MAX(salary)
FROM employee
GROUP BY department_id;

SELECT
    TO_CHAR(HIRE_DATE, 'YYYY') YILLAR,
    COUNT(*) SHU_YILDA_ISHGA_OLINGANLAR_SONI
FROM employee
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY COUNT(*) DESC;

SELECT
    TO_CHAR(HIRE_DATE, 'YYYY') YILLAR,
    TO_CHAR(HIRE_DATE, 'MM') OYLAR,
    COUNT(*) SHU_OYDA_ISHGA_OLINGANLAR_SONI
FROM employee
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY'), TO_CHAR(HIRE_DATE, 'MM')
ORDER BY COUNT(*) DESC;

SELECT
    department_id,
    COUNT(*)
FROM employee
GROUP BY department_id
HAVING COUNT(*) > 3
ORDER BY count(*);

SELECT
    TO_CHAR(hire_date, 'DAY') hafta_kunlari,
    COUNT(*) ishga_olinganlar_soni
FROM employee
GROUP BY TO_CHAR(hire_date, 'DAY')
HAVING COUNT(*) > 30
ORDER BY COUNT(*);

SELECT
    first_name,
    salary,
    department_id,
    department_name
FROM employee
NATURAL JOIN department;

SELECT
    e.first_name,
    e.salary,
    d.department_id,
    d.department_name
FROM employee e, department d
WHERE  e.department_id = d.department_id;

SELECT
    first_name,
    salary,
    department_id,
    department_name
FROM employee
JOIN department
USING(department_id);

SELECT
    co.order_id,
    co.order_date,
    c.first_name,
    p.product_name,
    p.price
FROM customer_order co
NATURAL JOIN customer c
NATURAL JOIN product p;

SELECT
    co.order_id,
    co.order_date,
    c.first_name,
    p.product_name,
    p.price
FROM customer_order co
JOIN customer c ON co.customer_id = c.customer_id
JOIN product p ON co.product_id = p.product_id;

SELECT
    co.order_id,
    co.order_date,
    c.first_name,
    p.product_name,
    p.price
FROM customer_order co
JOIN customer c USING(customer_id)
JOIN product p USING(product_id);

UPDATE copy_employees
SET first_name = null;

SELECT * FROM copy_employees;

CREATE INDEX emp_last_name_idx
ON employee(last_name);

/*CREATE SEQUENCE seq_name
    [INCREMENT BY n]
    [START WITH a1]
    [{MAXVALUE Kn} | {NOMAXVALUE}]
    [{MINVALUE K1} | {NOMINVALUE}]
    [{CYCLE} | {NOCYCLE}]
    [CACHE} | {NOCACHE}]*/
    
CREATE SEQUENCE id_seq
  INCREMENT BY 25
  START WITH 50
  MINVALUE 50 
  MAXVALUE 100 
  CYCLE 
  CACHE 2;
  
SELECT id_seq.NEXTVAL
FROM dual
CONNECT BY level <= 5;

CREATE SEQUENCE mi_seq
  INCREMENT BY 10
  START WITH 120
  MAXVALUE 9999
  NOCYCLE 
  NOCACHE;
  
CREATE TABLE avtoraqam(
    id NUMBER PRIMARY KEY,
    call NUMBER );
    
INSERT INTO avtoraqam VALUES (mi_seq.NEXTVAL, 10);
INSERT INTO avtoraqam VALUES (mi_seq.NEXTVAL, 15);
INSERT INTO avtoraqam VALUES (mi_seq.NEXTVAL, 30);

SELECT*FROM avtoraqam;

SELECT mi_seq.CURRVAL
FROM dual;


--Sxemalar
CREATE USER user_name_1 IDENTIFIED BY password_1 ;

CREATE USER c##user_name_1 IDENTIFIED BY password_1 ;

GRANT CREATE SESSION TO c##user_name_1 ;

GRANT CREATE SESSION TO user_name_1 ;
GRANT CREATE TABLE TO user_name_1 ;
GRANT CREATE VIEW TO user_name_1 ;
GRANT CREATE ANY TRIGGER TO user_name_1 ;
GRANT CREATE ANY PROCEDURE TO user_name_1 ;
GRANT CREATE SEQUENCE TO user_name_1 ;
GRANT CREATE SYNONYM TO user_name_1 ;


--Transaction
COMMIT;

CREATE TABLE sonlar (
    col_1 NUMBER,
    col_2 NUMBER
);

INSERT ALL
INTO sonlar VALUES (1,1)
INTO sonlar VALUES (2,4)
INTO sonlar VALUES (3,9)
INTO sonlar VALUES (4,16)
SELECT * FROM dual;

SELECT * FROM SONLAR;

COMMIT;

SET TRANSACTION NAME 'Qator yangilanishi 1' ;

UPDATE sonlar
SET col_2 = 0
WHERE col_1 = 1;

SELECT * FROM SONLAR;

SAVEPOINT next_action_1;

UPDATE sonlar
SET col_2 = -1
WHERE col_1 = 2;

SELECT * FROM SONLAR;

SAVEPOINT next_action_2;

ROLLBACK TO SAVEPOINT next_action_1;

SELECT * FROM SONLAR;

UPDATE sonlar
SET col_2 = -10
WHERE col_1 = 3;

ROLLBACK;

SELECT * FROM SONLAR;

INSERT ALL
INTO sonlar VALUES (5,25)
INTO sonlar VALUES (6,36)
SELECT * FROM dual;

COMMIT;

SELECT * FROM sonlar;

DELETE FROM sonlar
WHERE col_1 = 6;

SELECT * FROM sonlar;

COMMIT;


--PROCEDURE
CREATE OR REPLACE PROCEDURE print_contact(
    p_person_id NUMBER )
IS
   r_contact persons%ROWTYPE;
BEGIN
   -- get contact based on customer id
    SELECT *
    INTO r_contact
    FROM persons
    WHERE person_id = p_person_id;

    -- print out contact’s information
    dbms_output.put_line( r_contact.first_name || '' ||
    r_contact.last_name || '<' || r_contact.contact ||'>' );

EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line( SQLERRM );
END;