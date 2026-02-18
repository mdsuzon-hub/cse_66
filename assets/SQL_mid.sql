-- SQL Statements

-- SQL SELECT Statement
    -- The SELECT statement is used to select data from a database.
    SELECT * FROM Customers;                                -- All the columns from the Customers table
    SELECT CustomerID, Country, PostalCode FROM Customers;
    SELECT column1, column2, ... FROM table_name;

-- SQL SELECT DISTINCT
    -- The SELECT DISTINCT statement is used to return only distinct (different) values.
    SELECT DISTINCT Country FROM Customers;                 -- Distinct (different) values
    SELECT COUNT(DISTINCT Country) FROM Customers;          -- Number of Distinct value

-- SQL WHERE Clause
    -- It is used to extract only those records that fulfill a specified condition.
    SELECT * FROM Customers WHERE Country = 'Mexico';       -- Condition Country='Mexico'
    SELECT * FROM Customers WHERE CustomerID > 80;          -- Condition x > 80
        -- Operators can be used in the WHERE clause:
            -- =	    Equal	
            -- >	    Greater than	
            -- <	    Less than	
            -- >=	    Greater than or equal	
            -- <=	    Less than or equal	
            -- <>	    Not equal. Note: In some versions of SQL this operator may be written as !=	
            -- BETWEEN	Between a certain range	
            -- LIKE	    Search for a pattern	
            -- IN	    To specify multiple possible values for a column

-- SQL ORDER BY Keyword
    -- used to sort the result-set in ascending or descending order.
    SELECT * FROM Customers ORDER BY Country;                           -- Order alphabetically
    SELECT * FROM OrderDetails ORDER BY Quantity;                       -- Sort by Quantity number (Ascending order)
    SELECT * FROM OrderDetails ORDER BY Quantity DESC;                  -- Sort by Quantity number (Descending order)
    SELECT * FROM OrderDetails ORDER BY Quantity, ProductID;            -- Order by Quantity, and if equal, then by ProductID.
    SELECT * FROM OrderDetails ORDER BY Quantity DESC, ProductID ASC;   -- Using Both ASC and DESC

-- SQL AND Operator
    -- The AND operator filters records using multiple conditions. (All Conditions Must Be True)
    SELECT * FROM Customers WHERE Country = 'Germany' AND CustomerID > 40;
    SELECT * FROM Customers WHERE Country = 'Germany' AND CustomerName LIKE 'D%';
    SELECT * FROM Customers WHERE Country = 'Germany' AND CustomerName LIKE 'D%' AND City = 'Aachen';

-- SQL OR Operator
    -- The OR operator filters records if at least one condition is true. (+ Conditions Must Be True)
    SELECT * FROM Customers WHERE Country = 'Germany' OR CustomerID > 40;
    SELECT * FROM Customers WHERE Country = 'Germany' OR CustomerName LIKE 'D%';

-- SQL NOT Operator
    -- Reverses a condition, returning the opposite (negative) result.
    SELECT * FROM Customers WHERE NOT Country = 'Germany';
    SELECT * FROM Customers WHERE NOT CustomerName LIKE 'A%';               -- NOT LIKE
    SELECT * FROM Customers WHERE NOT CustomerID BETWEEN 10 AND 20;         -- NOT BETWEEN
    SELECT * FROM Customers WHERE City NOT IN ('Paris', 'London');          -- NOT IN
    SELECT * FROM Customers WHERE NOT CustomerID > 50;                      -- NOT Greater Than  
    SELECT * FROM CustomersWHERE NOT CustomerId < 50;                       -- NOT Less Than
    SELECT * FROM Customers WHERE NOT Country = 'Germany' AND NOT CustomerID BETWEEN 10 AND 20; 

-- SQL INSERT INTO Statement
    -- INSERT INTO statement is used to insert new records in a table.
    INSERT INTO table_name (column1, column2, column3, ...)
    VALUES 
    (value1, value2, value3, ...),
    (value1, value2, value3, ...);

-- SQL NULL Values
    -- A field with a NULL value is a field with no value.
    SELECT column_names FROM table_name WHERE column_name IS NULL;      -- IS NULL Syntax
    SELECT column_names FROM table_name WHERE column_name IS NOT NULL;  -- IS NOT NULL Syntax

-- SQL UPDATE Statement
    -- UPDATE statement is used to modify the existing records in a table.
    UPDATE table_name
    SET column1 = value1, column2 = value2, ...
    WHERE condition;

-- SQL DELETE Statement
    -- DELETE statement is used to delete existing records in a table.
    DELETE FROM table_name WHERE condition;

-- SQL SELECT TOP Clause
    -- SELECT TOP clause is used to specify the number of records to return.
    SELECT TOP 3 * FROM Customers;

-- SQL Aggregate Functions
    -- Function that performs a calculation on a set of values, and returns a single value.
    MIN()   -- returns the smallest value within the selected column
        SELECT MIN(Price) FROM Products;
    MAX()   -- returns the largest value within the selected column
        SELECT MAX(Price) FROM Products;
    COUNT() -- returns the number of rows in a set
        SELECT COUNT(*) FROM Products;
    SUM()   -- returns the total sum of a numerical column
        SELECT SUM(Quantity) FROM OrderDetails;
    AVG()   -- returns the average value of a numerical column
        SELECT AVG(Price) FROM Products;

-- SQL LIKE Operator
    -- Used in a WHERE clause to search for a specified pattern in a column.
    SELECT * FROM Customers WHERE CustomerName LIKE 'a%';       -- Start with "a"
    SELECT * FROM Customers WHERE CustomerName LIKE 'a__%';     -- Start with "a" and are at least 3 characters
    SELECT * FROM Customers WHERE city LIKE 'L_nd__';

    -- SQL Wildcard Characters
        %	-- Represents zero or more characters
        _	-- Represents a single character
        []	-- Represents any single character within the brackets *
        ^	-- Represents any character not in the brackets *
        -	-- Represents any single character within the specified range *
        {}	-- Represents any escaped character **

-- SQL IN Operator
    -- IN operator allows you to specify multiple values in a WHERE clause.
    SELECT * FROM Customers WHERE Country IN ('Germany', 'France', 'UK');

-- The SQL BETWEEN Operator
    -- ETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
    SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;
    SELECT * FROM Products WHERE Price BETWEEN 10 AND 20 AND CategoryID IN (1,2,3);

-- SQL GROUP BY Statement
    -- GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
    SELECT column_name(s)
    FROM table_name
    WHERE condition
    GROUP BY column_name(s)
    ORDER BY column_name(s);

    SELECT COUNT(CustomerID), Country
    FROM Customers
    GROUP BY Country;

-- SQL HAVING Clause
    -- HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
    SELECT COUNT(CustomerID), Country
    FROM Customers
    GROUP BY Country
    HAVING COUNT(CustomerID) > 5;

    SELECT COUNT(CustomerID), Country
    FROM Customers
    GROUP BY Country
    HAVING COUNT(CustomerID) > 5
    ORDER BY COUNT(CustomerID) DESC;
