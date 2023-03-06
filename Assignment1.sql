CREATE DATABASE FiktivWebShop;
USE FiktivWebShop;
DROP  TABLE  IF EXISTS Products , Customers , Orders , OrderDetails , Payments ;

CREATE TABLE Products ( ProductID INTEGER NOT NULL , ProductName VARCHAR(55) DEFAULT ' ' NOT NULL , ProductDescription VARCHAR(200) DEFAULT ' ' NOT NULL , ProductPrice INTEGER NOT NULL , CONSTRAINT PK_ProductID PRIMARY KEY (ProductID));
CREATE TABLE Customers ( CustomerID INTEGER NOT NULL , CustomerName VARCHAR (55) DEFAULT ' ' NOT NULL , Email VARCHAR(200) DEFAULT ' ' NOT NULL , CustomerAddress VARCHAR (55) DEFAULT ' ' NOT NULL , CONSTRAINT PK_CustomerID PRIMARY KEY (CustomerID));
CREATE TABLE Orders ( OrderID INTEGER NOT NULL , CustomerID INTEGER NOT NULL , OrderDate Date , CONSTRAINT PK_OrderID PRIMARY KEY (OrderID) , FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));
CREATE TABLE OrderDetails ( Order_DetailsID INTEGER NOT NULL , OrderID INTEGER NOT NULL , ProductID INTEGER NOT NULL , Quantity INTEGER NOT NULL , CONSTRAINT PK_Order_DetailsID PRIMARY KEY (Order_DetailsID), FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ,FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));
CREATE TABLE Payments ( PaymentID INTEGER NOT NULL , OrderID INTEGER NOT NULL , Amount INTEGER NOT NULL , PaymentMethod VARCHAR(55) DEFAULT ' ' NOT NULL , CONSTRAINT PK_PaymentID PRIMARY KEY (PaymentID) , FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));

INSERT INTO Products VALUES ( 1 , 'Mobiles ' , 'SmartMobiles_with_MightyPrices' , 1000) , 
							( 2 , 'Books ' , 'All_varieties_of_books' , 200),
                            ( 3 , 'Fashion ' , 'Fashion_starts_from_our_products' , 300),
                            ( 4 , 'Electronics' , 'Many_kinds_Available ' , 400),
                            ( 5 , 'Beauty' , 'Discounts_on_everyProduct ' ,100);


 INSERT INTO Customers VALUES ( 1 , 'Samyuktha' , ' samyuktha.basam@gmail.com' , 'västrabangatan 53C' ),
                            ( 2 , 'VengalRao' , 'vengalrao87@gmail.com' , 'odenvägen 23B') , 
                            ( 3 , 'Vedansh' , 'vedansh143gmail.com' , ' odelvägen 45A') , 
                            ( 4 , 'Mahesh' , 'bannu219@gmail.com' , 'barkascenter') ,
                            ( 5 , 'Indira ' , 'Indira345@gmail.com' , 'toorpuveedi');

 INSERT INTO Orders VALUES ( 1 , 1 , '2023-02-28') ,
						  ( 2 , 2 , '2022-08-25') ,
                          ( 3 , 3 , '2022-06-30') ,
                          ( 4 , 4 , '2022-10-25') ,
                          ( 5 , 5 , '2022-08-26');                           
                           
SELECT * FROM Products;
SELECT ProductName FROM Products WHERE ProductPrice > 100 ;
SELECT * FROM Products WHERE ProductPrice > 100 ORDER BY ProductPrice ASC ;
                            
SELECT * FROM Customers;

SELECT * FROM Orders;    

 INSERT INTO OrderDetails VALUES ( 123 , 1 ,3 , 10 ) , (143 , 2 ,4 ,5 ) , (256 , 5 , 4 , 8) , ( 10 , 3 , 5 ,10 ) , (4 , 1 ,4 ,2 );

 SELECT * FROM OrderDetails;

-- Visa alla produktdetaljer i tabellen order_details.
 SELECT OrderDetails.OrderID ,Products.ProductName , Products.ProductDescription , Products.ProductPrice
 FROM Products
 INNER JOIN OrderDetails
 ON Products.ProductID = OrderDetails.ProductID;
 
 
 
 INSERT INTO Payments VALUES ( 1 , 2 , 200 , ' cash' ) ,
							 ( 2 , 4 , 100 , 'debitcard ' ) ,
                             ( 3 , 3 , 300 , 'creditcard ' ) ,
                             ( 4 , 1 ,1000 , 'autogiro ' ) ,
                             ( 5 , 5 , 400 , 'applepay ' ) ;
SELECT * FROM Payments;                            

-- Visa totala intäkterna för varje dag
SELECT SUM(Payments.Amount) FROM Payments
INNER JOIN Orders
ON Payments.OrderID= Orders.OrderID WHERE Orders.OrderDate='2023-02-28';

-- Visa totala intäkterna för varje produkt.
SELECT OrderDate , ProductName ,SUM(Quantity*ProductPrice) FROM Products ,Orders ,OrderDetails
WHERE Products.ProductID = OrderDetails.ProductID
GROUP BY OrderDate , ProductName;

SELECT  c.CustomerName , count(o.CustomerID)
FROM Customers c
LEFT JOIN Orders o
ON o.CustomerID= c.CustomerID
GROUP BY c.CustomerName  ;

-- Visa alla betalningar i tabellen payments.
SELECT  Orders.OrderDate ,SUM( Payments.Amount)
FROM Payments 
INNER JOIN Orders 
ON Payments.OrderID= Orders.OrderID
GROUP BY Orders.OrderDate;

-- Visa alla beställningar tillsammans med kundinformation.
SELECT Orders.OrderID ,Customers.CustomerName
FROM Orders
INNER JOIN Customers
ON Orders.OrderID= Customers.CustomerID;

-- Visa alla beställningar tillsammans med detaljerad produktinformation.
SELECT OrderDetails.OrderID ,Products.ProductID , Products.ProductPrice , Products.ProductName
FROM OrderDetails
INNER JOIN Products 
ON OrderDetails.ProductID = Products.ProductID ;
SELECT * FROM Orders;

-- Visa alla beställningar tillsammans med detaljerad produktinformation och kundinformation
SELECT OrderDetails.OrderID , Customers.CustomerName , OrderDetails.ProductID
FROM Orders 
INNER JOIN  OrderDetails
ON Orders.OrderID= OrderDetails.OrderID
INNER JOIN Products
ON OrderDetails.ProductID = Products.ProductID
INNER JOIN  Customers 
ON Orders.CustomerID= Customers.CustomerID ; 

SELECT Orders.OrderID , Orders.CustomerID  FROM Orders  INNER JOIN OrderDetails ON Orders.OrderID= OrderDetails.OrderID WHERE
 Orders.CustomerID =3 ;
 
SELECT * FROM OrderDetails WHERE ProductID= 5;
SELECT * FROM Orders WHERE OderDate BETWEEN '2023-08-28' AND '2022-08-26';

SELECT * FROM OrderDetails INNER JOIN Orders ON OrderDetails.OrderID= Orders.OrderID WHERE ProductID=3 AND OrderDate BETWEEN '2023-02-26' AND  '2023-02-28' ;

-- Visa kunder som inte har gjort en beställning.
SELECT * FROM Customers
LEFT JOIN Orders ON Customers.CustomerID=Orders.CustomerID
WHERE Orders.CustomerID IS NULL
ORDER BY Customers.CustomerID;

--  Visa alla produkter som inte har sålts.
 SELECT * FROM Products
 LEFT JOIN OrderDetails ON Products.ProductID =OrderDetails.ProductID
 WHERE OrderDetails.ProductID IS NULL
 ORDER BY Products.ProductID;


INSERT INTO Products VALUES( 6 , ' Bikes' , 'gives_moremilage' , 10000);

INSERT INTO Customers VALUES( 6 , 'SriHari' , 'sri143@gmail.com' , 'donthali');

INSERT INTO Orders VALUES (6 , 6 , '2023-02-28');