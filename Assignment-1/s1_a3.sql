SELECT s.rollno, s.student_name, s.deptcode
FROM students s
JOIN crs_regd r ON s.rollno = r.crs_rollno
WHERE r.crs_cd = 'EE101';

SELECT s.rollno, s.student_name
FROM students s
JOIN crs_regd r ON s.rollno = r.crs_rollno
WHERE s.deptcode = 'ELE' AND r.crs_cd = 'EE101';


SELECT s.rollno, s.student_name
FROM students s
WHERE s.deptcode = 'ELE' AND s.rollno NOT IN (
    SELECT crs_rollno FROM crs_regd WHERE crs_cd = 'EE101'
);

SELECT s.student_name
FROM students s
JOIN crs_regd cr1 ON s.rollno = cr1.crs_rollno
JOIN crs_regd cr2 ON s.rollno = cr2.crs_rollno
WHERE cr1.crs_cd = 'CS104'  
AND cr2.crs_cd = 'CS105'; 

SELECT f.fac_name
FROM faculty f
WHERE f.fac_code IN (
    SELECT crs_fac_cd 
    FROM crs_offrd 
    WHERE crs_name IN ('MIS', 'Software Engg.')
);


SELECT f.fac_name
FROM faculty f
WHERE f.fac_code IN (
    SELECT crs_fac_cd 
    FROM crs_offrd 
    WHERE crs_name = 'MIS'
)
AND f.fac_code NOT IN (
    SELECT crs_fac_cd 
    FROM crs_offrd 
    WHERE crs_name = 'Software Engg.'
);

SELECT s.hostel, s.rollno, s.student_name
FROM students s
WHERE s.rollno NOT IN (
    SELECT crs_rollno FROM crs_regd
);

SELECT rollno, student_name
FROM students
WHERE deptcode = 'ELE'

UNION

SELECT s.rollno, s.student_name
FROM students s
JOIN crs_regd r ON s.rollno = r.crs_rollno
WHERE r.crs_cd = 'CS101';


SELECT s.rollno, s.student_name
FROM students s
JOIN crs_regd r ON s.rollno = r.crs_rollno
GROUP BY s.rollno, s.student_name
HAVING COUNT(r.crs_cd) = (SELECT COUNT(*) FROM crs_offrd);

UPDATE crs_regd
SET marks = marks + 5
WHERE crs_cd = 'CS104'
AND marks < 50;

