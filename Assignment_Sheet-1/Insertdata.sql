
INSERT INTO depts VALUES ('CSE', 'Computer Science');
INSERT INTO depts VALUES ('ECE', 'Electronics and Communication');
INSERT INTO depts VALUES ('ME', 'Mechanical Engineering');


INSERT INTO students VALUES ('CS1001', 'Rahul Sharma', 'CSE', '2003-03-15', 1, 50000.0);
INSERT INTO students VALUES ('CS1002', 'Priya Singh', 'CSE', '2004-07-20', 2, 40000.0);
INSERT INTO students VALUES ('CS1003', 'Avi Agarwal', 'CSE', '2003-05-10', 3, 60000.0);
INSERT INTO students VALUES ('ECE1001', 'Amit Kumar', 'ECE', '2003-11-11', 3, 45000.0);


INSERT INTO faculty VALUES ('FAC001', 'Dr. Deepak Bhardwaj Pradhan', 'CSE');
INSERT INTO faculty VALUES ('FAC002', 'Dr. Nandita Lal Shaini', 'CSE');
INSERT INTO faculty VALUES ('FAC003', 'Dr. Mahesh Patel', 'ME');


INSERT INTO crs_offrd VALUES ('CS101', 'Data Structures', 4.0, 'FAC001');
INSERT INTO crs_offrd VALUES ('CS102', 'Algorithms', 5.0, 'FAC002');
INSERT INTO crs_offrd VALUES ('CS103', 'Machine Learning', 7.0, 'FAC001');
INSERT INTO crs_offrd VALUES ('ECE101', 'Digital Electronics', 4.5, 'FAC003');


INSERT INTO crs_regd VALUES ('CS1001', 'CS101', 85.0);
INSERT INTO crs_regd VALUES ('CS1002', 'CS102', 90.0);
INSERT INTO crs_regd VALUES ('ECE1001', 'ECE101', 88.0);




INSERT INTO crs_offrd VALUES ('EE101', 'Circuits', 4.0, 'FAC003');
INSERT INTO crs_offrd VALUES ('CS104', 'DBMS', 3.5, 'FAC001');
INSERT INTO crs_offrd VALUES ('CS105', 'OS', 4.0, 'FAC002');
INSERT INTO crs_offrd VALUES ('MG101', 'MIS', 3.0, 'FAC003');
INSERT INTO crs_offrd VALUES ('CS106', 'Software Engg.', 4.0, 'FAC001');

INSERT INTO depts VALUES ('ELE', 'Electrical Engineering');
INSERT INTO students VALUES ('ELE1001', 'Kiran Deshmukh', 'ELE', '2003-02-19', 1, 52000.0);
INSERT INTO students VALUES ('ELE1002', 'Suresh Mehta', 'ELE', '2003-12-05', 2, 47000.0);
INSERT INTO students VALUES ('ELE1003', 'Rajesh Iyer', 'ELE', '2004-01-10', 3, 65000.0);



INSERT INTO crs_regd VALUES ('ELE1001', 'EE101', 75.0);
INSERT INTO crs_regd VALUES ('ELE1002', 'CS104', 45.0);  
INSERT INTO crs_regd VALUES ('ELE1002', 'CS105', 55.0);  
INSERT INTO crs_regd VALUES ('ELE1003', 'CS104', 65.0);  
INSERT INTO crs_regd VALUES ('CS1003', 'CS104', 30.0);   
INSERT INTO crs_regd VALUES ('CS1003', 'CS105', 70.0);   



