Create Table Dim_Branch 
(
BranchID_PK_SK int Primary key identity(1,1),
BranchIDBK int ,
BranchName nvarchar(255),
BranchLoc nvarchar(255),
AtmID_BK int ,
AtmStatus nvarchar(255),
Emp_BK int ,
Fname varchar(50),
Lname varchar(50),
Salary float,
Position varchar(50),
SupID_FK int,
Dno int,
Dname varchar(50),
Dmgr_FK int,
St_Date date,
End_Date date,
Is_Current tinyint not null,
SSC int
)

Create Table Customer 
(
Cus_PK_SK int primary key identity(1,1),
CusID_BK int,
CusFn varchar(50),
CusLn varchar(50),
CusEmail varchar(50),
CusBD date,
CusState  varchar(50),
CusGender varchar(50),
CusMobNo varchar(15),
AccNo_BK int ,
Acc_type nvarchar(255),
Acc_Balance float, 
Acc_status nvarchar(255),
Acc_BranchID int ,
CardNo_BK varchar(50) ,
Card_Type nvarchar(50),
Card_Status nvarchar(50),
Card_ExpD date ,
CSV int,
St_Date date,
End_Date date,
Is_Current tinyint not null,
SSC int
)

Alter Table Dim_LoanDesc Drop column LoanDescID_PK_SK
ALTER TABLE Dim_LoanDesc ADD LoanDescID_PK_SK int Primary Key Identity(1,1)

Create Table Dim_TrType 
(
TrTypeID_PK_SK int primary Key identity(1,1),
TrTypeID_BK int,
Transaction_Type varchar(100),
St_Date date,
End_Date date,
Is_Current tinyint not null,
SSC int
)

Create Table Fact_Loan 
(
Fact_Loan_PK_SK int primary key identity(1,1),
StDateID_FK int,
EndDateID_FK int,
BranchID_FK int,
CusAccID_FK int,
LoanDescID_FK int, 
Amount varchar(50) Not NULL,
FOREIGN KEY (StDateID_FK) REFERENCES DimDate(DateSK),
FOREIGN KEY (EndDateID_FK) REFERENCES DimDate(DateSK),
FOREIGN KEY (BranchID_FK) REFERENCES Dim_Branch(BranchID_PK_SK),
FOREIGN KEY (CusAccID_FK) REFERENCES Dim_Customer(Cus_PK_SK),
FOREIGN KEY (LoanDescID_FK) REFERENCES Dim_LoanDesc(LoanDescID_PK_SK)

)

Create Table Fact_Transactions
(
Fact_Transaction_PK_SK int primary key identity(1,1),
DateID_FK int,
CustomerID_FK int,
TrTypeID_FK int, 
Branch_FK int,
Amount money Not Null
FOREIGN KEY (DateID_FK) REFERENCES	DimDate(DateSK),
FOREIGN KEY (CustomerID_FK)	REFERENCES Dim_Customer(Cus_PK_SK),
FOREIGN KEY (TrTypeID_FK)	REFERENCES Dim_TrType(TrTypeID_pk_SK),
FOREIGN KEY (Branch_FK)	REFERENCES Dim_Branch(BranchID_pk_SK)

)