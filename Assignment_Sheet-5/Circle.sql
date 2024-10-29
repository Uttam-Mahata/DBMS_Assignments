-- Write a pl/sql block for the following:
-- Insert data into a table containing two attributes namely radius & circumference of circles.
-- You may get different values of radius either from keyboard or you may generate different
-- values.




CREATE TABLE Circle (
    radius number,
    circumference number
);

SET SERVEROUTPUT ON;
DECLARE
    radius number;
    circumference number;
BEGIN
    FOR i IN 1..5 LOOP
        radius := i;
        circumference := 2 * 3.14 * radius;
        INSERT INTO Circle VALUES (radius, circumference);
    END LOOP;
    COMMIT;
END;


-- Update the balance of each customer from a cust_acct table showing withdrawal of Rs.1000/-
-- as service charge provided that the customer balance shows at least Rs.1000/-.


CREATE TABLE cust_acct (
    id number,
    customer_name varchar(255),
    cust_id number,
    balance number,
    constraint cust_acct_pk primary key (id)
);

INSERT INTO cust_acct (id, customer_name, cust_id, balance) VALUES (1, 'ANURAG GHOSH', 1, 17000);
INSERT INTO cust_acct (id, customer_name, cust_id, balance) VALUES (2, 'ABHILASH KUMAR', 2, 19000);
INSERT INTO cust_acct (id, customer_name, cust_id, balance) VALUES (3, 'ARNAV SEN', 3, 12000);
INSERT INTO cust_acct (id, customer_name, cust_id, balance) VALUES (4, 'ANIKET KUMAR', 4, 11000);
INSERT INTO cust_acct (id, customer_name, cust_id, balance) VALUES (5, 'SIDDHARTH SEN', 5, 18000);
INSERT INTO cust_acct (id, customer_name, cust_id, balance) VALUES (6, 'PRAVEEN KUMAR', 6, 19000);
INSERT INTO cust_acct (id, customer_name, cust_id, balance) VALUES (7, 'SOURAV SEN', 7, 12000);
INSERT INTO cust_acct (id, customer_name, cust_id, balance) VALUES (8, 'AKHIL SINGH', 8, 11000);
INSERT INTO cust_acct (id, customer_name, cust_id, balance) VALUES (9, 'PRANAB PAL', 9, 18000);

SET SERVEROUTPUT ON;
DECLARE
    balance number;
BEGIN
    FOR i IN 1..5 LOOP
        SELECT balance INTO balance FROM cust_acct WHERE id = i;
        IF balance >= 1000 THEN
            UPDATE cust_acct SET balance = balance - 1000 WHERE id = i;
        END IF;
    END LOOP;
    COMMIT;
END;


-- Update the salary of each employee from EMP table by 15% using cursor.

CREATE TABLE EMP (
    id number,
    name varchar(255),
    salary number,
    constraint emp_pk primary key (id)
);

INSERT INTO EMP (id, name, salary) VALUES (1, 'ANURAG GHOSH', 1700000);
INSERT INTO EMP (id, name, salary) VALUES (2, 'ABHILASH KUMAR', 190000);
INSERT INTO EMP (id, name, salary) VALUES (3, 'ARNAV SEN', 120000);
INSERT INTO EMP (id, name, salary) VALUES (4, 'ANIKET KUMAR', 110000);
INSERT INTO EMP (id, name, salary) VALUES (5, 'SIDDHARTH SEN', 180000);
INSERT INTO EMP (id, name, salary) VALUES (6, 'PRAVEEN KUMAR', 190000);
INSERT INTO EMP (id, name, salary) VALUES (7, 'SOURAV SEN', 1200000);
INSERT INTO EMP (id, name, salary) VALUES (8, 'AKHIL SINGH', 1100000);
INSERT INTO EMP (id, name, salary) VALUES (9, 'PRANAB PAL', 1800000);
INSERT INTO EMP (id, name, salary) VALUES (10, 'SUCHANA HAZRA', 1700000);
INSERT INTO EMP (id, name, salary) VALUES (11, 'RITABRATA BHATTACHARYA', 12000000);
INSERT INTO EMP (id, name, salary) VALUES (12, 'SOHAM HALDAR', 1100000);
-- Update the salary of each employee from EMP table by 15% using cursor.

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c1 IS SELECT * FROM EMP;
    emp_record EMP%ROWTYPE;
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO emp_record;
        EXIT WHEN c1%NOTFOUND;
        UPDATE EMP SET salary = salary + (salary * 0.15) WHERE id = emp_record.id;
    END LOOP;
    CLOSE c1;
    COMMIT;
END;



-- Update the balance in the ITEM_MSTR table each time a transaction takes place in the
-- ITEM_TR table. If this item_id is already present in the ITEM_MSTR table an update is
-- performed to decrease the balance by the quantity specified in the ITEM_TR table.
-- If the item_id is not present in the ITEM_MSTR table, the tuple is to be inserted.


CREATE TABLE ITEM_MSTR (
    item_id number,
    item_name varchar(255),
    balance number,
    constraint item_mstr_pk primary key (item_id)
);

CREATE TABLE ITEM_TR (
    item_id number,
    quantity number,
    constraint item_tr_pk primary key (item_id)
);

INSERT INTO ITEM_MSTR (item_id, item_name, balance) VALUES (1, 'BRITANNIA BISCUIT', 100);
INSERT INTO ITEM_MSTR (item_id, item_name, balance) VALUES (2, 'DETTOL SOAP', 200);
INSERT INTO ITEM_MSTR (item_id, item_name, balance) VALUES (3, 'PUFFED RICE', 300);
INSERT INTO ITEM_MSTR (item_id, item_name, balance) VALUES (4, 'RICE', 400);
INSERT INTO ITEM_MSTR (item_id, item_name, balance) VALUES (5, 'EMAMI HEALTHY & TASTY MUSTARD OIL', 500);

INSERT INTO ITEM_TR (item_id, quantity) VALUES (1, 10);
INSERT INTO ITEM_TR (item_id, quantity) VALUES (2, 20);
INSERT INTO ITEM_TR (item_id, quantity) VALUES (3, 30);
INSERT INTO ITEM_TR (item_id, quantity) VALUES (4, 40);

SET SERVEROUTPUT ON;
DECLARE
    balance number;
BEGIN

    FOR i IN 1..5 LOOP
        SELECT balance INTO balance FROM ITEM_MSTR WHERE item_id = i;
        IF balance IS NULL THEN
            INSERT INTO ITEM_MSTR (item_id, item_name, balance) VALUES (i, 'ITEM', 0);
        END IF;
    END LOOP;

    FOR i IN 1..4 LOOP
        SELECT balance INTO balance FROM ITEM_MSTR WHERE item_id = i;
        UPDATE ITEM_MSTR SET balance = balance - (SELECT quantity FROM ITEM_TR WHERE item_id = i) WHERE item_id = i;
    END LOOP;
    COMMIT;
END;


-- Write a PROCEDURE for raising salary of some employee by some amount. The
-- PROCEDURE to be written may carry two parameters emp_id and amt to be raised. Include
-- two exceptions which will be raised when either emp_id is not present or salary is NULL.

CREATE TABLE EMPLOYEE (
    id number,
    name varchar(255),
    salary number,
    constraint employee_pk primary key (id)
);

INSERT INTO EMPLOYEE (id, name, salary) VALUES (1, 'ANURAG GHOSH', 1700000);
INSERT INTO EMPLOYEE (id, name, salary) VALUES (2, 'ABHILASH KUMAR', 190000);
INSERT INTO EMPLOYEE (id, name, salary) VALUES (3, 'ARNAV SEN', 120000);
INSERT INTO EMPLOYEE (id, name, salary) VALUES (4, 'ANIKET KUMAR', 110000);
INSERT INTO EMPLOYEE (id, name, salary) VALUES (5, 'SIDDHARTH SEN', 180000);
INSERT INTO EMPLOYEE (id, name, salary) VALUES (6, 'PRAVEEN KUMAR', 190000);
INSERT INTO EMPLOYEE (id, name, salary) VALUES (7, 'SOURAV SEN', 1200000);
INSERT INTO EMPLOYEE (id, name, salary) VALUES (8, 'AKHIL SINGH', 1100000);
INSERT INTO EMPLOYEE (id, name, salary) VALUES (9, 'PRANAB PAL', 1800000);
INSERT INTO EMPLOYEE (id, name, salary) VALUES (10, 'SUCHANA HAZRA', 1700000);
INSERT INTO EMPLOYEE (id, name, salary) VALUES (11, 'RITABRATA BHATTACHARYA', 12000000);
INSERT INTO EMPLOYEE (id, name, salary) VALUES (12, 'SOHAM HALDAR', 1100000);


SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE raise_salary (emp_id IN NUMBER, amt IN NUMBER) AS
    salary number;
BEGIN
    SELECT salary INTO salary FROM EMPLOYEE WHERE id = emp_id;
    IF salary IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary is NULL');
    ELSE
        UPDATE EMPLOYEE SET salary = salary + amt WHERE id = emp_id;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Employee ID not found');
END;


CALL raise_salary(1, 10000);
CALL raise_salary(2, 10000);
CALL raise_salary(3, 10000);
CALL raise_salary(4, 10000);
CALL raise_salary(5, 10000);
CALL raise_salary(6, 10000);
CALL raise_salary(7, 10000);
CALL raise_salary(8, 10000);
