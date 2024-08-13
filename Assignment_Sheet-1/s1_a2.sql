SELECT COUNT(*) AS CSE_Student_Count
FROM students
WHERE deptcode = 'CSE';

SELECT crs_cd, 
       MIN(marks) AS Min_Marks, 
       MAX(marks) AS Max_Marks, 
       AVG(marks) AS Avg_Marks
FROM crs_regd
GROUP BY crs_cd;

SELECT crs_rollno, 
       SUM(crs_offrd.crs_credits) AS Total_Credits
FROM crs_regd
JOIN crs_offrd ON crs_regd.crs_cd = crs_offrd.crs_code
GROUP BY crs_rollno;

SELECT hostel, COUNT(*) AS Number_of_Students
FROM students
WHERE deptcode = 'CSE'
GROUP BY hostel;

SELECT hostel, rollno, parent_inc
FROM students
WHERE parent_inc = (
    SELECT MAX(parent_inc)
    FROM students
    WHERE hostel = students.hostel
);

SELECT student_name, parent_inc
FROM students
WHERE parent_inc > (
    SELECT parent_inc
    FROM students
    WHERE rollno = 'CS1001'
);

SELECT crs_rollno, crs_cd, marks
FROM crs_regd
WHERE marks > (
    SELECT marks
    FROM crs_regd
    WHERE crs_rollno = 'CS1001' AND crs_cd = 'CS102'
)
AND (crs_cd = 'CS102' OR crs_cd = 'CS103');
