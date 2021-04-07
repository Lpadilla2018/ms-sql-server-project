
INSERT INTO Category(type) VALUES('Electronics'), ('Appliances'), ('Computer'), ('Food'), ('Books'), 
('Toys'), ('Home');
Select * from Category;



INSERT INTO Supplier (supplier_name) VALUES('ABC INC.'), ('BPG Designs'),('Google INC.'), ('Apple INC'), ('Walmart'),
('Starbucks'), ('Best Buy'), ('Home Depot'), ('Ace Hardware');

select * from Supplier;

INSERT INTO Warehouse (warehouse_name) VALUES ('A'),('B'),('C');

INSERT INTO Shipping_speed(type, est_amount_days)
VALUES ('one-day shipping', 1),('two-day shipping',2),('standard shipping', 7), ('super-saver shipping', 14);

Select * from Shipping_speed;
Select * from Category;
select * from Supplier;
Select * from Warehouse;
