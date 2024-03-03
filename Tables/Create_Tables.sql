CREATE DATABASE gravity_books_DW
GO
USE gravity_books_DW
GO
CREATE TABLE Dim_Book(
	BookID_SK int IDENTITY(1,1) PRIMARY KEY,
	BookID_BK int,
	Title varchar(400) NULL,
	ISBN_13 varchar(13) NULL,
	Language_ID int,
	Language_Code varchar(8),
	Language_Name varchar(50),
	Num_Pages int,
	Publication_Date date,
	Publisher_ID int,
	Publisher_Name nvarchar(1000),
	Author_ID int,
	Author_Name varchar(400),
	Source_System_Code tinyint,
	Start_Date datetime,
	End_Date datetime,
	IsCurrent tinyint
)
GO
CREATE TABLE Dim_Customer(
	CustomerID_SK int IDENTITY(1,1) PRIMARY KEY,
	CustomerID_BK int,
	FirstName varchar(200),
	LastName varchar(200),
	Email varchar(350),
	Status_ID int,
	Address_Status varchar(30),
	Address_ID int,
	Street_Number varchar(10),
	Street_Name varchar(200),
	City varchar(100),
	Country_ID int,
	Country_Name varchar(200),
	Source_System_Code tinyint,
	Start_Date datetime,
	End_Date datetime,
	IsCurrent tinyint
) 
GO
CREATE TABLE Dim_Order(
	OrderID_SK int IDENTITY(1,1) PRIMARY KEY,
	OrderID_BK int,
	Order_Date datetime,
	Shipping_Method_ID int,
	Shipping_Method_Name varchar(100),
	History_ID int,
	Status_ID int,
	Status_Date datetime,
	Status_Value varchar(20),
	Source_System_Code tinyint,
	Start_Date datetime,
	End_Date datetime,
	IsCurrent tinyint
)
GO
CREATE TABLE Fact_Sales(
	Fact_Transaction_PK_SK int IDENTITY(1,1) PRIMARY KEY,
	BookID_FK int,
	OrderID_FK int,
	CustomerID_FK int,
	DateID_FK int,
	TimeID_FK int,
	OrderDetailsID int NOT NULL,
	Price decimal(5, 2),
	Cost decimal(6, 2),
	Source_System_Code tinyint,
	Created_AT datetime DEFAULT (getdate()),
	CONSTRAINT FK_Fact_Sales_Dim_Book FOREIGN KEY(BookID_FK) REFERENCES Dim_Book(BookID_SK),
	CONSTRAINT FK_Fact_Sales_Dim_Customer FOREIGN KEY(CustomerID_FK) REFERENCES Dim_Customer(CustomerID_SK),
	CONSTRAINT FK_Fact_Sales_Dim_Order FOREIGN KEY(OrderID_FK) REFERENCES Dim_Order(OrderID_SK),
	CONSTRAINT FK_Fact_Sales_Dim_Date FOREIGN KEY(DateID_FK) REFERENCES Dim_Date(DateSK),
	CONSTRAINT FK_Fact_Sales_Dim_Time FOREIGN KEY(TimeID_FK) REFERENCES Dim_Time(TimeSK)
)
GO
CREATE TABLE Meta_Control_Fact_Sales_Load(
	id int PRIMARY KEY,
	SalesOrderDetails varchar(100),
	Last_Load_Date datetime,
	Last_Load_OrderDatails_ID int
)

