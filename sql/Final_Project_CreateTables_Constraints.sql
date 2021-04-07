CREATE TABLE Category(
category_id DECIMAL(12) IDENTITY(1,1) NOT NULL PRIMARY KEY,
type VARCHAR(60) NOT NULL,
description VARCHAR(255)
);

CREATE TABLE Supplier(
supplier_id DECIMAL (12) IDENTITY (1,1) NOT NULL PRIMARY KEY,
supplier_name VARCHAR(100) NOT NULL,
description VARCHAR(255),
street_number DECIMAL(12),
street_direction CHAR(10),
street_name VARCHAR(100),
street_type VARCHAR(50),
zipcode DECIMAL(12),
state VARCHAR(50),
country VARCHAR(100),
website VARCHAR(255),
phone_areacode DECIMAL(12),
phone_number DECIMAL(12),
email VARCHAR(255)
);

CREATE TABLE Product(
product_id DECIMAL(12) IDENTITY (1,1) NOT NULL PRIMARY KEY,
category_id DECIMAL(12) NOT NULL,
product_name VARCHAR(255) NOT NULL,
description VARCHAR(255) NOT NULL
);

CREATE TABLE Warehouse(
warehouse_id DECIMAL(12) IDENTITY(1,1) NOT NULL PRIMARY KEY,
warehouse_name VARCHAR(255)
);

CREATE TABLE Customer(
customer_id DECIMAL(12) IDENTITY(1,1) NOT NULL PRIMARY KEY,
fname VARCHAR(100) NOT NULL,
lname VARCHAR(100)NOT NULL,
username VARCHAR(255) NOT NULL,
email_address VARCHAR(255) NOT NULL,
street_number DECIMAL(12)NOT NULL,
street_direction CHAR(10) NOT NULL,
street_name VARCHAR(100) NOT NULL,
street_type VARCHAR(50) NOT NULL,
zipcode DECIMAL(12)NOT NULL,
city VARCHAR (100),
state VARCHAR(50),
country VARCHAR(100),
apt_number DECIMAL(12),
phone_areacode VARCHAR(50) NOT NULL,
phone_number VARCHAR(50) NOT NULL
);


CREATE TABLE Shipping_speed(
shipping_speed_id DECIMAL(12) IDENTITY(1,1) NOT NULL PRIMARY KEY,
type VARCHAR(255) NOT NULL,
est_amount_days DECIMAL(12)
);

CREATE TABLE Delivery_info(
delivery_info_id DECIMAL (12) IDENTITY(1,1) NOT NULL PRIMARY KEY,
orders_id DECIMAL(12) NOT NULL,
package_tracker_id DECIMAL(12),
shipping_date DATETIME,
estimated_arrival_date DATETIME
);

CREATE TABLE Orders(
orders_id DECIMAL(12) IDENTITY(1,1) NOT NULL PRIMARY KEY,
customer_id DECIMAL(12) NOT NULL,
delivery_info_id DECIMAL(12),
shipping_speed_id DECIMAL(12) NOT NULL,
units DECIMAL(12), 
total_price DECIMAL(12,2),
purchase_date DATETIME
);


CREATE TABLE Inventory(
inventory_id DECIMAL(12) IDENTITY (1,1) NOT NULL PRIMARY KEY,
supplier_id DECIMAL(12) NOT NULL,
product_id DECIMAL(12) NOT NULL,
warehouse_id DECIMAL(12) ,
condition VARCHAR(255),
price_per_unit DECIMAL(12,2),
units DECIMAL(12)
);

CREATE TABLE Order_item(
order_item_id DECIMAL(12) IDENTITY(1,1) NOT NULL PRIMARY KEY,
inventory_id DECIMAL(12),
orders_id DECIMAL(12)
);

--Product FK
ALTER TABLE Product
ADD CONSTRAINT fk1_product_to_category FOREIGN KEY(category_id) REFERENCES Category(category_id);

-- Order item FK
ALTER TABLE Order_item
ADD CONSTRAINT fk1_order_item_to_inventory FOREIGN KEY(inventory_id) REFERENCES Inventory(inventory_id);
ALTER TABLE Order_item
ADD CONSTRAINT fk2_order_item_to_orders FOREIGN KEY(orders_id) REFERENCES Orders(orders_id);

--Orders FK
ALTER TABLE Orders
ADD CONSTRAINT fk1_orders_to_customer FOREIGN KEY(customer_id) REFERENCES Customer(customer_id);
ALTER TABLE Orders
ADD CONSTRAINT fk2_orders_to_delivery_info FOREIGN KEY(delivery_info_id) REFERENCES Delivery_info(delivery_info_id);
ALTER TABLE Orders
ADD CONSTRAINT fk3_orders_to_shipping_speed FOREIGN KEY(shipping_speed_id) REFERENCES Shipping_speed(shipping_speed_id);


--Delivery_Info FK
ALTER TABLE Delivery_info
ADD CONSTRAINT fk1_delivery_info_to_orders FOREIGN KEY(orders_id) REFERENCES Orders(orders_id);


--Inventory FK
ALTER TABLE Inventory
ADD CONSTRAINT fk1_inventory_to_supplier FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id);
ALTER TABLE Inventory
ADD CONSTRAINT fk2_inventory_to_product FOREIGN KEY(product_id) REFERENCES Product(product_id);
