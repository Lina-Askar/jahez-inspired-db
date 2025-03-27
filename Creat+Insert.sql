--CREATE TABLE 
--Customer TABLE
DROP TABLE Customer CASCADE CONSTRAINTS;

CREATE TABLE Customer (
  Phone_num number(10) ,
  Email VARCHAR2(50) UNIQUE,
  Name VARCHAR2(20) NOT NULL,
  City VARCHAR2(10),
  Street VARCHAR2(30),
  Zip_code number(5),
 CONSTRAINT Customer_PK PRIMARY KEY (Phone_num)
);

--Resturant TABLE
DROP TABLE Resturant CASCADE CONSTRAINTS;
CREATE TABLE Resturant (
  ID char (4),
  Location VARCHAR2(10),
  Name VARCHAR2(20) NOT NULL,
  CONSTRAINT Resturant_PK PRIMARY KEY (ID)
);

--Driver TABLE
DROP TABLE Driver CASCADE CONSTRAINTS;
CREATE TABLE Driver (
  Ssn char(4),
  Name VARCHAR2(20) NOT NULL,
  Phone_num number(10),
  CONSTRAINT Driver_PK PRIMARY KEY (Ssn)
);

--Receipt TABLE
DROP TABLE Receipt CASCADE CONSTRAINTS;
CREATE TABLE Receipt (
  ID char(4),
  Amount NUMBER(2),
Pay_method VARCHAR2(10),
 CONSTRAINT Receipt_PK PRIMARY KEY (ID));


DROP TABLE Orders CASCADE CONSTRAINTS;
CREATE TABLE Orders (
  Orders_num number(3),
  Dates DATE,
  Phone_num number(10),
  Resturant_ID char(4),
  Driver_ID char(4),
  Receipt_ID char(4),
  CONSTRAINT Orders_PK PRIMARY KEY (Orders_num),
  CONSTRAINT Orders_FK1 FOREIGN KEY (Phone_num) REFERENCES Customer (Phone_num),
  CONSTRAINT Orders_FK2 FOREIGN KEY (Resturant_ID) REFERENCES Resturant (ID),
  CONSTRAINT Orders_FK3 FOREIGN KEY (Driver_ID) REFERENCES Driver (Ssn),
  CONSTRAINT Orders_FK4 FOREIGN KEY (Receipt_ID) REFERENCES Receipt (ID)On delete cascade);
  
  
-- INSERT data
  
INSERT INTO Customer VALUES(0509346521,'444008815@pnu.edu.sa','Latifa','Riyadh','Tahlia Street',13273);
INSERT INTO Customer VALUES(0597218767,'444008889@pnu.edu.sa','Roua','Riyadh','Takhassusi Street',16596);
INSERT INTO Customer VALUES(0534591661,'444008724@pnu.edu.sa','Lina','Dammam','King Abdulaziz Street',09555);


INSERT INTO Resturant VALUES('1137','Riyadh','Mcdonalds');
INSERT INTO Resturant VALUES('1417','Riyadh','hardees');
INSERT INTO Resturant VALUES('5621','Dammam','herfy');


INSERT INTO Driver VALUES('D1A2','Ahmed',0527514975);
INSERT INTO Driver VALUES('D2K3','Khaled',0558243972);
INSERT INTO Driver VALUES('D3S4','Saad',0504628741);


INSERT INTO Receipt VALUES ('A4B4',7,'Cash'); 
INSERT INTO Receipt VALUES ('A3B3',5,'CreditCard');  
INSERT INTO Receipt VALUES ('A8B4',10,'DebitCard');


INSERT INTO Orders (Orders_num ,Dates , Phone_num,Resturant_ID,Driver_ID,Receipt_ID) 
VALUES (111,'05-oct-2023',0597218767,'1417','D2K3','A4B4');

INSERT INTO Orders (Orders_num ,Dates , Phone_num,Resturant_ID,Driver_ID,Receipt_ID) 
VALUES (222,'01-nov-2023' ,0509346521, '1137','D1A2', 'A8B4');

INSERT INTO Orders (Orders_num ,Dates , Phone_num,Resturant_ID,Driver_ID,Receipt_ID) 
VALUES ( 333,'01-jan-2023',0534591661,'5621','D3S4','A3B3');

