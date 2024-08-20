

select student_name
from students
where student_name like 'S%r_';


select student_name, sum(marks) as Total_Marks
from students s

join crs_regd r on s.rollno = r.crs_rollno
where deptcode = 'CSE'

and
bdate = (select max(bdate) from students where deptcode = 'CSE')
group by student_name;

select student_name,
 TIMESTAMPDIFF(YEAR, bdate, CURDATE()) as Age from students;
 
 
 select student_name, marks as Second_Highest_Marks
from students s

join crs_regd r on s.rollno = r.crs_rollno
where crs_cd = (
    select crs_code from crs_offrd where crs_name = 'DBMS'
)

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

select crs_cd, max(marks) - min(marks) as DifferenceOfMarks
from crs_regd
group by crs_cd;




