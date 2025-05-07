-- normalizing productDetails table into 1NF
Create table NormalOrder(
  OrderID int primary key,
  CustomerName varchar(100),
  Product varchar(50);
insert into NormalOrder(OrderID,CustomerName,Products)
select 
OrderID,CustomerName,
unnest (String_to_array(Products,','))::varchar(50) as Product
from ProductDetails;



-- normalizing OrderDetails into 2NF
Create table Orders(
  OrderID int primary key,
  CustomerName varchar(100),
  Product varchar(100),
  Quantity int);
insert into Orders(OrderID,CustomerName,Product,Quantity)
select distinct OrderID,CustomerName,Quantity
from OrderDetails;
insert into Orders(Product,Quantity)
select Product,Quantity
from Orders;
  
