use Question_set

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES 
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA'),
(5, 'Eve', 'Australia');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID)
VALUES 
(101, 1, '2024-08-01', 1001),
(102, 1, '2024-08-03', 1002),
(103, 2, '2024-08-04', 1001),
(104, 3, '2024-08-05', 1003),
(105, 5, '2024-08-06', 1004);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1001, 'Laptop', 1000),
(1002, 'Smartphone', 700),
(1003, 'Tablet', 500),
(1004, 'Headphones', 200),
(1005, 'Smartwatch', 300);

select * from Orders
select * from Products
select * from Customers


--1) Write an SQL query to find the names of customers who have placed an order.



--2) Find the list of customers who have not placed any orders.

select CustomerName from Customers c left join Orders o on c.CustomerID=o.CustomerID where o.OrderID is null

--3) List all orders along with the product name and price.

select * from Orders o join Products p on o.ProductID=p.ProductID

--4) Find the names of customers and their orders, including customers who haven't placed any orders.

select * from Customers c left join Orders o on c.CustomerID=o.CustomerID
--5) Retrieve a list of products that have never been ordered.

select * from Products p left join Orders o on p.ProductID=o.ProductID where o.ProductID is null
--6) Find the total number of orders placed by each customer.



--OR 


--7) Display the customers, the products they've ordered, and the order date. Include customers who haven't placed any orders.






-- 8) Identify pairs of customers who live in the same cuntry

select x.CustomerName, y.CustomerName from Customers x join Customers y  on x.Country=y.Country and x.CustomerID<>y.CustomerID and x.CustomerID>y.CustomerID


--9)Find the customer who has spend the most on their orders 

select customername from 
(Select CustomerName, sum(price) [amount spent], DENSE_RANK() over (order by sum(price) desc) [Ranking]
from Customers c inner join Orders o on c.CustomerID=o.CustomerID inner join Products p on o.ProductID=p.ProductID
group by CustomerName) m where Ranking=1


--10) find the customer who have orderd more than one type of orders 

Select Customername, COUNT(productid) from Customers c join Orders o on c.CustomerID=o.CustomerID group by CustomerName
having count (productid)>1

--11) List all products and their corresponding orders, using a RIGHT JOIN,  including product that  never have been ordered.

Select orderid, p.productid,productname from orders o right join Products p on o.ProductID=p.ProductID

--12) Retrived all orders placed by customers from USA

Select orderid, country from Customers c inner join Orders o on o.CustomerID=c.CustomerID where country in ('USA')

--13) FInd the name of customers who have ordered a product priced above $500
Select CustomerName, price from customers c inner join orders o on o.CustomerID=c.CustomerID 
inner join Products p on p.ProductID=o.ProductID where price >500

--14) Find customers who ordered the same product more than once 

select distinct m.customerName from
(select customername, productid, count(orderid)[count] from Customers c inner join Orders o on c.CustomerID=o.CustomerID
group by CustomerName, ProductID
having COUNT(orderid)>1)m