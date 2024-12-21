CREATE TABLE Departments (
  department_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  location VARCHAR(50) NOT NULL
);

INSERT INTO Departments (name, location) VALUES
('Cardiology', 'Building A'),
('Orthopedics', 'Building B'),
('Neurology', 'Building C'),
('Pediatrics', 'Building D'),
('Dermatology', 'Building E');


CREATE TABLE Doctors (
  doctor_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  specialization VARCHAR(50) NOT NULL,
  phone VARCHAR(15) NOT NULL,
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE CASCADE
);

INSERT INTO Doctors (name, specialization, phone, department_id) VALUES 
('DR John Smith', 'Cardiologist', '123-456-7890', 1),
('Dr. Alice Johnson', 'Orthopedic Surgeon', '234-567-8901', 2),
('Dr. Robert Brown', 'Neurologist', '345-678-9012', 3),
('Dr. Emily Davis', 'Pediatrician', '456-789-0123', 4),
('Dr. Sarah Wilson', 'Dermatologist', '567-890-1234', 5);


CREATE TABLE Patients (
  patient_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  gender VARCHAR(50) NOT NULL,
  phone VARCHAR(15) NOT NULL
);

INSERT INTO Patients (name, age, gender, phone) VALUES
('John Doe', 30, 'Male', '987-654-3210'),
('Jane Smith', 25, 'Female', '876-543-2109'),
('Emily Clark', 40, 'Female', '765-432-1098'),
('Michael Johnson', 35, 'Male', '654-321-0987'),
('Sarah Lee', 28, 'Female', '543-210-9876');

CREATE TABLE Appointments (
  appointment_id INT PRIMARY KEY AUTO_INCREMENT,
  date DATE NOT NULL,
  time TIME NOT NULL,
  status VARCHAR(50) NOT NULL,
  doctor_id INT,
  patient_id INT,
  FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE
);


INSERT INTO Appointments (date, time, status, doctor_id, patient_id) VALUES
('2024-12-22', '09:00:00', 'Scheduled', 1, 1),
('2024-12-22', '10:30:00', 'Completed', 2, 2),
('2024-12-23', '11:00:00', 'Cancelled', 3, 3),
('2024-12-23', '14:00:00', 'Scheduled', 4, 4),
('2024-12-24', '08:30:00', 'Completed', 5, 5);

