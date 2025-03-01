INSERT INTO Doctor (Dr_ID, Fname, Lname, Salary, Phone, Specialty, Dep_ID, Email) 
VALUES 
(101, 'John', 'Smith', 75000.00, '123-456-7890', 'Cardiologist', 1, 'john.smith@hospital.com'),
(102, 'Emma', 'Johnson', 72000.00, '987-654-3210', 'Neurologist', 2, 'emma.johnson@hospital.com'),
(103, 'David', 'Brown', 69000.00, '555-123-4567', 'Orthopedic Surgeon', 3, 'david.brown@hospital.com'),
(104, 'Sophia', 'Williams', 71000.00, '444-789-1234', 'Pediatrician', 4, 'sophia.williams@hospital.com'),
(105, 'Michael', 'Miller', 73000.00, '111-222-3333', 'Dermatologist', 1, 'michael.miller@hospital.com'),
(106, 'Olivia', 'Davis', 77000.00, '222-333-4444', 'Endocrinologist', 2, 'olivia.davis@hospital.com'),
(107, 'William', 'Wilson', 68000.00, '333-444-5555', 'Radiologist', 3, 'william.wilson@hospital.com'),
(108, 'Isabella', 'Moore', 76000.00, '444-555-6666', 'Psychiatrist', 4, 'isabella.moore@hospital.com'),
(109, 'James', 'Taylor', 74000.00, '555-666-7777', 'Gastroenterologist', 1, 'james.taylor@hospital.com'),
(110, 'Charlotte', 'Anderson', 78000.00, '666-777-8888', 'Oncologist', 2, 'charlotte.anderson@hospital.com');
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
INSERT INTO Department (Dep_ID, Name, Loction, Dr_ID) 
VALUES 
(1, 'Cardiology', 'Building A, Floor 2', 101),
(2, 'Neurology', 'Building B, Floor 3', 102),
(3, 'Orthopedics', 'Building C, Floor 1', 103),
(4, 'Pediatrics', 'Building A, Floor 3', 104),
(5, 'Dermatology', 'Building B, Floor 2', 105),
(6, 'Endocrinology', 'Building C, Floor 4', 106),
(7, 'Radiology', 'Building A, Floor 1', 107),
(8, 'Psychiatry', 'Building B, Floor 5', 108),
(9, 'Gastroenterology', 'Building C, Floor 2', 109),
(10, 'Oncology', 'Building A, Floor 4', 110);

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
INSERT INTO Drug (Dg_ID, Name, [Sid Effects]) 
VALUES 

(2, 'Ibuprofen', 'Stomach pain, Dizziness'),
(3, 'Amoxicillin', 'Diarrhea, Skin rash'),
(4, 'Metformin', 'Bloating, Low blood sugar'),
(5, 'Aspirin', 'Heartburn, Increased bleeding'),
(6, 'Cetirizine', 'Drowsiness, Dry mouth'),
(7, 'Omeprazole', 'Headache, Stomach pain'),
(8, 'Atorvastatin', 'Muscle pain, Liver issues'),
(9, 'Losartan', 'Dizziness, Fatigue'),
(10, 'Salbutamol', 'Tremors, Increased heart rate');
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
INSERT INTO Employee (Emp_ID, Fname, Lname, Salary, Addres, Phone, Mng_Emp, Email, Jop_Titile)
VALUES
(1, 'John', 'Doe', 5000, '123 Main St', '123-456-7890', 1, 'john.doe@email.com', 'Administrator'),
(2, 'Jane', 'Smith', 7000, '456 Elm St', '987-654-3210', 1, 'jane.smith@email.com', 'HR Manager'),
(3, 'Robert', 'Brown', 4500, '789 Oak St', '456-789-1234', 1, 'robert.brown@email.com', 'Accountant'),
(4, 'Emily', 'Davis', 5500, '321 Pine St', '789-123-4567', 2, 'emily.davis@email.com', 'IT Support'),
(5, 'Michael', 'Wilson', 6000, '654 Maple St', '321-654-9870', 2, 'michael.wilson@email.com', 'Security Officer'),
(6, 'Sarah', 'Taylor', 4800, '987 Cedar St', '654-321-7890', 3, 'sarah.taylor@email.com', 'Receptionist'),
(7, 'David', 'Anderson', 7500, '741 Birch St', '258-369-1470', 3, 'david.anderson@email.com', 'Finance Manager'),
(8, 'Laura', 'Thomas', 5300, '852 Spruce St', '369-147-2580', 4, 'laura.thomas@email.com', 'Procurement Officer'),
(9, 'James', 'Martinez', 6200, '963 Redwood St', '147-258-3690', 5, 'james.martinez@email.com', 'Maintenance Supervisor'),
(10, 'Olivia', 'Harris', 5000, '159 Walnut St', '753-951-8520', 5, 'olivia.harris@email.com', 'Customer Service');
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
INSERT INTO Medical_record (Med_Re_ID, Tratment, Date, Diagnsis, Pat_ID)
VALUES
(1, 'Physical Therapy', '2025-02-01', 'Back Pain', 101),
(2, 'Antibiotics', '2025-02-05', 'Bacterial Infection', 102),
(3, 'Chemotherapy', '2025-02-10', 'Lung Cancer', 103),
(4, 'Blood Transfusion', '2025-02-12', 'Anemia', 104),
(5, 'Surgery', '2025-02-15', 'Appendicitis', 105),
(6, 'Dialysis', '2025-02-18', 'Kidney Failure', 106),
(7, 'Physiotherapy', '2025-02-20', 'Sports Injury', 107),
(8, 'Radiation Therapy', '2025-02-22', 'Breast Cancer', 108),
(9, 'Insulin Therapy', '2025-02-23', 'Diabetes', 109),
(10, 'Vaccination', '2025-02-24', 'Flu Prevention', 110);
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
INSERT INTO Patient (Pat_ID, Fname, Lname, Six, Address, BD, Invoices_ID, Date, State, Amount, Email)
VALUES
(101, 'John', 'Doe', 'M', '123 Main St', '1985-06-15', 201, '2025-02-01', 'Admitted', 1500.00, 'john.doe@example.com'),
(102, 'Jane', 'Smith', 'F', '456 Oak St', '1992-08-22', 202, '2025-02-03', 'Discharged', 1200.00, 'jane.smith@example.com'),
(103, 'Michael', 'Johnson', 'M', '789 Pine St', '1980-11-05', 203, '2025-02-05', 'Admitted', 1800.00, 'michael.j@example.com'),
(104, 'Emily', 'Brown', 'F', '321 Elm St', '1995-03-12', 204, '2025-02-07', 'Under Treatment', 2500.00, 'emily.b@example.com'),
(105, 'David', 'Wilson', 'M', '654 Maple St', '1987-07-09', 205, '2025-02-09', 'Admitted', 1600.00, 'david.w@example.com'),
(106, 'Emma', 'Miller', 'F', '987 Cedar St', '1990-01-25', 206, '2025-02-11', 'Discharged', 1400.00, 'emma.m@example.com'),
(107, 'Daniel', 'Davis', 'M', '741 Birch St', '1982-05-30', 207, '2025-02-13', 'Under Treatment', 3000.00, 'daniel.d@example.com'),
(108, 'Olivia', 'Garcia', 'F', '852 Walnut St', '1998-12-20', 208, '2025-02-15', 'Admitted', 1700.00, 'olivia.g@example.com'),
(109, 'Matthew', 'Martinez', 'M', '963 Chestnut St', '1975-09-18', 209, '2025-02-17', 'Discharged', 1300.00, 'matthew.m@example.com'),
(110, 'Sophia', 'Hernandez', 'F', '159 Spruce St', '2000-04-10', 210, '2025-02-19', 'Admitted', 2000.00, 'sophia.h@example.com'),
(111, 'James', 'Lopez', 'M', '357 Willow St', '1983-06-21', 211, '2025-02-21', 'Discharged', 1100.00, 'james.l@example.com'),
(112, 'Isabella', 'Gonzalez', 'F', '258 Redwood St', '1991-02-14', 212, '2025-02-23', 'Under Treatment', 2800.00, 'isabella.g@example.com'),
(113, 'Benjamin', 'Perez', 'M', '753 Cypress St', '1989-10-08', 213, '2025-02-25', 'Admitted', 1750.00, 'benjamin.p@example.com'),
(114, 'Mia', 'Rodriguez', 'F', '369 Palm St', '1996-07-27', 214, '2025-02-27', 'Discharged', 1900.00, 'mia.r@example.com'),
(115, 'Alexander', 'Walker', 'M', '741 Aspen St', '1984-12-05', 215, '2025-03-01', 'Under Treatment', 2200.00, 'alexander.w@example.com'),
(116, 'Charlotte', 'Hall', 'F', '159 Sycamore St', '1993-09-02', 216, '2025-03-03', 'Admitted', 1550.00, 'charlotte.h@example.com'),
(117, 'Ethan', 'Allen', 'M', '357 Magnolia St', '1978-05-17', 217, '2025-03-05', 'Discharged', 1350.00, 'ethan.a@example.com'),
(118, 'Amelia', 'Young', 'F', '258 Juniper St', '1994-11-11', 218, '2025-03-07', 'Admitted', 2600.00, 'amelia.y@example.com'),
(119, 'William', 'King', 'M', '753 Olive St', '1981-08-28', 219, '2025-03-09', 'Under Treatment', 2100.00, 'william.k@example.com'),
(120, 'Harper', 'Wright', 'F', '369 Bay St', '2002-01-01', 220, '2025-03-11', 'Discharged', 1000.00, 'harper.w@example.com');
///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
INSERT INTO Wrad (Wr_ID, Name, Nrs_ID)
VALUES
(1, 'General Ward', 101),
(2, 'ICU', 102),
(3, 'Pediatrics', 103),
(4, 'Surgery', 104),
(5, 'Maternity', 105),
(6, 'Cardiology', 106),
(7, 'Neurology', 107),
(8, 'Orthopedics', 108),
(9, 'Oncology', 109),
(10, 'Emergency', 110);
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
UPDATE Nurse SET Fname = 'Sarah', Lname = 'Johnson', Address = '123 Main St', Salary = 4500, Phone = '555-1234', Wr_ID = 1, Email = 'sarah.johnson@example.com' WHERE Nrs_ID = 101;

UPDATE Nurse SET Fname = 'Michael', Lname = 'Smith', Address = '456 Oak St', Salary = 4800, Phone = '555-5678', Wr_ID = 2, Email = 'michael.smith@example.com' WHERE Nrs_ID = 102;

UPDATE Nurse SET Fname = 'Emily', Lname = 'Davis', Address = '789 Pine St', Salary = 4700, Phone = '555-9101', Wr_ID = 3, Email = 'emily.davis@example.com' WHERE Nrs_ID = 103;

UPDATE Nurse SET Fname = 'James', Lname = 'Brown', Address = '321 Maple St', Salary = 4600, Phone = '555-1122', Wr_ID = 4, Email = 'james.brown@example.com' WHERE Nrs_ID = 104;

UPDATE Nurse SET Fname = 'Olivia', Lname = 'Miller', Address = '654 Elm St', Salary = 4900, Phone = '555-3344', Wr_ID = 5, Email = 'olivia.miller@example.com' WHERE Nrs_ID = 105;

UPDATE Nurse SET Fname = 'Daniel', Lname = 'Wilson', Address = '987 Cedar St', Salary = 5000, Phone = '555-5566', Wr_ID = 6, Email = 'daniel.wilson@example.com' WHERE Nrs_ID = 106;

UPDATE Nurse SET Fname = 'Sophia', Lname = 'Moore', Address = '147 Birch St', Salary = 4750, Phone = '555-7788', Wr_ID = 7, Email = 'sophia.moore@example.com' WHERE Nrs_ID = 107;

UPDATE Nurse SET Fname = 'David', Lname = 'Anderson', Address = '258 Walnut St', Salary = 4600, Phone = '555-9900', Wr_ID = 8, Email = 'david.anderson@example.com' WHERE Nrs_ID = 108;

UPDATE Nurse SET Fname = 'Emma', Lname = 'Clark', Address = '369 Cherry St', Salary = 4800, Phone = '555-2233', Wr_ID = 9, Email = 'emma.clark@example.com' WHERE Nrs_ID = 109;

UPDATE Nurse SET Fname = 'Liam', Lname = 'Walker', Address = '951 Spruce St', Salary = 4700, Phone = '555-4455', Wr_ID = 10, Email = 'liam.walker@example.com' WHERE Nrs_ID = 110;

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
INSERT INTO Room (Ro_ID, Name, Avaliblity, Wr_ID) VALUES 
(1, 'ICU Room 101', 'Available', 1),
(2, 'ICU Room 102', 'Occupied', 1),
(3, 'General Room 201', 'Available', 2),
(4, 'General Room 202', 'Occupied', 2),
(5, 'Surgery Room 301', 'Available', 3),
(6, 'Surgery Room 302', 'Occupied', 3),
(7, 'Maternity Room 401', 'Available', 4),
(8, 'Maternity Room 402', 'Occupied', 4),
(9, 'Emergency Room 501', 'Available', 5),
(10, 'Emergency Room 502', 'Occupied', 5);
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
INSERT INTO Patient_Ass_Roon (Ro_ID, Pat_ID) VALUES 
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(6, 106),
(7, 107),
(8, 108),
(9, 109),
(10, 110);
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
INSERT INTO Patient_Doctor_Drug (Pat_ID, Dg_ID, Dr_ID, Date, Time) VALUES 
(101, 1, 109, '2025-02-20', '08:30:00.0000000'),
(102, 1, 102, '2025-02-21', '09:15:00.0000000'),
(103, 2, 103, '2025-02-22', '10:00:00.0000000'),
(104, 2, 104, '2025-02-23', '11:45:00.0000000'),
(105, 3, 105, '2025-02-24', '12:30:00.0000000'),
(106, 5, 106, '2025-02-25', '4:15:00.0000000'),
(107, 8, 107, '2025-02-26', '2:00:00.0000000'),
(108, 10, 102, '2025-02-27', '10:45:00.0000000'),
(109, 4, 103, '2025-02-28', '9:30:00.0000000'),
(110, 9, 110, '2025-02-29', '6:15:00.0000000');
INSERT INTO Patient_Doctor_Drug (Pat_ID, Dg_ID, Dr_ID, Date, Time) 
VALUES 
(101, 1, 101, '2025-02-25', '08:30:00.0000000');
////>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
INSERT INTO Patient_EX_Dr (Dr_ID, Pat_ID)
VALUES 
(101, 104),
(102, 102),
(103, 107),
(104, 109),
(105, 110),
(106, 109),
(107, 103),
(108, 108),
(109, 101),
(110, 103);
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
INSERT INTO Patient_Phones (Pat_ID, Phone)
VALUES 
(101, '123-456-7890'),
(102, '234-567-8901'),
(103, '345-678-9012'),
(104, '456-789-0123'),
(105, '567-890-1234'),
(106, '678-901-2345'),
(107, '789-012-3456'),
(108, '890-123-4567'),
(109, '901-234-5678'),
(110, '012-345-6789'),
(103, '012-345-6789'),
(117, '012-345-6789'),
(112, '012-345-6789'),
(114, '012-345-6789'),
(108, '012-345-6789');
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
alter table Patient 
add constraint check_Six check (Six in ('F' ,'M'));

alter table Room
add constraint check_Avaliblity check (Avaliblity in ('Occupied','Available'))

alter table Patient 
add Age AS (YEAR(GETDATE())- YEAR(BD))



