use sheet1;
INSERT INTO crs_offrd VALUES
('ECE102', 'Signals and Systems', 4, 'FAC004');

INSERT INTO crs_offrd VALUES
('ME102', 'Engineering Drawing', 3, 'FAC005');

INSERT INTO crs_regd VALUES 
('CS1104', 'ECE102', 89);

INSERT INTO crs_regd VALUES 
('CS1104', 'ME102', 78);

INSERT INTO crs_regd VALUES 
('CS1104', 'ECE101', 87);




select student_name
from students
where rollno = (
    select crs_rollno
    from crs_regd
    group by crs_rollno

    having count(distinct crs_cd) >= (
        select count(distinct fac_code) from faculty
    )
);



