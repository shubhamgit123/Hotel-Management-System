USE [master]
GO
--Encryption Based on Column

alter table Guests add Username varchar(50), [Password]  varbinary(400)

create MASTER KEY
ENCRYPTION BY PASSWORD = 'Damg123456^';

-- SELECT name KeyName,
--   symmetric_key_id KeyID,
--   key_length KeyLength,
--   algorithm_desc KeyAlgorithm
-- FROM sys.symmetric_keys;


CREATE CERTIFICATE GuestPass  
   WITH SUBJECT = 'Guest Sample Password';  
GO  

CREATE SYMMETRIC KEY GuestPass_SM 
    WITH ALGORITHM = AES_256  
    ENCRYPTION BY CERTIFICATE GuestPass;  
GO  

OPEN SYMMETRIC KEY GuestPass_SM  
   DECRYPTION BY CERTIFICATE GuestPass;

UPDATE Guests set  [username] = Email_id
, [Password] = EncryptByKey(Key_GUID('GuestPass_SM'),  convert(varbinary,'ProjectTeam@123')  ) 
GO  

SELECT *, 
    CONVERT(varchar, DecryptByKey([Password]))   
    AS 'Decrypted password'  
    FROM Guests;  
GO  

close symmetric key GuestPass_SM

select * from Guests

------- RESERVED AUDIT TABLE CREATION FOR TRIGGER

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


--Trigger (if a reservation is cancelled , the value is changed in Is_Cancelled, the trigger will fire and maintain audit )-------------------------------------
Create TRIGGER ReservationAuditTrigger
   ON  Reservation
  FOR UPDATE
AS 
BEGIN
declare @action char(1)
SET @action = 'U'
INSERT INTO  ReservationAudit ( 
  [Reservation_id],
  [Check_in_Date],
  [Check_out_Date],
  [Guest_id],
  [Is_Canceled],
  [Action],
  [Actiondate]

  )
  SELECT 
  Reservation_id,
  [Check_in_Date],
  [Check_out_Date],
  [Guest_id],
  [Is_Canceled],
  @action,
  GETDATE()

   FROM deleted

END 

UPDATE Reservation 
SET Is_Canceled =   'Y'
WHERE Reservation_id =1

select * FROM ReservationAudit

--Function (This function will check if the reservation is still active or no)---------------------------------------------------
CREATE FUNCTION reserved_or_no (

	@Check_out_Date date)

RETURNS CHAR(1) AS
BEGIN
	DECLARE @return_value CHAR(1);
    IF (@Check_out_Date <= getdate()) SET @return_value = 'N';
    IF (@Check_out_Date > getdate()) SET @return_value = 'Y';
 
    RETURN @return_value
END;


select [dbo].reserved_or_no(Check_out_Date) from Reservation

------ procedure 1 (it will add new hotel)--------
create procedure ADD_HOTEL(
@Hotel_id int,
@Hotel_Name varchar(50),
@Street varchar(50),
@City varchar(50),
@State varchar(50),
@Country varchar(50),
@Zip_Code int,
@Phone_Number varchar(50))
as
insert into [Hotel](
[Hotel_id], [Hotel_Name], [Street], [City], [State], [Country], [Zip_code], [Phone_Number])Values
(@Hotel_id,@Hotel_Name,@Street,@City,@State,@Country,@Zip_Code, @Phone_Number)
go

------- procedure 2 (input parameter is a state and it gives all the hotels located in that state )---------
create procedure Get_State @in_State varchar(50)

AS
BEGIN
declare @Hotel_Id varchar(MAX), @Hotel_Name varchar(MAX), @City varchar(MAX), @State varchar(MAX), @message varchar(MAX);

declare get_H CURSOR FOR
Select Hotel_Id, Hotel_Name, City , [State]
from Hotel
where [State] = @in_State;

open get_H
fetch next from get_H
into @Hotel_Id, @Hotel_Name, @City, @State
Print 'Hotel_Id           Hotel_Name           City           State'
while @@FETCH_STATUS = 0 
Begin  
print +CAST(@Hotel_Id as varchar(10))+'        
           '+cast(@Hotel_Name as varchar(10))+'      
                 '+cast(@City as varchar(20))+'     
                      '+cast(@State as varchar(10))

Fetch next from get_H
into @Hotel_Id, @Hotel_Name, @City, @State
END
Close get_H;
DEALLOCATE get_H;
END


--declare @in_State varchar(50)
exec Get_State @in_State = 'Florida'



drop procedure get_reservation

go
 ----------- procedure 3 (all the reservations which are made in hotel are displayed along with guest_id )(hotel id is input parameter output is reservations made and the hotel id) ------------

create procedure get_reservation @h_id int
AS
begin
declare @Reservation_ID int, @Hotel_id int, @Guest_id int; 

declare get_r cursor for
Select Reservation_ID,  Hotel_id, Guest_id
from reservation
where @h_id = hotel_id 
open get_r
fetch next from get_r
into @Reservation_ID, @Hotel_id, @Guest_id
print 'Reservation_ID  Hotel_Id Guest_Id'
while @@FETCH_STATUS = 0 
Begin
print +CAST(@Reservation_Id as int)+'                   '+cast(@Hotel_id as int)+'          '+cast(@Guest_id as int)
Fetch next from get_r
into @Reservation_ID,  @Hotel_id, @Guest_id
End
close get_r;
Deallocate get_r;
End
go

declare @h_id int
exec get_reservation @h_id = 2
select * from Hotel;
select * from reservation;

----- view 1----(it says the most used services)
create VIEW [mostused_service] AS
SELECT count(*) AS NumberOfGuests, Hotel_Services.Service_Name 
from Hotel_Services 
JOIN Hotel_Services_Used 
on Hotel_Services.Hotel_Services_Id=Hotel_Services_Used.Hotel_Services_Id
group by Hotel_Services.Service_Name

select * from mostused_service ORDER BY numberofguests DESC



----- view 2----- (it says the services used by the guest in a reservation by changing the reservation id)

drop view Services_Name

create view [Services_Name] AS

select service_Name
from Hotel_Services_Used, reservation, hotel_services
where reservation.Reservation_id = Hotel_Services_Used.Reservation_Id 
and Hotel_Services_Used.Hotel_Services_Id = Hotel_Services.Hotel_Services_id
and reservation.Reservation_id = 13;

select * from Services_Name;
