USE [master]
GO
DROP DATABASE [Project]
GO


create database project
----------------------------HOTEL-----------------------

Create table Hotel(
Hotel_id int primary key,
Hotel_Name varchar(50),
Street varchar(50),
City varchar(50),
State varchar(50),
Country varchar(50),
Zip_code int,
Phone_Number varchar(50),
);

ALTER TABLE hotel
add CONSTRAINT chk_country CHECK (Country = 'USA');
-------------------------GUEST---------------------

create table Guests
(
Guest_id int primary key,
First_name varchar(20),
Last_name varchar(20),
Age int,
Phone_Number varchar(20),
Email_id varchar(70),
Street varchar(50),
City varchar(20),
State varchar(20),
Country varchar(10),
Zip_Code int,
Credit_Card varchar(20),
ID_Proof varchar(50)

);

ALTER TABLE Guests
ADD CONSTRAINT chk_PersonAge CHECK (AGE >= 18);


----------- Room_Type Table -------------------------
create table Room_Type (
Room_Type_id int primary key,
Type_name varchar(20),
On_Season char(1),
Cost int
);


----------------------------Rooms-----------------
create table Rooms(
Room_id int primary key,
Room_Number int,
Hotel_id int,
Room_Type_id int,
Is_Available char(1),
foreign key(Hotel_id) references Hotel(Hotel_id),
foreign key(Room_Type_id) references Room_Type(Room_Type_id)
);


---------- Hotel Services Table -----------------------
create table Hotel_Services(
Hotel_Services_id int primary key,
Service_Name varchar(20),
Service_Cost int
);

---------- Reservation Table ------------------------
CREATE table Reservation(
Reservation_id int PRIMARY KEY,
Reservation_Date date,
Check_in_Date date,
Check_out_Date date,
No_of_Rooms int,
Hotel_id int,
foreign key(Hotel_id) REFERENCES Hotel(Hotel_id),
Guest_id int,
foreign key(Guest_id) REFERENCES Guests(Guest_id),
Has_Reservation char(1),
Is_Canceled char(1)
);

---Computed Columns based on a function

SELECT DATEDIFF(day,Check_in_Date, check_out_Date) AS No_of_days_stayed, Reservation_id, Reservation_Date, No_of_Rooms, Has_Reservation
FROM Reservation;


----------Cancelation-------------------

create table Cancelation(
Cancelation_id int primary key,
Reservation_id int,
foreign key(Reservation_id) REFERENCES Reservation(Reservation_id),
Canceled_Date date
);

------ Rooms_Booked Table ------------------------------------
create table Rooms_Booked(Rooms_Booked_id int primary key, Reservation_id int, Room_id int,
foreign key(Reservation_id) references Reservation(Reservation_id),
foreign key(Room_id) references Rooms(Room_id));

--------------- Hotel_Services_Used Table -------------------
create table Hotel_Services_Used(
Service_Used_Id int primary key,
Hotel_Services_Id int,
Service_date date,
Reservation_Id int,
Quantity int,
foreign key(Hotel_Services_id) references Hotel_Services(Hotel_Services_id),
foreign key(Reservation_id) references Reservation(Reservation_id));

------------------------INVOICE---------------------
create table Invoice(
Invoice_id int primary key,
Invoice_Date date,
Reservation_id int,
foreign key(Reservation_id) REFERENCES Reservation(Reservation_id),
Total_amount int
);

----------------------Payments---------------

create table Payments(
Payment_Id int primary key,
Payment_Mode VARCHAR(15),
Status varchar(15),
Invoice_id int,
FOREIGN KEY(invoice_id) references invoice(Invoice_id)
);

-----------reservation table------------
CREATE TABLE [ReservationAudit](
[ReservationAuditID] int not null primary key  identity(1,1),
[Reservation_id] [VARCHAR](4) NOT NULL,
[Check_in_Date] [varchar](15) NOT NULL,
[Check_out_Date] [varchar](15) NULL,
[Guest_id] varchar(5),
[Is_Canceled] CHAR(2),
[Action] CHAR(1),
[ActionDate] DATETIME
)


