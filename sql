-- Create the database
CREATE DATABASE cafe_db;
USE cafe_db;

-- Create the CoffeeTypes table
CREATE TABLE CoffeeTypes (
    coffee_id INT AUTO_INCREMENT PRIMARY KEY,
    coffee_name VARCHAR(100)
);

-- Create the CookieTypes table
CREATE TABLE CookieTypes (
    cookie_id INT AUTO_INCREMENT PRIMARY KEY,
    cookie_name VARCHAR(100)
);

-- Create the Employees table
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100),
    coffee_id INT,
    cookie_id INT,
    FOREIGN KEY (coffee_id) REFERENCES CoffeeTypes(coffee_id),
    FOREIGN KEY (cookie_id) REFERENCES CookieTypes(cookie_id)
);
-- Insert sample data into CoffeeTypes
INSERT INTO CoffeeTypes (coffee_name) VALUES
('Espresso'),
('Latte'),
('Cappuccino');

-- Insert sample data into CookieTypes
INSERT INTO CookieTypes (cookie_name) VALUES
('Chocolate Chip'),
('Oatmeal Raisin'),
('Peanut Butter');

-- Insert sample data into Employees
INSERT INTO Employees (employee_name, coffee_id, cookie_id) VALUES
('Alice', 1, 2), -- Alice makes Espresso and Oatmeal Raisin cookies
('Bob', 2, 1),   -- Bob makes Latte and Chocolate Chip cookies
('Charlie', 3, NULL), -- Charlie makes Cappuccino but no cookies
('Diana', NULL, 3); -- Diana makes no coffee but Peanut Butter cookies
SELECT 
    Employees.employee_name,
    CoffeeTypes.coffee_name,
    CookieTypes.cookie_name
FROM 
    Employees
INNER JOIN 
    CoffeeTypes ON Employees.coffee_id = CoffeeTypes.coffee_id
INNER JOIN 
    CookieTypes ON Employees.cookie_id = CookieTypes.cookie_id;
SELECT 
    Employees.employee_name,
    CoffeeTypes.coffee_name
FROM 
    Employees
LEFT JOIN 
    CoffeeTypes ON Employees.coffee_id = CoffeeTypes.coffee_id;
SELECT 
    CookieTypes.cookie_name,
    Employees.employee_name
FROM 
    CookieTypes
RIGHT JOIN 
    Employees ON CookieTypes.cookie_id = Employees.cookie_id;
SELECT 
    Employees.employee_name,
    CoffeeTypes.coffee_name,
    CookieTypes.cookie_name
FROM 
    Employees
LEFT JOIN 
    CoffeeTypes ON Employees.coffee_id = CoffeeTypes.coffee_id
LEFT JOIN 
    CookieTypes ON Employees.cookie_id = CookieTypes.cookie_id

UNION

SELECT 
    Employees.employee_name,
    CoffeeTypes.coffee_name,
    CookieTypes.cookie_name
FROM 
    CoffeeTypes
RIGHT JOIN 
    Employees ON CoffeeTypes.coffee_id = Employees.coffee_id
RIGHT JOIN 
    CookieTypes ON Employees.cookie_id = CookieTypes.cookie_id;
