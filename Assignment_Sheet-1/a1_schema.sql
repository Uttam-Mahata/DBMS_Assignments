create database sheet1;
use sheet1;

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
