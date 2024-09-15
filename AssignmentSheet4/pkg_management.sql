use pkg_management;

CREATE TABLE TBL_CUSTOMER (
    CUSTOMER_ID INT CHECK ( CUSTOMER_ID < 10000 AND CUSTOMER_ID > 100 ) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(255),
    ANNUAL_REVENUE DECIMAL(10, 2),
    CUSTOMER_TYPE ENUM ('MANUFACTURER',  'WHOLESALER', 'RETAILER')
);

CREATE TABLE TBL_TRUCK_INFO (
    TRUCK_NO VARCHAR(255) PRIMARY KEY,
    DRIVER_NAME VARCHAR(255)

);

CREATE TABLE TBL_CITY (
    CITY_NAME VARCHAR(255) PRIMARY KEY,
    CITY_POPULATION INT

);

CREATE TABLE TBL_SHIPMENT_DETAILS (
    SHIPMENT_NO INT PRIMARY KEY,
    CUSTOMER_ID INT,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES TBL_CUSTOMER(CUSTOMER_ID) ON DELETE CASCADE,
    WEIGHT DECIMAL(10, 2) CHECK ( WEIGHT > 0 AND WEIGHT < 1000 ),
    TRUCK_NO VARCHAR(255),
    FOREIGN KEY (TRUCK_NO) REFERENCES TBL_TRUCK_INFO(TRUCK_NO) ON DELETE SET NULL,
    DESTINATION_CITY VARCHAR(255),
    SHIPPING_DATE DATE

);


USE pkg_management;
INSERT INTO TBL_CUSTOMER VALUES (1001, 'RAJESH SOREN', 100000, 'MANUFACTURER');
INSERT INTO TBL_CUSTOMER VALUES (1002, 'ABHI SAHA', 200000, 'WHOLESALER');
INSERT INTO TBL_CUSTOMER VALUES (1003, 'PRANAB MAHATA', 300000, 'RETAILER');
-- ADD NEW DATA
INSERT INTO TBL_CUSTOMER VALUES (1004, 'ABHILASH KUMAR', 100000, 'MANUFACTURER');
INSERT INTO TBL_CUSTOMER VALUES (1005, 'RAJESH KUMAR', 200000, 'WHOLESALER');
INSERT INTO TBL_CUSTOMER VALUES (1006,'KARAN KUMAR', 250000, 'RETAILER' );
INSERT INTO TBL_CUSTOMER VALUES (1007, 'RAJESH SINGH', 200000, 'WHOLESALER');

INSERT INTO TBL_CUSTOMER VALUES (1008, 'ANURAG GHOSH', 600000, 'MANUFACTURER');

INSERT INTO TBL_CUSTOMER VALUES (1009, 'PRAVEEN KUMAR', 200000, 'WHOLESALER');
INSERT INTO TBL_CUSTOMER VALUES (1010,'PHAYANSH SAHA', 250000, 'RETAILER' );

INSERT INTO TBL_TRUCK_INFO VALUES ('WB342000', 'KAMALESH SINGH');
INSERT INTO TBL_TRUCK_INFO VALUES ('WB342051', 'RAJESH KUMAR');
INSERT INTO TBL_TRUCK_INFO VALUES ('WB342302', 'ALOK KUMAR');
INSERT INTO TBL_TRUCK_INFO VALUES ('WB346003', 'SUBHAM KUMAR');
INSERT INTO TBL_TRUCK_INFO VALUES ('WB342004', 'ARITRA PAL');
INSERT INTO TBL_TRUCK_INFO VALUES ('WB342005', 'PRITAM SAHA');
INSERT INTO TBL_TRUCK_INFO VALUES ('WB342006', 'AUROBINDA SINGH');


-- ADD DATA INTO TBL_CITY TABLE (USE INDIAN CITY NAMES)
INSERT INTO TBL_CITY VALUES ('KOLKATA', 5000000);
INSERT INTO TBL_CITY VALUES ('DELHI', 10000000);
INSERT INTO TBL_CITY VALUES ('MUMBAI', 8000000);
INSERT INTO TBL_CITY VALUES ('CHENNAI', 6000000);
INSERT INTO TBL_CITY VALUES ('BANGALORE', 7000000);
INSERT INTO TBL_CITY VALUES ('HYDERABAD', 6000000);
INSERT INTO TBL_CITY VALUES ('PUNE', 5000000);
INSERT INTO TBL_CITY VALUES ('JAIPUR', 4000000);
INSERT INTO TBL_CITY VALUES ('LUCKNOW', 3000000);
INSERT INTO TBL_CITY VALUES ('PATNA', 2000000);


-- INSERT INTO TBL_SHIPMENT_DETAILS TABLE
INSERT INTO TBL_SHIPMENT_DETAILS VALUES (1001, 1001, 100.00, 'WB342000', 'KOLKATA', '2024-01-01');
INSERT INTO TBL_SHIPMENT_DETAILS VALUES (1002, 1002, 200.00, 'WB342051', 'DELHI', '2024-01-02');
INSERT INTO TBL_SHIPMENT_DETAILS VALUES (1003, 1003, 300.00, 'WB342302', 'MUMBAI', '2024-01-03');
INSERT INTO TBL_SHIPMENT_DETAILS VALUES (1004, 1004, 400.00, 'WB346003', 'CHENNAI', '2024-01-04');
INSERT INTO TBL_SHIPMENT_DETAILS VALUES (1005, 1005, 500.00, 'WB342004', 'BANGALORE', '2024-01-05');
INSERT INTO TBL_SHIPMENT_DETAILS VALUES (1006, 1006, 600.00, 'WB342005', 'HYDERABAD', '2024-01-06');
INSERT INTO TBL_SHIPMENT_DETAILS VALUES (1007, 1007, 700.00, 'WB342006', 'PUNE', '2024-01-07');
INSERT INTO TBL_SHIPMENT_DETAILS VALUES (1008, 1008, 800.00, 'WB342000', 'JAIPUR', '2024-01-08');
INSERT INTO TBL_SHIPMENT_DETAILS VALUES (1009, 1009, 900.00, 'WB342051', 'LUCKNOW', '2024-01-09');
INSERT INTO TBL_SHIPMENT_DETAILS VALUES (1010, 1010, 1000.00, 'WB342302', 'PATNA', '2024-01-10');




--  Give names of customer who have sent packages (shipments) to Kolkata, Chennai and Mumbai.

SELECT CUSTOMER_NAME FROM TBL_CUSTOMER
WHERE CUSTOMER_ID IN (
    SELECT CUSTOMER_ID FROM TBL_SHIPMENT_DETAILS
    WHERE DESTINATION_CITY IN ('KOLKATA', 'CHENNAI', 'MUMBAI')
);

-- List the names of the driver who have delivered shipments weighing over 200 pounds.
select DRIVER_NAME from TBL_TRUCK_INFO
where TRUCK_NO = (
    select TRUCK_NO from TBL_SHIPMENT_DETAILS
    where WEIGHT > 200
);


-- Retrieve the maximum and minimum weights of the shipments. Rename the output as Max_Weight and Min_Weight respectively.

SELECT MAX(weight) AS Max_Weight, MIN(weight) AS Min_Weight
FROM TBL_SHIPMENT_DETAILS;


--  For each customer, what is the average weight of package sent by the customer?

SELECT CUSTOMER_ID, AVG(WEIGHT) AS AVG_WEIGHT
FROM TBL_SHIPMENT_DETAILS
GROUP BY CUSTOMER_ID;

-- List the names and populations of cities that have received a shipment weighing over 100 pounds.

SELECT CITY_NAME, CITY_POPULATION
FROM TBL_CITY
WHERE TBL_CITY.CITY_NAME IN (
    SELECT DESTINATION_CITY
    FROM TBL_SHIPMENT_DETAILS
    WHERE WEIGHT > 100
);

--  List cities that have received shipments from every customer.

SELECT DESTINATION_CITY
FROM TBL_SHIPMENT_DETAILS
GROUP BY DESTINATION_CITY
HAVING COUNT(DISTINCT CUSTOMER_ID) = (SELECT COUNT(DISTINCT CUSTOMER_ID) FROM TBL_SHIPMENT_DETAILS);

-- For each city, what is the maximum weight of a package sent to that city?

SELECT DESTINATION_CITY, MAX(WEIGHT) AS MAX_WEIGHT
FROM TBL_SHIPMENT_DETAILS
GROUP BY DESTINATION_CITY;

-- List the name and annual revenue of customers whose shipments have been delivered by truck driver ‘IQBAL’.

SELECT CUSTOMER_NAME, ANNUAL_REVENUE
FROM TBL_CUSTOMER
WHERE CUSTOMER_ID IN (
    SELECT CUSTOMER_ID
    FROM TBL_SHIPMENT_DETAILS
    WHERE TRUCK_NO = (
        SELECT TRUCK_NO
        FROM TBL_TRUCK_INFO
        WHERE DRIVER_NAME = 'IQBAL'
    )
);

--  List drivers who have delivered shipments to every city.

-- List drivers who have delivered shipments to every city
SELECT t.DRIVER_NAME
FROM TBL_TRUCK_INFO t
JOIN TBL_SHIPMENT_DETAILS s ON t.TRUCK_NO = s.TRUCK_NO
JOIN TBL_CITY c ON s.DESTINATION_CITY = c.CITY_NAME
GROUP BY t.DRIVER_NAME
HAVING COUNT(DISTINCT s.DESTINATION_CITY) = (SELECT COUNT(*) FROM TBL_CITY);
--  For each city, with population over 1 million, what is the minimum weight of a package sent to that city.

SELECT DESTINATION_CITY, MIN(WEIGHT) AS MIN_WEIGHT
FROM TBL_SHIPMENT_DETAILS
WHERE DESTINATION_CITY IN (
    SELECT CITY_NAME
    FROM TBL_CITY
    WHERE CITY_POPULATION > 1000000
) 
GROUP BY DESTINATION_CITY;


















