USE [master]
GO
DROP DATABASE [Project]
GO

----- HOTEL INSERT STATEMENTS --------

insert into Hotel values( 1, 'UHC_HILTON' , 'XYZ street', 'Boston', 'Massachusets', 'USA', 21227, '7896541230');
insert into Hotel values( 2, 'UHC_Spring' , 'XAZ street', 'Baltimore', 'Maryland', 'USA', 25278, '7125789632');
insert into Hotel values( 3, 'UHC_Marriot' , 'AABC street', 'Rayleigh', 'Florida', 'USA', 20847, '3256974652');
insert into Hotel values( 4, 'UHC_Holiday' , 'XYZ street', 'Germantown', 'Massachusets', 'USA', 20111, '7325689844');
insert into Hotel values( 5, 'UHC_Taj' , 'QWE street', 'Allison', 'Massachusets', 'USA', 02665, '4589632540');
insert into Hotel values( 6, 'UHC_Oberoi' , 'WER street', 'Fredrik', 'Florida', 'USA', 24587, '7856321023');
insert into Hotel values( 7, 'UHC_Great' , 'TYTstreet', 'Laurel', 'Maryland', 'USA', 22122, '5478862103');
insert into Hotel values( 8, 'UHC_Maratha', 'FGH street', 'Gaithesburg', 'California', 'USA', 21147, '4586630011');
insert into Hotel values( 9, 'UHC_Fall' , 'FGG street', 'Jesery City', 'Massachusets', 'USA', 21247, '0026584520');
insert into Hotel values( 10, 'UHC_Crazy' , 'WWW street', 'York City', 'New York', 'USA', 21227, '3256987452');
insert into Hotel values( 11, 'UHC_Happiness' , 'GGG street', 'Edison', 'New Jersey', 'USA', 12598, '7896541230');

----- GUESTS INSERT STATEMENTS --------

insert into GUESTS values(10,'John','Marnus',42,220-447-9876,'marnus.john@gmail.com','Clarksville','New Jersey','New Jersey','USA',12540,'7878-9987-4584-7282','SSN');
insert into GuestS values(11,'Steve','Smith',52,692-785-8520,'stevesmith@yahoo.in','Eldwood','New York','New York','USA',87985,'6987-7585-6978-1023','DRIVING LICENSE');
insert into GUESTS Values(12,'Meghan','Markle',38,698-852-7842,'meghan.markle@gmail.com','Spring Road','Sugarland','Pennsylvania','USA',25890,'4585-6963-7441-1014','SSN');
insert into GUESTS Values(13,'Rachel','Zane',28,987-654-1230,'rachel.zane@hotmail.com','Elkridge','Rockville','California','USA',21789,'8585-7896-5412-2301','SSN');
insert into GUESTS values(14,'Mike','Ross',35,785-563-3201,'mike.ross@gmail.com','Belwood','Elicot City','Maryland','USA',12596,'7845-4541-2325-3658','SSN');
insert into GUESTS values(15,'Harvey','Spector',45,785-698-2520,'harvey.spector@gmail.com','Rockville','Baltimore','Maryland','USA',45896,'7530-9510-3570-8745','SSN');
insert into GUESTS values(16,'Louis','Litt',36,582-963-3210,'louis.litt@hotmail.com','Hill Road','Arlington','Texas','USA',97531,'8520-9630-7410-2580','State ID');
insert into GUESTS values(17,'Kevin','Peterson',22,456-987-1230,'petesron.kevin@yahoo.in','Ring Road','Dellas','Texas','USA',25806,'7539-9510-2589-9845','Student ID');
insert into GUESTS values(18,'David','Warner',58,456-987-7896,'david.warner@gmail.com','MG Road','LA','California','USA',89566,'7997-9889-6556-6449','SSN');
insert into GUESTS values(19,'Donna','Daniel',45,582-741-3690,'donna.daniel@gmail.com','S Road','Fedrick','Maryland','USA',25929,'7747-8858-6696-3321','SSN');

------ ROOM TYPE INSERT STATEMENTS --------

insert into Room_Type values (1111, 'Single', 'Y', 300);
insert into Room_Type values (2222, 'Double', 'Y', 500);
insert into Room_Type values (3333, 'Suite', 'Y', 900);
insert into Room_Type values (4444, 'Conference Room', 'Y', 5000);
insert into Room_Type values (5555, 'Single', 'N', 100);
insert into Room_Type values (6666, 'Double', 'N', 200);
insert into Room_Type values (7777, 'Suite', 'N', 500);
insert into Room_Type values (8888, 'Conference Room', 'N', 1000);
insert into Room_Type values (9999, 'Banquet Hall', 'N', 1500);
insert into Room_Type values (0000, 'Banquet Hall', 'Y', 2000);

------ ROOMS INSERT STATEMENT --------

insert into Rooms values (1, 1000, 1, 1111,'Y');
insert into Rooms values (2, 1001, 2, 2222,'N');
insert into Rooms values (3, 1002, 3, 3333, 'N');
insert into Rooms values (4, 1003, 4, 4444,'Y');
insert into Rooms values (5, 1004, 5, 3333,'Y');
insert into Rooms values (6, 1005, 4, 1111,'N');
insert into Rooms values (7, 1006, 3, 3333,'Y');
insert into Rooms values (8, 1007, 2, 2222, 'N');
insert into Rooms values (9, 1008, 1, 1111,'Y');
insert into Rooms values (10,1009, 4, 3333,'Y');

------ HOTEL SERVICES INSERT STATMENTS -------

insert into Hotel_Services values
(1,'Restaurant',20);
insert into Hotel_Services values
(2,'Movie',5);
insert into Hotel_Services values
(3,'Laundry',10);
insert into Hotel_Services values
(4,'Dining',100);
insert into Hotel_Services values
(5,'Massage',15);
insert into Hotel_Services values
(6,'Room service',5);
insert into Hotel_Services values
(7,'Swimming pool',10);
insert into Hotel_Services values
(8,'transport assistance',20);
insert into Hotel_Services values
(9,'concierge',5);
insert into Hotel_Services values
(10,'GYM',5);

------- RESERVATION INSERT STATEMENT --------

insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id, Guest_id, has_reservation, is_canceled)
values(1, '2018-03-24',  '2018-05-28',  '2018-05-29', 2, 1, 11, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
values(2,  '2018-03-26',  '2018-04-24',  '2018-04-27', 2, 4, 12, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
Values(3,  '2018-04-30',  '2018-06-30',  '2018-07-05', 1, 5, 13, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
values(4,  '2018-05-25',  '2018-05-26',  '2018-05-28', 1, 1, 14, 'Y', 'Y');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
VALUES(5,  '2019-06-12',  '2019-08-14',  '2019-08-18', 3, 1, 15, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id ,has_reservation, is_canceled)
values(6,  '2019-07-15',  '2019-09-18',  '2019-09-21', 2, 2, 16, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
values(7,  '2019-09-13',  '2019-10-11',  '2019-10-12', 1, 1, 17, 'Y', 'Y');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
values(8,  '2019-11-12',  '2019-11-12',  '2019-11-15', 2, 1, 18, 'N', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id ,has_reservation, is_canceled)
values(9,  '2019-12-15',  '2019-12-15',  '2019-12-18', 1, 2, 19, 'N', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
values(10,  '2019-12-17',  '2019-12-25',  '2019-12-27', 2, 3, 10, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
values(11,  '2020-07-03',  '2020-08-01',  '2020-08-10', 2, 3, 11, 'Y', 'Y');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
values(12,  '2020-08-09',  '2020-09-09',  '2020-09-12', 1, 5, 12, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
values(13,  '2020-09-28',  '2020-11-28',  '2020-11-30', 3, 5, 13, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
values(14,  '2021-01-01',  '2021-01-02',  '2021-01-03', 1, 1, 14, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id ,has_reservation, is_canceled)
values(15,  '2021-01-04',  '2021-03-13',  '2021-03-16', 1, 1, 15, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id ,has_reservation, is_canceled)
values(16,  '2021-01-06',  '2021-04-10',  '2021-04-12', 1, 2, 16, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
values(17,  '2021-01-08',  '2021-03-03',  '2021-03-07', 1, 3, 17, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
values(18,  '2021-01-10',  '2021-04-11',  '2021-04-14', 1, 2, 18, 'Y', 'N');
insert into Reservation (reservation_id, reservation_date, check_in_date, check_out_date,  no_of_rooms,Hotel_id,Guest_id, has_reservation, is_canceled)
values(19,  '2021-01-13',  '2021-01-15',  '2021-01-18', 1, 1, 19, 'Y', 'N');

------- CANCELATION INSERT STATEMENTS ---------

insert into Cancelation values
(50001,15,'2021-03-05');
insert into Cancelation values
(50002,16,'2021-04-05');
insert into Cancelation values
(50003,17,'2021-02-27');
insert into Cancelation values
(50004,18,'2021-04-01');
insert into Cancelation values
(50005,19,'2021-03-04');
insert into Cancelation values
(50006,1,'2018-02-24');
insert into Cancelation values
(50007,2,'2018-03-25');
insert into Cancelation values
(50008,4,'2018-05-24');
insert into Cancelation values
(50009,5,'2019-06-11');
insert into Cancelation values
(50010,7,'2019-09-12');

------ ROOMS_BOOKED INSERT STATEMENTS -------

insert into Rooms_booked values
(50000,10,1);
insert into Rooms_booked values
(50001,11,2);
insert into Rooms_booked values
(50002,12,3);
insert into Rooms_booked values
(50003,13,4);
insert into Rooms_booked values
(50004,14,5);
insert into Rooms_booked values
(50005,15,6);
insert into Rooms_booked values
(50006,16,7);
insert into Rooms_booked values
(50007,17,8);
insert into Rooms_booked values
(50008,18,9);
insert into Rooms_booked values
(50009,19,10);

------ HOTEL SERVICES USED INSERT STATEMENTS-----

insert into Hotel_Services_Used values
(100,1, '2021-03-10',10,3);
insert into Hotel_Services_Used values
(101,2, '2021-04-11 13:30:30.00',11,1);
insert into Hotel_Services_Used values
(102,2, '2021-03-03 20:25:30.00',12,1);
insert into Hotel_Services_Used values
(103,3, '2021-04-10 8:15:30.00',13,4);
insert into Hotel_Services_Used values
(104,3, '2021-03-13 22:25:00.00',14,5);
insert into Hotel_Services_Used values
(105,4, '2021-01-02 12:22:00.00',14,5);
insert into Hotel_Services_Used values
(106,6, '2018-03-24 23:25:00.00',1,1);
insert into Hotel_Services_Used values
(107,3, '2020-08-10 19:25:00.00',12,5);
insert into Hotel_Services_Used values
(108,4, '2019-12-16 21:00:00.00',9,5);
insert into Hotel_Services_Used values
(109,3, '2021-01-11 22:25:00.00',16,5);
insert into Hotel_Services_Used values
(110,3, '2021-01-02 4:35:00.00',14,5);


------ INVOICE INSERT STATEMENTS ------

insert into Invoice values
(1000,'2021-03-12',10,500);
insert into Invoice values
(1001,'2021-04-14',11,400);
insert into Invoice values
(1002,'2021-03-17',12,1000);
insert into Invoice values
(1003,'2021-04-12',13,9000);
insert into Invoice values
(1004,'2021-03-16',14,2500);
insert into Invoice values
(1005,'2020-08-10',12,3000);
insert into Invoice values
(1006,'2019-12-18',10,6000);
insert into Invoice values
(1007,'2019-12-15',9,5000);
insert into Invoice values
(1008,'2021-01-11',18,2000);
insert into Invoice values
(1009,'2021-10-28',13,7000);

----- PAYMENTS INSERT STATEMENTS ---------

insert into Payments values (1, 'Cash', 'Paid', 1000);
insert into Payments values (2, 'Cash', 'Paid', 1001);
insert into Payments values (3, 'Card', 'Paid', 1002);
insert into Payments values (4, 'Card', 'Pending', 1003);
insert into Payments values (5, 'Card', 'Pending', 1004);
insert into Payments values (6, 'Card', 'Paid', 1005);
insert into Payments values (7, 'Cash', 'Pending', 1006);
insert into Payments values (8, 'Card', 'Pending', 1007);
insert into Payments values (9, 'Card', 'Paid', 1008);
insert into Payments values (10, 'Cash', 'Pending', 1009);

