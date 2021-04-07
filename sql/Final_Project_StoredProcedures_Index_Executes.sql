--ASPECT 1

--CREATE PROCEDURE ADD_NEW_PRODUCT
--@category_arg DECIMAL,
--@product_name_arg VARCHAR(40),
--@description_arg VARCHAR(255),
--@price_arg DECIMAL(12,2),
--@supplier_id_arg DECIMAL
--AS
--BEGIN
--	IF LOWER(@product_name_arg) NOT IN (SELECT product_name FROM Product)
--		BEGIN
--			INSERT INTO Product(category_id, product_name, description)
--			VALUES(@category_arg,lower(@product_name_arg), @description_arg);
--			INSERT INTO Inventory(supplier_id, product_id,price_per_unit, units)
--			VALUES(@supplier_id_arg, 
--				(SELECT Product.product_id 
--				FROM Product
--				WHERE product_name = @product_name_arg), 
--				@price_arg, 0)
--			PRINT 'Product added to list!'
--		END
--	ELSE
--		BEGIN
--		INSERT INTO Inventory(supplier_id, product_id,price_per_unit, units)
--			VALUES(@supplier_id_arg, 
--				(SELECT Product.product_id 
--				FROM Product
--				WHERE product_name = @product_name_arg), 
--				@price_arg, 0)
--		PRINT 'Product is already in the list! Added and update supplier and product name to current inventory list.'
--	END
--END;


--@category_arg DECIMAL, @product_name_arg VARCHAR(40), @description_arg VARCHAR(255), 
--@price_arg DECIMAL(12,2), @supplier_id_arg DECIMAL
--EXECUTE ADD_NEW_PRODUCT 2, 'Self-Driving Video Camera', 'Automatically follows a subject that is being recorded', 15.82, 1;
--EXECUTE ADD_NEW_PRODUCT 1, 'Holographic Keyboard', 'AEmits a 3-dimensional projection of a keyboard and recognizes virtual key presses from the typist', 25.99, 2;
--EXECUTE ADD_NEW_PRODUCT 2, 'Self-Driving Video Camera', 'Automatically follows a subject that is being recorded', 10.99, 2;
--EXECUTE ADD_NEW_PRODUCT 1, 'Holographic Keyboard', 'AEmits a 3-dimensional projection of a keyboard and recognizes virtual key presses from the typist', 5.00, 1;
--EXECUTE ADD_NEW_PRODUCT 3, 'Computer Mouse', 'A mouse for any computer', 8.95, 3
--EXECUTE ADD_NEW_PRODUCT 6, 'Skateboard', 'A fun skateboard signed by Tony Hawk', 100.50, 5
--EXECUTE ADD_NEW_PRODUCT 7, 'Scented Candle', 'Candle that burns and smells good', 8.99, 9
--EXECUTE ADD_NEW_PRODUCT 4, 'Coffee', 'Need caffeine?', 6.50, 6
--Select* from Inventory;
--Select * from Product;



-------------------------------------------------------------------------------------------------------------------
--ASPECT 2

--CREATE PROCEDURE NEW_DELIVERY_TO_INVENTORY
--@product_id_arg DECIMAL,
--@supplier_id_arg DECIMAL,
--@units_arg DECIMAL,
--@warehouse_id_arg DECIMAL,
--@condition_arg VARCHAR(255)
--AS
--BEGIN
--UPDATE Inventory
--set units = units + @units_arg, warehouse_id = @warehouse_id_arg, condition =LOWER(@condition_arg)
--FROM Inventory
--Join Supplier ON Supplier.supplier_id = Inventory.supplier_id
--JOIN Product ON Product.product_id = Inventory.product_id
--Where Product.product_id = @product_id_arg
--AND Inventory.supplier_id = @supplier_id_arg
--END;


--@product_id_arg DECIMAL, @supplier_id_arg DECIMAL, @units_arg DECIMAL, @warehouse_id_arg DECIMAL, @condition_arg VARCHAR(255)
--EXECUTE NEW_DELIVERY_TO_INVENTORY 2, 2, 4, 1, 'Good';
--EXECUTE NEW_DELIVERY_TO_INVENTORY 1, 1, 4, 2,'Used';
--EXECUTE NEW_DELIVERY_TO_INVENTORY 1, 2, 250, 3, 'New';
--EXECUTE NEW_DELIVERY_TO_INVENTORY 2, 1, 250, 3, 'New';
--EXECUTE NEW_DELIVERY_TO_INVENTORY 3,3,10,3,'Excellent';
--EXECUTE NEW_DELIVERY_TO_INVENTORY 4,5, 100,3, 'Used';
--EXECUTE NEW_DELIVERY_TO_INVENTORY 5,9, 55, 1, 'New';
--EXECUTE NEW_DELIVERY_TO_INVENTORY 6,6, 20, 2, 'New';
--select * from Inventory;
--select* from Product



--------------------------------------------------------------------------------------------------------------------------
--ASPECT 3 Create customer account


--CREATE PROCEDURE CREATE_NEW_ACCOUNT 
--@firstname_arg VARCHAR(100),
--@lastname_arg VARCHAR(100),
--@username_arg VARCHAR(255),
--@email_arg VARCHAR(255),
--@street_number_arg DECIMAL(12),
--@street_direction_arg CHAR(10), 
--@street_name_arg VARCHAR(100),
--@street_type_arg VARCHAR(50),
--@zipcode_arg DECIMAL(12),
--@city_arg VARCHAR(100),
--@state_arg VARCHAR(50),
--@country_arg VARCHAR(100),
--@apt_number_arg DECIMAL(12),
--@phone_areacode_arg VARCHAR(50),
--@phone_number_arg VARCHAR(50)    
--AS 
--BEGIN
--	IF @username_arg NOT IN (SELECT username FROM Customer)
--		BEGIN 
--			INSERT INTO Customer(fname,lname,username,email_address,
--			street_number,street_direction,street_name,street_type,zipcode, city,
--			state, country,apt_number,phone_areacode,phone_number)
--			VALUES(@firstname_arg, @lastname_arg, @username_arg, @email_arg,
--				@street_number_arg, @street_direction_arg,  @street_name_arg,
--				@street_type_arg, @zipcode_arg, @city_arg, @state_arg, @country_arg,
--				@apt_number_arg,@phone_areacode_arg, @phone_number_arg)
--		PRINT 'Account Created. Welcome New Customer!'
--		END
--	ELSE
--		PRINT 'Username already exist. Please try again.'
--END;


--Select * FROM Customer
--EXECUTE CREATE_NEW_ACCOUNT 'Louie', 'Padilla', 'lp123','lp123@bu.edu', 209,'S', 'Boston',
--		'Ave', 60027, 'Phoenix', 'AZ','USA', NULL ,'480', '123-4567'

--EXECUTE CREATE_NEW_ACCOUNT 'Louie', 'Padilla', 'LouiePadillaUSER','LouiePadillaUSER@bu.edu', 500,'W', 'Cheri',
--		'Cir', 98765, 'Quartzsite', 'CA','USA', NULL ,'602', '987-6543'

--EXECUTE CREATE_NEW_ACCOUNT 'Galina', 'Lozinski', 'gl123','gl123@yahoo.com', 999,'W', 'Apple',
--		'Rd', 12345, 'Albany', 'NY','USA', NULL ,'623', '791-8456'

--EXECUTE CREATE_NEW_ACCOUNT 'Galina', 'Lozinski', 'GalinaLozinskiUSER','GalinaLozinskiUSER@gmail.com', 6989,'W', 'Lemon',
--		'St', 98765, 'Reno', 'NV','USA', NULL ,'555', '555-7778'

--EXECUTE CREATE_NEW_ACCOUNT 'Sara', 'Jo', 'SJo99','Sjo999@facebook.com', 1234,'S', 'Market',
--		'Dr', 62781, 'Dallas', 'TX','USA', NULL ,'899', '999-0001'

--EXECUTE CREATE_NEW_ACCOUNT 'Mike', 'Broom', 'MikeB123','MikeB123@aol.com', 1414,'N', 'Bottom',
--		'Rd', 89980, NULL, 'CA','USA', NULL ,'909', '123-132'

--EXECUTE CREATE_NEW_ACCOUNT 'Mary', 'Smith', 'MSmith','MSmith@yahoo.com', 5565,'N', 'Stars',
--		'Ave', 78348, 'Nashville','TN','USA', NULL ,'890', '589-4234'

--EXECUTE CREATE_NEW_ACCOUNT 'Mary', 'Smith', 'MSmith','MSmith@yahoo.com', 1879,'N', 'Stars',
--		'Ave', 14490, 'Paris', Null,'France', NULL ,'303', '541-3780'

--EXECUTE CREATE_NEW_ACCOUNT 'James', 'Jackson', 'James_Jackson','JJ@gmail.com', 434,'N', 'Windows',
--		'Dr', 33278, 'Tempe', 'MA','Germany', NULL ,'404', '390-1230'

--EXECUTE CREATE_NEW_ACCOUNT 'Will', 'Biden', 'WBiden0','WBiden94', 167,'N', 'Stars',
--		'Ave', 65657, Null, Null,'Austria', NULL ,'910', '673-9090'

--EXECUTE CREATE_NEW_ACCOUNT 'Louie', 'Padilla', 'louie999','louie999@facebook.com', 1234,'S', 'Market',
--		'Dr', 62781, NULL, 'NM','USA', NULL ,'899', '390-1789'

--EXECUTE CREATE_NEW_ACCOUNT 'Louie', 'Padilla', 'LPadilla789','Lpadilla789@aol.com', 1414,'N', 'Bottom',
--		'Rd', 89980, 'Tempe','AZ','USA', NULL ,'562', '180-2956'

--EXECUTE CREATE_NEW_ACCOUNT 'Mary', 'Smith', 'MARYsmith999','MarySmith@facebook.com', 7832,'W', 'Closet',
--		'Cir', 19983, NULL, NULL,'Philipines', NULL ,'190', '898-4568'

--EXECUTE CREATE_NEW_ACCOUNT 'Mary', 'Smith', 'MSMITH909','MSMITH909@bu.edu', 654,'E', 'Sponge',
--		'Rd', 18903, 'Munich', NULL,'Germany', NULL ,'202', '324-2341'

--EXECUTE CREATE_NEW_ACCOUNT 'Mary', 'Smith', 'MaryMsmith','MaryMsmith', 7893,'W', 'Red',
--		'Rd', 78312, 'Nalgene', 'CA','USA', 41 ,'562', '080-7823'

		
--EXECUTE CREATE_NEW_ACCOUNT 'Louie', 'Padilla', 'lpadilla9092','lpadilla1234@email.com', 123,'S', 'Harl',
--		'Dr', 18903, 'Mesa', 'AZ','USA', 2809 ,'489', '389-0002'

--EXECUTE CREATE_NEW_ACCOUNT 'Tara', 'Swift', 'Tswift789','tswift@email.com', 903,'S', 'Phone',
--		'Dr', 9032, 'Avondale', 'FL','USA', 709 ,'602', '237-8345'

--EXECUTE CREATE_NEW_ACCOUNT 'Dwight', 'Schrute', 'Dschrute','Dschrutefarms@email.com', 1567,'E', 'Farms',
--		'Ave', 9032, 'Boston', 'MA','USA', NULL ,'232', '416-9038'

--select * from customer


-------------------------------------------------------------------------------------------------------
--ASPECT 4 Customer_purchase

--CREATE PROCEDURE CUSTOMER_PURCHASE
--@customer_id_arg DECIMAL,
--@product_id_arg DECIMAL,
--@supplier_id_arg DECIMAL,
--@units_arg DECIMAL,
--@shipping_speed_arg DECIMAL
--AS
--BEGIN
--INSERT INTO Orders(customer_id,shipping_speed_id,units, purchase_date, total_price)
--VALUES(@customer_id_arg, @shipping_speed_arg, @units_arg,(SELECT GETDATE()),
--(SELECT price_per_unit FROM Inventory
--WHERE product_id =@product_id_arg AND supplier_id =@supplier_id_arg) * @units_arg);

--INSERT INTO Order_item(orders_id, inventory_id)
--VALUES((SELECT MAX(Orders.orders_id) FROM Orders),
--(SELECT Inventory.inventory_id FROM Inventory
--JOIN Product ON Inventory.product_id = Product.product_id
--JOIN Supplier ON Inventory.supplier_id = Supplier.supplier_id
--WHERE Product.product_id = @product_id_arg
--AND Supplier.supplier_id = @supplier_id_arg));

--UPDATE Inventory
--SET units = units - @units_arg
--WHERE product_id = @product_id_arg 
--AND supplier_id = @supplier_id_arg;
--END;


--Select * FROM Order_item
--SELECT * FROM Orders
--SELECT * FROM Inventory
--SELECT * FROM Product

--@customer_id_arg DECIMAL, @product_id_arg DECIMAL, @supplier_id_arg DECIMAL,
--@units_arg DECIMAL, @shipping_speed_arg DECIMAL
--EXEC CUSTOMER_PURCHASE 1, 2, 1, 1, 1;
--EXEC CUSTOMER_PURCHASE 3, 1, 2, 3, 4;
--EXECUTE CUSTOMER_PURCHASE 5,2,1,4,2;
--EXECUTE CUSTOMER_PURCHASE 8,2,2,1,3;
--EXECUTE CUSTOMER_PURCHASE 9,2,2,3,1;
--EXECUTE CUSTOMER_PURCHASE 16, 2,1,1,3;
--EXECUTE CUSTOMER_PURCHASE 6, 4, 5, 2,1; 
--EXECUTE CUSTOMER_PURCHASE 8,4,5,3,1;
--EXECUTE CUSTOMER_PURCHASE 8,1,2,4,4;
--EXECUTE CUSTOMER_PURCHASE 17,4,5,4,1;
 
--Select * FROM Order_item
--SELECT * FROM Orders
--SELECT * FROM Inventory
--SELECT * FROM Product




--------------------------------------------------------------------------------------------
--ASPECT 5


--CREATE PROCEDURE PRODUCT_SHIPMENT
--@order_id_arg DECIMAL,
--@shipping_date_arg DATETIME
--AS
--BEGIN

--INSERT INTO Delivery_info(orders_id, package_tracker_id, shipping_date, estimated_arrival_date)
--VALUES(@order_id_arg, (SELECT FLOOR(RAND()*(100-0)*100000000)), @shipping_date_arg, 
--DATEADD(month, (SELECT Orders.shipping_speed_id FROM Orders 
--WHERE Orders.orders_id =@order_id_arg), @shipping_date_arg));

--UPDATE Orders
--SET delivery_info_id = (SELECT MAX(Delivery_info.delivery_info_id)
--FROM Delivery_info)
--WHERE Orders.orders_id = @order_id_arg;
--PRINT 'PRODUCT HAS BEEN SENT!';
--END;

--SELECT * FROM Delivery_info
--@order_id_arg DECIMAL, @shipping_date_arg DATETIME
EXEC PRODUCT_SHIPMENT 2, '6-30-2018';
EXEC PRODUCT_SHIPMENT 3, '12-30-2017';
EXEC PRODUCT_SHIPMENT 4, '6-30-2018';
EXEC PRODUCT_SHIPMENT 5, '5-13-2018';
EXEC PRODUCT_SHIPMENT 8, '4-30-2018';
EXEC PRODUCT_SHIPMENT 9, '4-30-2018';
EXEC PRODUCT_SHIPMENT 1, '5-20-2018';
EXEC PRODUCT_SHIPMENT 6, '2-13-2018';
EXEC PRODUCT_SHIPMENT 7, '1-18-2018';
EXEC PRODUCT_SHIPMENT 10, '4-20-2018';

select * from Delivery_info;
SELECT * FROM Orders;
--Select * From Order_item


--- CREATE INDEX
--CREATE INDEX idx_inventory_id
--ON Order_item(inventory_id);