-- question 1
SELECT customer.first_name, customer.last_name, state
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN state
ON address.state_id = state.state_id
WHERE state = 'TEXAS';
--Question 2
SELECT customer_id,amount
FROM payment
WHERE amount > 6.99;
--Question 3
SELECT Name
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Invoices
    WHERE TotalAmount > 175
);
--Question 4 
SELECT c.Name AS CustomerName
FROM Customers c
JOIN Addresses a ON c.AddressID = a.AddressID
JOIN City ci ON a.CityID = ci.CityID
WHERE ci.Country = 'Nepal';
--Question 5
SELECT s.StaffID, s.Name, COUNT(t.TransactionID) AS TransactionCount
FROM Staff s
JOIN Transactions t ON s.StaffID = t.StaffID
GROUP BY s.StaffID, s.Name
ORDER BY TransactionCount DESC
LIMIT 1;
--Questioin 6
SELECT m.rating, COUNT(*) AS count_of_movies
FROM Movies m
GROUP BY m.rating
ORDER BY m.rating;
--Question 7
SELECT c.Name AS CustomerName
FROM Customers c
JOIN (
    SELECT CustomerID, COUNT(*) AS PaymentCount
    FROM Invoices
    WHERE TotalAmount > 6.99
    GROUP BY CustomerID
    HAVING COUNT(*) = 1
) AS SinglePayment ON c.CustomerID = SinglePayment.CustomerID;
--Question 8
SELECT COUNT(*) AS FreeRentalsCount
FROM Rentals r
JOIN Stores s ON r.StoreID = s.StoreID
WHERE r.RentalAmount = 0;
