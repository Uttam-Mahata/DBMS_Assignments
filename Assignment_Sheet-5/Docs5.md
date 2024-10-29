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
