-- List students (rollno,name,deptcode) registered for course EE101.
SELECT s.rollno, s.student_name, s.deptcode
FROM students s
JOIN crs_regd r ON s.rollno = r.crs_rollno
WHERE r.crs_cd = 'EE101';

--  List students (rollno,name) in ELE dept registered for course EE101.
SELECT s.rollno, s.student_name
FROM students s
JOIN crs_regd r ON s.rollno = r.crs_rollno
WHERE s.deptcode = 'ELE' AND r.crs_cd = 'EE101';

--  List students (rollno,name) in ELE dept not registered for course EE101.
SELECT s.rollno, s.student_name
FROM students s
WHERE s.deptcode = 'ELE' AND  NOT s.rollno  = (
    SELECT crs_rollno FROM crs_regd WHERE crs_cd = 'EE101'
);



--  List the names of the students who have registered for both the courses 'DBMS' and 'OS'.
SELECT s.student_name
FROM students s
JOIN crs_regd cr1 ON s.rollno = cr1.crs_rollno
JOIN crs_regd cr2 ON s.rollno = cr2.crs_rollno
WHERE cr1.crs_cd = 'CS104'  
INTERSECT

SELECT s.student_name
FROM students s
JOIN crs_regd cr1 ON s.rollno = cr1.crs_rollno
JOIN crs_regd cr2 ON s.rollno = cr2.crs_rollno
WHERE cr1.crs_cd = 'CS105'

--  Find the names of the faculty members who have offered 'MIS' but not offered 'Software Engg.'


SELECT f.fac_name
FROM faculty f
WHERE f.fac_code = (
    SELECT crs_fac_cd 
    FROM crs_offrd 
    WHERE crs_name = 'MIS'
)
INTERSECT

SELECT f.fac_name
FROM faculty f
WHERE 
   f.fac_code =  (
    SELECT crs_fac_cd 
    FROM crs_offrd 
    WHERE crs_name = 'Software Engg.'
);
-- Find out the students in each hostel who are not registered for any course.

SELECT s.hostel, s.rollno, s.student_name
FROM students s
WHERE s.rollno NOT IN(
    SELECT crs_rollno FROM crs_regd
);
-- Select the students who are in ELE dept or who have registered for course CS101.
SELECT rollno, student_name
FROM students
WHERE deptcode = 'ELE'

UNION

SELECT s.rollno, s.student_name
FROM students s
JOIN crs_regd r ON s.rollno = r.crs_rollno
WHERE r.crs_cd = 'CS101';

-- Display the students who have registered to all the courses.
SELECT s.rollno, s.student_name
FROM students s
JOIN crs_regd r ON s.rollno = r.crs_rollno
GROUP BY s.rollno, s.student_name
HAVING COUNT(r.crs_cd) = (SELECT COUNT(*) FROM crs_offrd);

-- Give Grace Marks 5 in subject ‘DBMS’to the students who have scored less than 50 in that subject.
UPDATE crs_regd
SET marks = marks + 5
WHERE crs_cd = 'CS104'
AND marks < 50;

