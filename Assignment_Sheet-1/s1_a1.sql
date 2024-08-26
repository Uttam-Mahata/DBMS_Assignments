DELETE FROM depts WHERE deptcode = 'CSE';

SELECT crs_code, crs_name
FROM crs_offrd
WHERE crs_fac_cd = (SELECT fac_code FROM faculty WHERE fac_name = 'Dr. Deepak Bhardwaj Pradhan')
   OR crs_fac_cd = (SELECT fac_code FROM faculty WHERE fac_name = 'Dr. Nandita Lal Shaini');
   
SELECT crs_code, crs_name, crs_credits, crs_fac_cd
FROM crs_offrd
WHERE crs_fac_cd = (
    SELECT fac_code
    FROM faculty
    WHERE fac_name = 'Dr. Deepak Bhardwaj Pradhan'
);

SELECT * FROM crs_offrd
WHERE crs_credits between 4.0 AND 6.0;

SELECT * FROM crs_offrd
WHERE crs_credits > 6.5;


