--data for hotel 
INSERT INTO public.hotel (Hotel_id,hotel_name,hotel_location,rating)
VALUES
  (1,'A Auctor Incorporated','Madiun',4.3),
  (2,'Ultrices Associates','Wals-Siezenheim',5);
  
--data for staff
INSERT INTO public.staff (Staff_id,Hotel_id,first_name,last_name,salary,date_of_birth)
VALUES
  (1,1,'Vance','Colin','2600.63','Apr 28, 1992'),
  (2,2,'Talley','Jarrod Walters','8500.68','May 17, 1985'),
  (3,1,'Hector',' Hughes','7400.05','Nov 5, 1980'),
  (4,2,'Charles','Paki Lester','700.40','Jul 22, 1999'),
  (5,1,'Puckett','Dacey Greer','660.03','Oct 21, 1995'),
  (6,1,'Laith Taylor','Bell Atkins','890.17','Dec 19, 2000'),
  (7,2,'Robertson',' Sawyer','4200.18','May 4, 1990'),
  (8,1,'Kristen Carver','Matthew ','1600.79','Jun 17,1992'),
  (9,2,'William','Hollee','1400.82','Nov 12, 1991'),
  (10,2,'Hamish','Jacob','7400.16','Feb 2, 1990');

--data for department
INSERT INTO public.department (Department_id,department_name,description)
VALUES
  (1,'Receptionist','Frontliner of the hotel'),
  (2,'Housekeeping','Ensures cleaniness of the room'),
  (3,'Chef','Prepares the food'),
  (4,'Security','Makes sure the guests feel safe'),
  (5,'Manger','Encharge of keep the hotels smooth run'),
  (6,'Cleaner','Ensures cleaniness of the hotel'),
  (7,'Intern','Trainee');

--data for staff department
INSERT INTO public.StaffDepartment(StaffDept_id,Department_id,staff_id)
VALUES
   (1,1,1),
   (2,5,3),
   (3,3,5),
   (4,4,6),
   (5,7,8),
   (6,5,2),
   (7,2,4),
   (8,6,7),
   (9,6,9),
   (10,1,10);
   
delete from public.StaffDepartment
select * from public.StaffDepartment

--data for guest
INSERT INTO Guest (Guest_id, first_name,last_name, email,nationality,gender,phone)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', 'American', 'M', '123-456-7890'),
(2, 'Jane', 'Smith', 'jane.smith@mail.com', 'Canadian', 'F', '987-654-3210'),
(3, 'Michael', 'Johnson', 'michael.johnson@email.com', 'British', 'M', '555-123-4567'),
(4, 'Emily', 'Davis', 'emily.davis@email.com', 'Australian', 'F', '777-888-9999'),
(5, 'Robert', 'Brown', 'robert.brown@email.com', 'American', 'M', '444-555-6666'),
(6, 'Sarah', 'Wilson', 'sarah.wilson@mail.com', 'French', 'F', '111-222-3333'),
(7, 'Daniel', 'Taylor', 'daniel.taylor@email.com', 'Italian', 'M', '999-888-7777'),
(8, 'Oliver', 'White', 'oliver.white@email.com', 'Spanish', 'M', '333-222-1111'),
(9, 'Christopher', 'Miller', 'christopher.miller@mail.com', 'Japanese', 'M', '666-777-8888'),
(10, 'Emma', 'Anderson', 'emma.anderson@email.com', 'Chinese', 'F', '222-333-4444');

DELETE FROM public.guest
SELECT * FROM public.guest

--data for room
INSERT INTO Room (Room_number, room_type, Status, Hotel_id, additional_info)
VALUES
(101, 'Single', 'Available', 1, 'Ocean view'),
(102, 'Double', 'Occupied', 1,'Has a balcony'),
(201, 'Suite', 'Available', 2, 'Has a mini pool'),
(202, 'Single', 'Occupied', 2,NULL),
(301, 'Double', 'Available', 1,'Has an open shower'),
(302, 'Suite', 'Available', 2, 'Allowed to cook in'),
(401, 'Single', 'Occupied', 2, NULL),
(402, 'Double', 'Available', 1, NULL),
(501, 'Suite', 'Occupied', 1, 'Has a beach view'),
(502, 'Double', 'Available', 2, 'Open shower'),
(601, 'Single', 'Available', 1, 'Small then expected'),
(602, 'Single', 'Available', 1, NULL),
(701, 'Suite', 'Available', 2, 'Built witha suna'),
(702, 'Single', 'Available',2, NULL),
(801, 'Single', 'Occupied',1, NULL);

 delete from public.room
 
--data for roomservice
INSERT INTO RoomService (Service_id, Room_number, Description, price, service_date)
VALUES
(1, 102, 'Dinner', 25.50, '2023-01-11'),
(2, 202, 'Lunch', 18.99, '2023-03-13'),
(3, 401, 'Lunch', 17.25, '2023-04-16'),
(4, 501, 'Breakfast', 13.99, '2023-01-18'),
(5,801, 'Dinner', 20.10, '2023-02-05');

delete from public.RoomService

--data for booking
INSERT INTO Booking (Booking_id, Guest_id, Room_number, Check_In_Date, Check_Out_Date)
VALUES
(1, 1, 101, '2023-01-10', '2023-01-15'),
(2, 2, 201, '2023-01-12', '2023-01-17'),
(3, 3, 302, '2023-01-14', '2023-01-19'),
(4, 4, 401, '2023-01-16', '2023-01-21'),
(5, 5, 501, '2023-04-18', '2023-04-23'),
(6, 6, 502, '2023-02-10', '2023-02-15'),
(7, 7, 601, '2023-02-12', '2023-02-17'),
(8, 8, 602, '2023-04-14', '2023-04-19'),
(9, 9, 701, '2023-05-16', '2023-05-21'),
(10, 10, 702, '2023-06-18', '2023-06-23');

--data for payment
INSERT INTO Payment (Payment_id, Booking_id, Amount, PaymentDate, PaymentMethod)
VALUES
(1, 1, 150.00, '2023-01-15', 'Credit Card'),
(2, 2, 200.00, '2023-01-17', 'PayPal'),
(3, 3, 250.00, '2023-01-19', 'Cash'),
(4, 4, 300.00, '2023-01-21', 'Credit Card'),
(5, 5, 350.00, '2023-04-23', 'Credit Card'),
(6, 6, 180.00, '2023-02-15', 'Cash'),
(7, 7, 220.00, '2023-02-17', 'PayPal'),
(8, 8, 280.00, '2023-04-19', 'Credit Card'),
(9, 9, 320.00, '2023-05-21', 'Cash'),
(10, 10, 400.00, '2023-06-23', 'Credit Card');

--data for service
INSERT INTO Service (Service_id, service_name, Description, price)
VALUES
(1, 'Breakfast', 'Delicious morning meal', 12.99),
(2, 'Room Decorations', 'Special decorations for celebrations', 40.00),
(3, 'Spa Massage', 'Relaxing spa massage session', 50.00),
(4, 'Snacks', 'Tasty bites between meals', 8.99),
(5, 'Housekeeping', 'Cleaning and tidying services', 30.00),
(6, 'Wi-Fi', 'High-speed internet access', 10.00);

--data for servicepayment
INSERT INTO ServicePayment (Service_payment_id, Service_id, Booking_id, Amount, PaymentDate, PaymentMethod)
VALUES
(1, 1, 1, 12.99, '2023-01-15', 'Credit Card'),  -- Breakfast 
(2, 2, 2, 40.00, '2023-01-17', 'PayPal'),       -- Room Decorations 
(3, 3, 3, 50.00, '2023-01-19', 'Cash'),          -- Spa Massage 
(5, 5, 5, 30.00, '2023-04-23', 'Credit Card'),   -- Housekeeping 
(6, 4, 9, 8.99, '2023-05-21', 'Cash'),          -- Snacks 
(7, 5, 10, 30.00, '2023-06-23', 'Credit Card'),   -- Housekeeping 
(8, 6, 6, 10.00, '2023-02-15', 'Cash');          -- Wi-Fi 


