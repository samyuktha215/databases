USE Customer;
SELECT * FROM details WHERE Customer_first_name IN ('samyuktha','mahesh');
SELECT * FROM details WHERE CustomerID = 2;
SELECT Customer_first_name FROM details WHERE CustomerID = 3;
INSERT  INTO details (CustomerID , Customer_first_name , Customer_last_name , Customer_phno , Customer_country) VALUES ( 4 , 'VEDANSH' , 'PACHAVA' , 23456789 , 'sweden '),
(5 , 'Indira ' , 'basam' , 56789345 , 'India' ),
(6 , 'SriHari' , 'basam' , 765890432 , 'India' );
SELECT * FROM details WHERE CustomerID = 6;
INSERT INTO product (ProductID , Product_name) VALUES(1 , 'hats' );
INSERT INTO product (ProductID , Product_name) VALUES (2 , 'jackets' );
INSERT INTO product (ProductID , Product_name) VALUES (3 , 'shirts');
INSERT INTO product (ProductID , Product_name) VALUES (4 , 'bags' );
SELECT * FROM product;
SELECT Customer_first_name , Customer_last_name FROM details WHERE CustomerID IN(1 ,2)
UNION
SELECT Customer_first_name , Customer_last_name FROM details WHERE CustomerID IN (3 ,4);
INSERT INTO product VALUES ( 5 ,'kitchenitems' ) , (6 , 'furniture') , (7 , 'shoes');
SELECT * FROM product;
SELECT * FROM details;
SELECT CustomerID AS ID FROM details WHERE Customer_first_name='SAMYUKTHA';
SELECT * FROM details WHERE CustomerID BETWEEN 1 AND 4;
SELECT * FROM product WHERE ProductID BETWEEN 1 AND 4;
INSERT INTO Orders VALUES ( 123 , 1 , '2023-02-28' ) , ( 567 , 2 , '2023-02-27') , (348 , 3 ,'2023-02-26');
SELECT * FROM Orders;
SELECT details.CustomerID , Orders.OrderID FROM details INNER JOIN Orders ON details.CustomerID = Orders.CustomerID;
SELECT details.Customer_first_name , details.Customer_last_name , Orders.OrderID FROM details CROSS JOIN Orders ON details.CustomerID= Orders.CustomerID;
SELECT * FROM Orders LEFT JOIN details ON details.CustomerID= Orders.CustomerID;
SELECT * FROM Orders RIGHT JOIN details ON Orders.CustomerID= details.CustomerID;
