TRUNCATE TABLE fact_sales
TRUNCATE TABLE dim_book
TRUNCATE TABLE dim_customer
TRUNCATE TABLE dim_order


SELECT * FROM Dim_Book

SELECT * FROM Dim_Customer

SELECT * FROM Dim_Order

SELECT * FROM Fact_Sales

SELECT * FROM Dim_Date

SELECT * FROM Dim_Time



SELECT Last_Load_Date, Last_Load_OrderDatails_ID
FROM Meta_Control_Fact_Sales_Load
WHERE SalesOrderDetails = 'Orders_Details'



SELECT MAX(OrderDetailsID) FROM Fact_Sales
