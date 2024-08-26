-- Additional students in CSE and other departments
INSERT INTO students VALUES ('CS1003', 'Sanya Gupta', 'CSE', '2003-05-10', 3, 60000.0);
INSERT INTO students VALUES ('CS1004', 'Ankit Verma', 'CSE', '2003-08-25', 4, 55000.0);
INSERT INTO students VALUES ('ME1001', 'Vikram Rao', 'ME', '2004-03-22', 1, 48000.0);
INSERT INTO students VALUES ('CSE1005', 'Neha Dubey', 'CSE', '2003-09-30', 2, 70000.0);

-- Additional course registrations
INSERT INTO crs_regd VALUES ('CS1003', 'CS101', 78.0);
INSERT INTO crs_regd VALUES ('CS1004', 'CS102', 83.0);
INSERT INTO crs_regd VALUES ('CS1003', 'CS103', 88.0);
INSERT INTO crs_regd VALUES ('CS1005', 'CS103', 92.0);
INSERT INTO crs_regd VALUES ('ME1001', 'ECE101', 75.0);

INSERT INTO faculty (fac_code, fac_name, fac_dept) VALUES
('FAC004', 'Dr. Priya Mehta', 'ECE'),
('FAC005', 'Dr. Arjun Rao', 'ME');



INSERT INTO crs_regd (crs_rollno, crs_cd, marks) VALUES
('CS1001', 'CS102', 95.0),  
('CS1001', 'CS103', 92.0),  
('CS1002', 'CS103', 91.0);  

INSERT INTO crs_regd (crs_rollno, crs_cd, marks) VALUES
('CS1004', 'CS104', 85.0),  
('CS1004', 'CS105', 91.0),  
('CS1005', 'CS104', 88.0),  
('CS1005', 'CS105', 92.0);  


