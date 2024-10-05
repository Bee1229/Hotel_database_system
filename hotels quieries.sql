--1 Staff whose salary is greater than 4000
SELECT first_name, last_name, salary
FROM public.staff
WHERE salary>'4000';

--2 Number of Staff whose salary is lower than a 1000
SELECT COUNT(salary)
FROM public.staff
WHERE salary<'1000';

--3 joining staff with the staff department 
SElECT first_name, last_name, department_name
FROM public.staff 
Join public.staffdepartment using (staff_id)
join public.department using(department_id);

--4 viewing the staff in hotel 1
SELECT first_name, last_name, department_name
FROM public.staff 
Join public.staffdepartment using (staff_id)
join public.department using(department_id)
where hotel_id = 1 and salary< '1000';

--6 using the distinct function
SELECT count(distinct nationality)
FROM public.guest;

--7 left join
SELECT room.room_type, room.hotel_id, booking.room_number
FROM public.booking 
LEFT JOIN public.room on (room.room_number=booking.room_number);

--8 set INTERSECT
SELECT booking.guest_id
FROM public.booking
INTERSECT
SELECT payment.payment_id
FROM public.payment;

--9 union
SELECT booking.guest_id AS Identification, payment.amount AS RoomAmount, payment.paymentmethod AS RoomtypePaymethod
FROM public.payment 
LEFT JOIN public.booking ON (payment.booking_id = booking.booking_id)
UNION ALL
SELECT room.hotel_id, booking.room_number, room.room_type
FROM public.booking 
LEFT JOIN public.room ON (room.room_number=booking.room_number);

--9 negative query 
SELECT * 
FROM public.room
WHERE NOT exists 
(SELECT *
FROM PUBLIC.roomservice
WHERE roomservice.room_number=room.room_number);

--10 CROSS JOIN
SELECT hotel.hotel_name, hotel.hotel_location,hotel.rating, room.room_type,room.status
FROM public.hotel
CROSS JOIN public.room 
WHERE room.status = 'Available';

--11 FULL (OUTER) JOIN and ORDER
SELECT guest.first_name, guest.last_name, booking.booking_id,booking.room_number
FROM public.guest
FULL OUTER JOIN public.booking ON guest.guest_id=booking.guest_id
ORDER BY guest.first_name;

--12 INTERSECT retrieves the records that are identical/common between the result sets of two or more tables 
SELECT  
    guest_id, 
    first_name, 
    last_name, 
    date_of_birth, 
    phone, 
    gender, 
    nationality 
FROM public.guest 
INTERSECT 
SELECT  
    guest_id, 
    NULL AS first_name, 
    NULL AS last_name, 
    NULL AS date_of_birth, 
    NULL AS phone, 
    NULL AS gender, 
    NULL AS nationality 
FROM public.feedback; 

 --13 Using the CASE function  
SELECT  
    feedback_id, 
    rating, 
    CASE 
        WHEN rating >= 4 THEN 'Positive' 
        WHEN rating = 3 THEN 'Neutral' 
        ELSE 'Negative' 
    END AS feedback_category 
FROM public.feedback; 

 --14 Using the OR operator     
select * 
from public.feedback 
where rating =4 OR guest_id = 4;  
 
 --15 using the GROUP BY function 
SELECT AVG(guest_count) 
    FROM ( 
        SELECT reservation_id, COUNT(*) AS guest_count 
        FROM public.guests_reservation 
        GROUP BY reservation_id)AS avg_guests;

 --16 subquery inside WHERE 
SELECT * 
FROM reservation 
WHERE ( 
    SELECT COUNT(*) 
    FROM public.guests_reservation 
    WHERE guests_reservation.reservation_id = reservation.reservation_id 
) > ( 
    SELECT AVG(guest_count) 
    FROM ( 
        SELECT reservation_id, COUNT(*) AS guest_count 
        FROM public.guests_reservation 
        GROUP BY reservation_id 
    ) AS avg_guests 
); 
