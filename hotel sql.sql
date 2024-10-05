-- Hotel Table
CREATE TABLE Hotel (
    Hotel_id INT PRIMARY KEY,
    hotel_name VARCHAR(255),
    hotel_location VARCHAR(255),
    Rating FLOAT
);

-- Staff Table
CREATE TABLE Staff (
    Staff_id INT PRIMARY KEY,
	Hotel_id INT,
    First_name VARCHAR(255),
	Last_name VARCHAR(255),
    Salary DECIMAL(10, 2),
    date_of_birth DATE,
    FOREIGN KEY (Hotel_id) REFERENCES Hotel(Hotel_id)
);

-- Department Table
CREATE TABLE Department (
    Department_id INT PRIMARY KEY,
    department_Name VARCHAR(255),
    Description VARCHAR(255)
);

-- StaffDepartment Table
CREATE TABLE StaffDepartment (
    StaffDept_id INT PRIMARY KEY,
    Department_id INT,
    Staff_id INT,
    FOREIGN KEY (Department_id) REFERENCES Department(Department_id),
    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);

-- Guest Table
CREATE TABLE Guest (
    Guest_id INT PRIMARY KEY,
    first_Name VARCHAR(255),
	last_Name VARCHAR(255),
	email VARCHAR(255),
	nationality VARCHAR(255),
	gender VARCHAR(1),
    phone VARCHAR(255)
);

-- Room Table
CREATE TABLE Room (
    Room_number INT PRIMARY KEY,
    room_type VARCHAR(255),
    Status VARCHAR(255),
    Hotel_id INT,
	Additional_info VARCHAR(255),
    FOREIGN KEY (Hotel_id) REFERENCES Hotel(Hotel_id)
);

-- RoomService Table
CREATE TABLE RoomService (
    Service_id INT PRIMARY KEY,
    Room_number INT,
    Description VARCHAR(255),
    price DECIMAL(10, 2),
    service_date DATE,
    FOREIGN KEY (Room_number) REFERENCES Room(Room_number)
);

-- Booking Table
CREATE TABLE Booking (
    Booking_id INT PRIMARY KEY,
    Guest_id INT,
    Room_number INT,
    Check_In_Date DATE,
    Check_Out_Date DATE,
    FOREIGN KEY (Guest_id) REFERENCES Guest(Guest_id),
    FOREIGN KEY (Room_number) REFERENCES Room(Room_number)
);

-- Payment Table
CREATE TABLE Payment (
    Payment_id INT PRIMARY KEY,
    Booking_id INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(255),
    FOREIGN KEY (Booking_id) REFERENCES Booking(Booking_id)
);

-- Service Table
CREATE TABLE Service (
    Service_id INT PRIMARY KEY,
    service_name VARCHAR(255),
    Description VARCHAR(255),
    price DECIMAL(10, 2)
);

-- ServicePayment Table
CREATE TABLE ServicePayment (
    Service_payment_id INT PRIMARY KEY,
    Service_id INT,
    Booking_id INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(255),
    FOREIGN KEY (Service_id) REFERENCES Service(Service_id),
    FOREIGN KEY (Booking_id) REFERENCES Booking(Booking_id)
);