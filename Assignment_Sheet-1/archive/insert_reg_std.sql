create table crs_regd(
crs_rollno varchar(12) references students(rollno),
crs_cd varchar(10) references crs_offrd(crs_code),
marks dec(5,2),
primary key(crs_rollno,crs_cd));

INSERT INTO crs_regd (crs_rollno, crs_cd, marks) VALUES
('2022CEB021', 'CE101', 8.00),
('2022CEB022', 'CE102', 7.25),
('2022CEB023', 'CE103', 6.50),
('2022CEB024', 'CE104', 9.00),
('2022CEB025', 'CE105', 8.75),
('2022CEB026', 'CE106', 7.50),
('2022CEB027', 'CE107', 9.25),
('2022CEB028', 'CE108', 6.75),
('2022CEB029', 'CE109', 8.25),
('2022CEB030', 'CE110', 7.00),
('2022CEB031', 'CE111', 9.50),
('2022CEB032', 'CE112', 6.00),
('2022CEB033', 'CE113', 8.00),
('2022CEB034', 'CE114', 7.75),
('2022CEB035', 'CE115', 9.00),
('2022CEB036', 'CE116', 6.50),
('2022CEB037', 'CE117', 8.25),
('2022CEB038', 'CE118', 7.00),
('2022CEB039', 'CE119', 9.50),
('2022CEB040', 'CE120', 6.75),
('2022CSTB014', 'CST101', 8.50),
('2022CSTB015', 'CST102', 7.75),
('2022CSTB016', 'CST103', 9.00),
('2022CSTB017', 'CST104', 6.50),
('2022CSTB018', 'CST105', 8.00),
('2022CSTB019', 'CST106', 7.25),
('2022CSTB020', 'CST107', 9.25),
('2022CSTB021', 'CST108', 6.75),
('2022CSTB022', 'CST109', 8.50),
('2022CSTB023', 'CST110', 7.00),
('2022CSTB024', 'CST111', 9.00),
('2022CSTB025', 'CST112', 6.25),
('2022CSTB026', 'CST113', 8.75),
('2022EEB012', 'EE101', 7.50),
('2022EEB013', 'EE102', 8.00),
('2022EEB014', 'EE103', 6.75),
('2022EEB015', 'EE104', 9.25),
('2022EEB017', 'EE105', 7.00),
('2022EEB018', 'EE106', 8.50),
('2022EEB019', 'EE107', 6.25),
('2022EEB020', 'EE108', 9.00),
('2022EEB021', 'EE109', 7.75),
('2022EEB022', 'EE110', 8.00),
('2022ETC009', 'ETC101', 9.00),
('2022ETC010', 'ETC102', 7.50),
('2022ETC011', 'ETC103', 8.25),
('2022ETC012', 'ETC104', 6.75),
('2022ETC013', 'ETC105', 9.25),
('2022ETC014', 'ETC106', 7.00),
('2022ETC015', 'ETC107', 8.75),
('2022ETC016', 'ETC108', 6.50),
('2022ETC017', 'ETC109', 9.00),
('2020ETC015', 'ETC110', 7.25),
('2022ITB013', 'IT101', 8.50),
('2022ITB014', 'IT102', 6.75),
('2022ITB015', 'IT103', 9.00),
('2022ITB016', 'IT104', 7.25),
('2022ITB017', 'IT105', 8.75),
('2022ITB018', 'IT106', 6.50),
('2022ITB019', 'IT107', 9.25),
('2022ITB020', 'IT108', 7.00),
('2022ITB021', 'IT109', 8.50),
('2022ITB022', 'IT110', 6.75),
('2022ITB023', 'IT111', 9.00),
('2022ITB024', 'IT112', 7.50),
('2022MEB013', 'ME101', 8.00),
('2022MEB014', 'ME102', 7.25),
('2022MEB015', 'ME103', 9.00),
('2022MEB016', 'ME104', 6.75),
('2022MEB017', 'ME105', 8.50),
('2022MEB018', 'ME106', 7.00),
('2022MEB019', 'ME107', 9.25),
('2022MEB020', 'ME108', 6.50),
('2022MEB021', 'ME109', 8.75),
('2022MEB022', 'ME110', 7.00),
('2022MEB023', 'ME111', 9.00),
('2022MEB024', 'ME112', 6.75),
('2022MMB007', 'MM101', 8.25),
('2022MMB008', 'MM102', 7.50),
('2022MMB009', 'MM103', 9.00),
('2022MMB010', 'MM104', 6.75),
('2022MMB011', 'MM105', 8.50),
('2022MMB012', 'MM106', 7.00),
('2022MNB007', 'MN101', 9.25),
('2022MNB008', 'MN102', 6.50),
('2022MNB009', 'MN103', 8.75),
('2022MNB010', 'MN104', 7.00),
('2022MNB011', 'MN105', 9.00);