create database sheet2;
use sheet2;

create table depts(
deptcode varchar(4) primary key,
deptname varchar(50) not null);

create table students(
rollno varchar(12) primary key,
student_name varchar(50),
deptcode varchar(4),
foreign key (deptcode) references depts(deptcode) on delete cascade,
bdate date check(bdate < '2005-04-01'),
hostel int check(hostel<10),
parent_inc decimal(8,1));

create table faculty(
fac_code varchar(8) primary key,
fac_name varchar(100) not null,
fac_dept varchar(4),
foreign key (fac_dept) references depts(deptcode) on delete cascade);

create table crs_offrd(
crs_code varchar(12) primary key,
crs_name varchar(50) not null,
crs_credits decimal(2,1),
crs_fac_cd varchar(8),
foreign key (crs_fac_cd) references faculty(fac_code) on delete cascade);

create table crs_regd(
crs_rollno varchar(12), 
foreign key (crs_rollno) references students(rollno),
crs_cd varchar(10),
foreign key (crs_cd) references crs_offrd(crs_code),
marks dec(5,2),
primary key(crs_rollno, crs_cd));


-- Insert Data

INSERT INTO depts VALUES ('CSE', 'Computer Science');
INSERT INTO depts VALUES ('ECE', 'Electronics and Communication');
INSERT INTO depts VALUES ('ME', 'Mechanical Engineering');


INSERT INTO students VALUES ('CS1001', 'Rahul Sharma', 'CSE', '2003-03-15', 1, 50000.0);
INSERT INTO students VALUES ('CS1002', 'Priya Singh', 'CSE', '2004-07-20', 2, 40000.0);
INSERT INTO students VALUES ('ECE1001', 'Amit Kumar', 'ECE', '2003-11-11', 3, 45000.0);
INSERT INTO students VALUES ('CS1104', 'Uttam Mahata', 'CSE', '2004-08-04', 4, 60000.0);
INSERT INTO students VALUES ('CS1101', 'Sourav Pahari', 'CSE', '2003-03-15', 1, 80000.0);
INSERT INTO students VALUES ('CS1102', 'Abhilash Kumar', 'CSE', '2004-07-20', 2, 70000.0);


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
INSERT INTO crs_regd VALUES ('CS1104', 'CS103', 92.0);
INSERT INTO crs_regd VALUES ('CS1104', 'CS101', 95.0);
INSERT INTO crs_regd VALUES ('CS1104', 'CS102', 85.0);
INSERT INTO crs_regd VALUES ('CS1102', 'CS101', 95.0);
INSERT INTO crs_regd VALUES ('CS1102', 'CS102', 85.0);
INSERT INTO crs_regd VALUES ('CS1102', 'CS103', 90.0);
INSERT INTO crs_regd VALUES ('CS1102', 'CS103', 80.0);







INSERT INTO depts VALUES ('ELE', 'Electrical Engineering');

INSERT INTO students VALUES ('ELE1001', 'Kiran Deshmukh', 'ELE', '2003-02-19', 1, 52000.0);
INSERT INTO students VALUES ('ELE1002', 'Suresh Mehta', 'ELE', '2003-12-05', 2, 47000.0);
INSERT INTO students VALUES ('ELE1003', 'Rajesh Iyer', 'ELE', '2004-01-10', 3, 65000.0);

INSERT INTO crs_offrd VALUES ('EE101', 'Circuits', 4.0, 'FAC003');
INSERT INTO crs_offrd VALUES ('CS104', 'DBMS', 3.5, 'FAC001');
INSERT INTO crs_offrd VALUES ('CS105', 'OS', 4.0, 'FAC002');
INSERT INTO crs_offrd VALUES ('MG101', 'MIS', 3.0, 'FAC003');
INSERT INTO crs_offrd VALUES ('CS106', 'Software Engg.', 4.0, 'FAC001');

INSERT INTO depts VALUES ('ELE', 'Electrical Engineering');
INSERT INTO students VALUES ('ELE1001', 'Kiran Deshmukh', 'ELE', '2003-02-19', 1, 52000.0);
INSERT INTO students VALUES ('ELE1002', 'Suresh Mehta', 'ELE', '2003-12-05', 2, 47000.0);
INSERT INTO students VALUES ('ELE1003', 'Rajesh Iyer', 'ELE', '2004-01-10', 3, 65000.0);

INSERT INTO crs_offrd VALUES ('EE101', 'Circuits', 4.0, 'FAC003');
INSERT INTO crs_offrd VALUES ('CS104', 'DBMS', 3.5, 'FAC001');
INSERT INTO crs_offrd VALUES ('CS105', 'OS', 4.0, 'FAC002');
INSERT INTO crs_offrd VALUES ('MG101', 'MIS', 3.0, 'FAC003');
INSERT INTO crs_offrd VALUES ('CS106', 'Software Engg.', 4.0, 'FAC001');

INSERT INTO crs_regd VALUES ('ELE1001', 'EE101', 75.0);
INSERT INTO crs_regd VALUES ('ELE1002', 'CS104', 45.0);  
INSERT INTO crs_regd VALUES ('ELE1002', 'CS105', 55.0);  
INSERT INTO crs_regd VALUES ('ELE1003', 'CS104', 65.0);  
INSERT INTO crs_regd VALUES ('CS1003', 'CS104', 30.0);   
INSERT INTO crs_regd VALUES ('CS1003', 'CS105', 70.0);   

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

INSERT INTO students VALUES ('CS1102', 'Abhilash Kumar', 'CSE', '2004-07-20', 2, 70000.0);

INSERT INTO crs_regd VALUES ('CS1102', 'CS101', 95.0);
INSERT INTO crs_regd VALUES ('CS1102', 'CS102', 85.0);
INSERT INTO crs_regd VALUES ('CS1102', 'CS103', 90.0);
INSERT INTO crs_regd VALUES ('CS1102', 'CS104', 80.0);

INSERT INTO students VALUES ('CS1101', 'Sourav Pahari', 'CSE', '2003-03-15', 1, 80000.0);

INSERT INTO crs_regd VALUES ('CS1104', 'CS101', 95.0);
INSERT INTO crs_regd VALUES ('CS1104', 'CS102', 85.0);



INSERT INTO crs_regd (crs_rollno, crs_cd, marks) VALUES
('CS1001', 'CS102', 95.0),  -- Marks > 90 for CS102
('CS1001', 'CS103', 92.0),  -- Marks > 90 for CS103
('CS1002', 'CS103', 91.0);  -- Marks > 90 for CS103

INSERT INTO crs_regd (crs_rollno, crs_cd, marks) VALUES
('CS1004', 'CS104', 85.0),  -- Enrolled in DBMS
('CS1004', 'CS105', 91.0),  -- Enrolled in OS
('CS1005', 'CS104', 88.0),  -- Enrolled in DBMS
('CS1005', 'CS105', 92.0);  -- Enrolled in OS

-- Assuming the existance of several interdepartmental courses, insert the
-- name of the student(s) who is(are) studing under at least one faculty from
-- each department.
INSERT INTO students VALUES ('CS1006', 'Shreyash Iyer', 'CSE', '2004-01-10', 3, 65000.0);
INSERT INTO crs_regd VALUES ('CS1006', 'CS104', 65.0);  -- Enrolled in DBMS
INSERT INTO crs_regd VALUES ('CS1006', 'CS105', 75.0);  -- Enrolled in OS
INSERT INTO crs_regd VALUES ('CS1006', 'EE101', 85.0);  -- Enrolled in Circuits
INSERT INTO crs_regd VALUES ('CS1006', 'MG101', 95.0);  -- Enrolled in MIS
INSERT INTO crs_regd VALUES ('CS1006', 'CS106', 75.0);  -- Enrolled in Software Engg
INSERT INTO crs_regd VALUES ('CS1006', 'ECE101', 85.0);  -- Enrolled in Data Structures


-- Assuming the existance of several interdepartmental courses, insert the
-- name of the student(s) who is(are) studing under at least one faculty from
-- each department.
INSERT INTO students VALUES ('CS1007', 'Praveen Mehta', 'CSE', '2003-12-05', 2, 47000.0);
INSERT INTO crs_regd VALUES ('CS1007', 'CS104', 45.0);  -- Enrolled in DBMS
INSERT INTO crs_regd VALUES ('CS1007', 'CS105', 55.0);  -- Enrolled in OS
INSERT INTO crs_regd VALUES ('CS1007', 'EE101', 65.0);  -- Enrolled in Circuits

-- ADD Faculty
INSERT INTO faculty VALUES ('FAC006', 'Dr. Arpit Iyer', 'ELE');
INSERT INTO faculty VALUES ('FAC007', 'Dr. Amal Rao', 'ME');
INSERT INTO faculty VALUES ('FAC008', 'Dr. Ravindra Mehta', 'CSE');

insert into depts values('ARCH', 'Architecture');





-- Assignment 4
--  Retrieve the name of the students whose name starts with ‘S’ and contains ‘r’ as the second last character.
select student_name
from students
where student_name like 'S%r_';

-- Retrieve the name of the youngest student(s) from the ‘CST’ department along with the total marks obtained by him (them). Calculate Sum of Marks
select student_name, sum(marks) as Total_Marks
from students s

join crs_regd r on s.rollno = r.crs_rollno
where deptcode = 'CSE'

and
bdate = (select min(bdate) from students where deptcode = 'CSE')
group by student_name;

-- Find the age of all the students.
select student_name, datediff(curdate(), bdate) as Age from students;


-- Assignment 5
-- Retrieve the name of the student(s) who obtained second highest marks in
-- ‘DBMS’. Calculate the second highest marks.

select student_name, marks as Second_Highest_Marks
from students s

join crs_regd r on s.rollno = r.crs_rollno
where crs_cd = (
    select crs_code from crs_offrd where crs_name = 'DBMS'
);

and

marks = (
    select max(marks) from crs_regd where crs_cd = (
        select crs_code from crs_offrd where crs_name = 'DBMS'
    )
    and marks < (
        select max(marks) from crs_regd where crs_cd = (
            select crs_code from crs_offrd where crs_name = 'DBMS'
        )
    )
);

-- Find out the differences between highest and lowest marks obtained in each subject.

select crs_cd, max(marks) - min(marks) as DifferenceOfMarks
from crs_regd

-- Assuming the existance of several interdepartmental courses, retrieve the
-- name of the student(s) who is(are) studing under at least one faculty from
-- each department.

select student_name
from students s

join crs_regd r on s.rollno = r.crs_rollno
where c









