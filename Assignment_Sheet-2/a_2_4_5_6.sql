select student_name
from students
where student_name like 'S%r_';


SELECT student_name, SUM(marks) AS Total_Marks
FROM students s
JOIN crs_regd r ON s.rollno = r.crs_rollno
WHERE deptcode = 'CSE'
GROUP BY student_name

INTERSECT

SELECT student_name, SUM(marks) AS Total_Marks
FROM students s
JOIN crs_regd r ON s.rollno = r.crs_rollno
WHERE deptcode = 'CSE' AND bdate = (SELECT MAX(bdate) FROM students WHERE deptcode = 'CSE')
GROUP BY student_name;



select student_name,
 TIMESTAMPDIFF(YEAR, bdate, CURDATE()) as Age from students;
 
 -------------------------------------------------------------
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
-------------------------------------------------------------

select crs_cd, max(marks) - min(marks) as DifferenceOfMarks
from crs_regd
group by crs_cd;
-------------------------------------------------------------





SELECT s.student_name
FROM students s
JOIN crs_regd cr ON s.rollno = cr.crs_rollno
JOIN crs_offrd co ON cr.crs_cd = co.crs_code
JOIN faculty f ON co.crs_fac_cd = f.fac_code
GROUP BY s.rollno, s.student_name
HAVING COUNT(DISTINCT f.fac_code) = (SELECT COUNT(*) FROM depts);

-------------------------------------------------------------

SELECT s.student_name
FROM students s
JOIN crs_regd cr ON s.rollno = cr.crs_rollno
JOIN crs_offrd co ON cr.crs_cd = co.crs_code
JOIN faculty f ON co.crs_fac_cd = f.fac_code
WHERE s.deptcode = f.fac_dept
GROUP BY s.rollno, s.student_name
HAVING COUNT(*) = (
    SELECT COUNT(*)
    FROM crs_regd cr2
    JOIN crs_offrd co2 ON cr2.crs_cd = co2.crs_code
    JOIN faculty f2 ON co2.crs_fac_cd = f2.fac_code
    WHERE cr2.crs_rollno = s.rollno
);
-------------------------------------------------------------

SELECT deptcode, MAX(parent_inc) AS highest_income
FROM students
WHERE deptcode != 'ARCH'
GROUP BY deptcode
HAVING MAX(parent_inc) < 12000;



SELECT DISTINCT parent_inc
FROM students s1
WHERE hostel = 5
  AND 4 = (
    SELECT COUNT(DISTINCT s2.parent_inc)
    FROM students s2
    WHERE s2.hostel = 5
      AND s2.parent_inc > s1.parent_inc
  );



SELECT rollno
FROM students s
WHERE rollno IN (
    SELECT crs_rollno
    FROM crs_regd r
    JOIN students s2 ON r.crs_rollno = s2.rollno
    WHERE s.deptcode = s2.deptcode
    GROUP BY crs_rollno
    HAVING SUM(r.marks) = (
        SELECT MAX(total_marks)
        FROM (
            SELECT s3.deptcode, r2.crs_rollno, SUM(r2.marks) AS total_marks
            FROM crs_regd r2
            JOIN students s3 ON r2.crs_rollno = s3.rollno
            GROUP BY s3.deptcode, r2.crs_rollno
        ) AS dept_marks
        WHERE dept_marks.deptcode = s.deptcode
    )
);















