-- 1
SELECT city, phone, country 
FROM offices;

-- 2
SELECT *
FROM orders
WHERE comments LIKE "%FedEx%";

-- 3
SELECT contactFirstName, contactLastName
FROM customers
ORDER by customerName DESC;

-- 4
SELECT *
FROM employees
WHERE jobTitle = "Sales Rep" 
AND (officeCode IN (1, 2, 3)) 
AND (lastName LIKE "%son%" OR firstName LIKE "%son%");


-- 5
SELECT O.orderNumber, C.customerName, C.contactLastName, C.contactFirstName
FROM customers C JOIN orders O 
ON C.customerNumber = O.customerNumber
WHERE C.customerNumber = 124;

-- 6
SELECT O.*, P.productName
FROM orderdetails O JOIN products P
ON O.productCode = P.productCode;

-- 7

-- 8
SELECT C.country, O.*
FROM orders O JOIN customers C
ON O.customerNumber = C.customerNumber
WHERE C.country = "USA" OR C.country = "UK";

-- 9
SELECT O.country, O.state, COUNT(*) AS employee_count
FROM employees E JOIN offices O
ON E.officeCode = O.officeCode
WHERE O.country = "USA"
GROUP BY O.state;

-- 10
SELECT MONTH(orderDate), COUNT(*) as no_of_orders 
FROM orders
WHERE orderDate BETWEEN "2003-01-01" AND "2003-12-31"
GROUP BY MONTH(orderDate);

-- 11
SELECT C.customerName, AVG(P.amount) as average_spent
FROM payments P JOIN customers C
ON P.customerNumber = C.customerNumber
GROUP BY P.customerNumber;

-- 12
SELECT productLine, COUNT(*) as product_count
FROM products
GROUP BY productLine;

-- 13
SELECT *, AVG(amount) AS average_amount
FROM payments
GROUP BY customerNumber
HAVING AVG(amount) > 10000;

-- 14
SELECT productCode, COUNT(*) AS ordered_count
FROM orderdetails
GROUP BY productCode
ORDER BY COUNT(*) DESC
LIMIT 10;