--- ASPECT 1D

SELECT Product.product_name Product, Inventory.price_per_unit Price FROM Product
JOIN Inventory ON Product.product_id =Inventory.product_id AND Inventory.price_per_unit < 30 
WHERE Product.category_id = 1 or Product.category_id =2;
select * from Product;

------------------------------------------------------------------------------------------------------
--- ASPECT 2D

Select Supplier.supplier_name Supplier, product_name Product, Inventory.units Units
FROM Product
JOIN Inventory ON Inventory.product_id = Product.product_id
JOIN Supplier ON Supplier.supplier_id = Inventory.supplier_id
WHERE Inventory.units < 11;

-----------------------------------------------------------------------------------------
---ASPECT 3D

SELECT Customer.fname AS 'First Name', Customer.lname AS 'Last Name', 
COUNT(Customer.customer_id) AS'Number of Accounts' 
FROM Customer
GROUP BY Customer.fname, Customer.lname
Having COUNT(Customer.customer_id) >=4;

-----------------------------------------------------------------------------------------------------------
--ASPECT 4D

SELECT Customer.fname as 'First Name', Customer.lname as 'Last Name', Customer.street_number AS 'Street Number', 
Customer.street_direction as Direction, Customer.street_name as 'Street Name',
Customer.street_type as 'Street Type', Customer.city City, Customer.state State, 
Customer.apt_number as 'Apt Number', Customer.country Country , Product.product_name Product
FROM Customer
JOIN Orders ON Customer.customer_id = Orders.customer_id
JOIN Order_item ON Orders.orders_id = Order_item.orders_id
JOIN Inventory ON Order_item.inventory_id = Inventory.inventory_id
JOIN Product ON Inventory.product_id = Product.product_id
WHERE Product.product_id IN (select Inventory.product_id FROM Inventory
JOIN Order_item ON Inventory.inventory_id = Order_item.inventory_id
GROUP BY Inventory.product_id
Having COUNT(Inventory.inventory_id) >= 3)
GROUP BY Customer.fname, Customer.lname, Customer.street_number, 
Customer.street_direction, Customer.street_name,
Customer.street_type, Customer.city, Customer.state, 
Customer.apt_number, Customer.country, Product.product_name;

--------------------------------------------------------------------------------------------------
---ASPECT 5D

SELECT DISTINCT Customer.fname As 'First Name' , Customer.lname AS 'Last Name' 
FROM Customer
JOIN Orders ON Customer.customer_id = Orders.customer_id
JOIN Delivery_info ON Orders.orders_id = Delivery_info.orders_id
WHERE Customer.customer_id IN (
SELECT DISTINCT Customer.customer_id FROM Customer
JOIN Orders ON Customer.customer_id = Orders.customer_id
WHERE Orders.total_price BETWEEN 30.00 AND 200.00 );
