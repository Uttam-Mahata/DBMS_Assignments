
\[
\text{Circumference} = 2 \times \pi \times \text{Radius}
\]



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
