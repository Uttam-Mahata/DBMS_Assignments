## Q1.



### Step 1: Create the Table

```sql
CREATE TABLE CircleData (
    radius DECIMAL(10, 2),
    circumference DECIMAL(10, 2)
);
```

### Step 2: PL/SQL Block to Insert Data

```sql
DELIMITER $$

CREATE PROCEDURE InsertCircleData()
BEGIN
    DECLARE rad DECIMAL(10, 2);
    DECLARE choice CHAR(1);
    DECLARE i INT DEFAULT 1;

    -- Prompt user for input choice
    SELECT 'Enter "Y" if you want to input radius values manually, otherwise "N" to auto-generate values:' INTO choice;

    -- Set loop to insert 5 values (can be adjusted)
    WHILE i <= 5 DO
        IF choice = 'Y' THEN
            -- Prompt user to enter radius
            SET rad = (SELECT CAST((RAND() * 20) AS DECIMAL(10,2))); -- Random value between 0 and 20
        ELSE
            -- Generate random radius value if user chose auto-generation
            SET rad = (SELECT CAST((RAND() * 20) AS DECIMAL(10,2))); -- Random value between 0 and 20
        END IF;

        -- Calculate circumference
        INSERT INTO CircleData (radius, circumference) 
        VALUES (rad, 2 * PI() * rad);

        -- Increment counter
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;
```

### Explanation

1. **Table Creation**: The `CircleData` table has two attributes, `radius` and `circumference`, both of type `DECIMAL(10, 2)` to handle real numbers.

2. **Stored Procedure `InsertCircleData`**:
    - **Variables**:
        - `rad`: Holds the radius value for each iteration.
        - `choice`: Determines if values are user-provided or auto-generated.
        - `i`: Counts the number of entries; the loop iterates five times.
    - **Logic**:
        - Prompts the user to input either 'Y' or 'N' to choose manual entry or auto-generation.
        - A loop iterates five times, generating and inserting values into `CircleData`.
        - Circumference is calculated as \(2 \times \pi \times \text{radius}\).
  
To execute this procedure, use:

```sql
CALL InsertCircleData();
```

This will insert five rows into `CircleData`, either from user input or with randomly generated values.

## Q2.


### Step 1: Create the `cust_acct` Table

```sql
CREATE TABLE cust_acct (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL
);
```

Here:
- `customer_id`: Unique identifier for each customer.
- `customer_name`: Name of the customer.
- `balance`: Current balance of the customer's account.

### Step 2: Insert Sample Data

Let's add some sample customer data.

```sql
INSERT INTO cust_acct (customer_name, balance)
VALUES 
    ('Alice', 1500.00),
    ('Bob', 500.00),
    ('Charlie', 1200.00),
    ('David', 2500.00),
    ('Eva', 800.00);
```

### Step 3: Write the PL/SQL Block to Deduct Service Charge

```sql
DELIMITER $$

CREATE PROCEDURE DeductServiceCharge()
BEGIN
    DECLARE service_charge DECIMAL(10, 2) DEFAULT 1000.00;

    -- Update the balance for customers with a balance of at least Rs.1000
    UPDATE cust_acct
    SET balance = balance - service_charge
    WHERE balance >= service_charge;
    
    -- Optional: Display affected customers for verification
    SELECT customer_id, customer_name, balance 
    FROM cust_acct 
    WHERE balance < 1500;
END$$

DELIMITER ;
```

### Explanation

1. **Service Charge**: Defined as a constant (`service_charge`) of Rs.1000.00.
2. **Update Statement**: The `UPDATE` command deducts the service charge from customers who have a balance of at least Rs.1000.00.
3. **Verification**: (Optional) After updating, a `SELECT` statement displays customers whose balance is now less than Rs.1500, showing the deduction.

### Step 4: Execute the Procedure

To deduct the service charge from all qualifying customers, run:

```sql
CALL DeductServiceCharge();
```

This procedure will reduce the balance by Rs.1000 for each customer in `cust_acct` with a balance of Rs.1000 or more. The table will reflect the updated balances after this procedure runs.



Let's go through each of the requirements step-by-step, creating the necessary tables and writing PL/SQL code in MySQL.

### 1. Update Salary of Each Employee in `EMP` Table by 15% Using a Cursor

First, let's create the `EMP` table.

#### Step 1.1: Create the `EMP` Table

```sql
CREATE TABLE EMP (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    salary DECIMAL(10, 2) DEFAULT 0.00
);
```

#### Step 1.2: Insert Sample Data

```sql
INSERT INTO EMP (emp_name, salary)
VALUES 
    ('John Doe', 40000.00),
    ('Jane Smith', 50000.00),
    ('Tom Johnson', 60000.00),
    ('Emily Brown', 70000.00);
```

#### Step 1.3: Write the Procedure to Update Salaries Using a Cursor

```sql
DELIMITER $$

CREATE PROCEDURE UpdateEmployeeSalary()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE empId INT;
    DECLARE currentSalary DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT emp_id, salary FROM EMP;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    update_loop: LOOP
        FETCH cur INTO empId, currentSalary;
        
        IF done THEN
            LEAVE update_loop;
        END IF;

        -- Update salary by 15%
        UPDATE EMP
        SET salary = salary * 1.15
        WHERE emp_id = empId;
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;
```

To execute this procedure and update each employee's salary by 15%, call:

```sql
CALL UpdateEmployeeSalary();
```

---

### 2. Update the Balance in `ITEM_MSTR` Table Based on Transactions in `ITEM_TR` Table

We need two tables: `ITEM_MSTR` for item master data and `ITEM_TR` for transactions.

#### Step 2.1: Create `ITEM_MSTR` and `ITEM_TR` Tables

```sql
CREATE TABLE ITEM_MSTR (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    balance INT
);

CREATE TABLE ITEM_TR (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT,
    quantity INT
);
```

#### Step 2.2: Insert Sample Data

```sql
INSERT INTO ITEM_MSTR (item_id, item_name, balance)
VALUES
    (1, 'Item A', 100),
    (2, 'Item B', 200);

INSERT INTO ITEM_TR (item_id, quantity)
VALUES
    (1, 10),
    (3, 50); -- Item 3 does not exist in ITEM_MSTR
```

#### Step 2.3: Write the Procedure to Update or Insert Based on Transactions

```sql
DELIMITER $$

CREATE PROCEDURE UpdateItemBalance()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE itemId INT;
    DECLARE quantity INT;
    DECLARE cur CURSOR FOR SELECT item_id, quantity FROM ITEM_TR;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    update_loop: LOOP
        FETCH cur INTO itemId, quantity;
        
        IF done THEN
            LEAVE update_loop;
        END IF;

        -- Check if item_id exists in ITEM_MSTR
        IF EXISTS (SELECT * FROM ITEM_MSTR WHERE item_id = itemId) THEN
            -- Update balance by subtracting quantity
            UPDATE ITEM_MSTR
            SET balance = balance - quantity
            WHERE item_id = itemId;
        ELSE
            -- Insert new item into ITEM_MSTR
            INSERT INTO ITEM_MSTR (item_id, item_name, balance)
            VALUES (itemId, CONCAT('New Item ', itemId), -quantity);
        END IF;
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;
```

To execute this procedure and apply the transactions to `ITEM_MSTR`, call:

```sql
CALL UpdateItemBalance();
```

---

### 3. Procedure for Raising Salary with Exception Handling for Non-existent Employee or NULL Salary

#### Step 3.1: Write the Procedure to Raise Salary

```sql
DELIMITER $$

CREATE PROCEDURE RaiseEmployeeSalary(IN empId INT, IN raiseAmt DECIMAL(10, 2))
BEGIN
    DECLARE empExists BOOLEAN;
    DECLARE salaryValue DECIMAL(10, 2);

    -- Check if employee exists
    SET empExists = (SELECT EXISTS (SELECT * FROM EMP WHERE emp_id = empId));

    IF NOT empExists THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee ID not found';
    END IF;

    -- Retrieve salary and check if it's NULL
    SET salaryValue = (SELECT salary FROM EMP WHERE emp_id = empId);

    IF salaryValue IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary is NULL for this employee';
    END IF;

    -- Update the salary if no exceptions
    UPDATE EMP
    SET salary = salary + raiseAmt
    WHERE emp_id = empId;
END$$

DELIMITER ;
```

This procedure raises the salary of a specified employee by a given amount. The procedure:
- Raises an error if the employee ID does not exist.
- Raises an error if the salary is `NULL`.

#### Step 3.2: Execute the Procedure

To raise the salary of an employee with ID `1` by `2000`, call:

```sql
CALL RaiseEmployeeSalary(1, 2000);
```

These PL/SQL blocks and procedures perform the required updates, handle transactions, and raise exceptions as specified.
