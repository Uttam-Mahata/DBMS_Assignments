-- Write a pl/sql block for the following:
-- Insert data into a table containing two attributes namely radius & circumference of circles.
-- You may get different values of radius either from keyboard or you may generate different
-- values.

CREATE DATABASE CircleDB;
USE CircleDB;

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