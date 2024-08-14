create table crs_offrd(
crs_code varchar(8) primary key,
crs_name varchar(50) not null,
crs_credits decimal(2,1),
crs_fac_cd varchar(8) references faculty(fac_code));



-- Computer Science & Technology
INSERT INTO crs_offrd (crs_code, crs_name, crs_credits, crs_fac_cd) VALUES
('CST201', 'Operating Systems', 4, 'FAC001'),
('CST202', 'Algorithms', 4, 'FAC002'),
('CST203', 'Database Management Systems', 4, 'FAC001'),
('CST204', 'Computer Networks', 4, 'FAC002'),
('CST205', 'Artificial Intelligence', 3, 'FAC003'),
('CST206', 'Machine Learning', 3, 'FAC003'),
('CST207', 'Software Engineering', 4, 'FAC004'),
('CST208', 'Web Technology', 4, 'FAC004'),
('CST209', 'Network Security', 3, 'FAC005'),
('CST210', 'Big Data Analytics', 4, 'FAC006');

-- Electronics & Telecommunication Engineering
INSERT INTO crs_offrd (crs_code, crs_name, crs_credits, crs_fac_cd) VALUES
('ETC201', 'Analog Electronics', 4, 'FAC003'),
('ETC202', 'Communication Systems', 4, 'FAC004'),
('ETC203', 'Signal Processing', 4, 'FAC003'),
('ETC204', 'Control Systems', 4, 'FAC004'),
('ETC205', 'VLSI Design', 4, 'FAC005'),
('ETC206', 'Embedded Systems', 4, 'FAC005'),
('ETC207', 'Optical Communication', 3, 'FAC006'),
('ETC208', 'Wireless Communication', 4, 'FAC006'),
('ETC209', 'Microwave Engineering', 4, 'FAC007'),
('ETC210', 'Digital Signal Processing', 4, 'FAC007');

-- Mechanical Engineering
INSERT INTO crs_offrd (crs_code, crs_name, crs_credits, crs_fac_cd) VALUES
('ME201', 'Heat Transfer', 4, 'FAC005'),
('ME202', 'Machine Design', 4, 'FAC006'),
('ME203', 'Manufacturing Processes', 4, 'FAC005'),
('ME204', 'Dynamics of Machinery', 4, 'FAC006'),
('ME205', 'CAD/CAM', 4, 'FAC007'),
('ME206', 'Robotics', 4, 'FAC007'),
('ME207', 'Automobile Engineering', 3, 'FAC008'),
('ME208', 'Fluid Power Control', 4, 'FAC008'),
('ME209', 'Renewable Energy', 4, 'FAC009'),
('ME210', 'Thermal Engineering', 4, 'FAC009');

-- Electrical Engineering
INSERT INTO crs_offrd (crs_code, crs_name, crs_credits, crs_fac_cd) VALUES
('EE201', 'Power Systems', 4, 'FAC007'),
('EE202', 'Electrical Machines', 4, 'FAC008'),
('EE203', 'Power Electronics', 4, 'FAC007'),
('EE204', 'Control Engineering', 4, 'FAC008'),
('EE205', 'High Voltage Engineering', 3, 'FAC009'),
('EE206', 'Electrical Drives', 4, 'FAC009'),
('EE207', 'Renewable Energy Systems', 3, 'FAC010'),
('EE208', 'Smart Grid Technology', 4, 'FAC010'),
('EE209', 'Digital Electronics', 4, 'FAC011'),
('EE210', 'Instrumentation', 4, 'FAC011');

-- Civil Engineering
INSERT INTO crs_offrd (crs_code, crs_name, crs_credits, crs_fac_cd) VALUES
('CE201', 'Geotechnical Engineering', 4, 'FAC009'),
('CE202', 'Transportation Engineering', 4, 'FAC010'),
('CE203', 'Water Resources Engineering', 4, 'FAC009'),
('CE204', 'Construction Management', 4, 'FAC010'),
('CE205', 'Environmental Impact Assessment', 3, 'FAC011'),
('CE206', 'Structural Design', 4, 'FAC011'),
('CE207', 'Surveying', 3, 'FAC012'),
('CE208', 'Urban Planning', 4, 'FAC012'),
('CE209', 'Hydrology', 4, 'FAC013'),
('CE210', 'Foundation Engineering', 4, 'FAC013');

-- Architecture
INSERT INTO crs_offrd (crs_code, crs_name, crs_credits, crs_fac_cd) VALUES
('ARCH101', 'History of Architecture', 4, 'FAC011'),
('ARCH102', 'Urban Design', 4, 'FAC012'),
('ARCH103', 'Building Services', 4, 'FAC011'),
('ARCH104', 'Landscape Architecture', 4, 'FAC012'),
('ARCH105', 'Architectural Acoustics', 3, 'FAC013'),
('ARCH106', 'Green Building Design', 4, 'FAC013'),
('ARCH107', 'Interior Design', 3, 'FAC014'),
('ARCH108', 'Building Information Modeling', 4, 'FAC014'),
('ARCH109', 'Housing', 4, 'FAC015'),
('ARCH110', 'Sustainable Architecture', 4, 'FAC015');

-- Information Technology
INSERT INTO crs_offrd (crs_code, crs_name, crs_credits, crs_fac_cd) VALUES
('IT201', 'Operating Systems', 4, 'FAC013'),
('IT202', 'Computer Networks', 4, 'FAC014'),
('IT203', 'Software Project Management', 4, 'FAC013'),
('IT204', 'Cloud Computing', 4, 'FAC014'),
('IT205', 'Information Security', 3, 'FAC015'),
('IT206', 'Data Mining', 4, 'FAC015'),
('IT207', 'Web Development', 3, 'FAC016'),
('IT208', 'Mobile Computing', 4, 'FAC016'),
('IT209', 'Human-Computer Interaction', 4, 'FAC017'),
('IT210', 'Blockchain Technology', 4, 'FAC017');

-- Mining Engineering
INSERT INTO crs_offrd (crs_code, crs_name, crs_credits, crs_fac_cd) VALUES
('MN201', 'Surface Mining', 4, 'FAC015'),
('MN202', 'Underground Mining', 4, 'FAC016'),
('MN203', 'Mine Ventilation', 4, 'FAC015'),
('MN204', 'Mining Machinery', 4, 'FAC016'),
('MN205', 'Mineral Processing', 3, 'FAC017'),
('MN206', 'Mine Safety Engineering', 4, 'FAC017'),
('MN207', 'Coal Mining', 3, 'FAC018'),
('MN208', 'Environmental Management in Mining', 4, 'FAC018'),
('MN209', 'Mining Economics', 4, 'FAC019'),
('MN210', 'Geomechanics', 4, 'FAC019');

-- Metallurgical & Materials Engineering
INSERT INTO crs_offrd (crs_code, crs_name, crs_credits, crs_fac_cd) VALUES
('MM201', 'Physical Metallurgy', 4, 'FAC017'),
('MM202', 'Materials Characterization', 4, 'FAC018'),
('MM203', 'Extractive Metallurgy', 4, 'FAC017'),
('MM204', 'Advanced Materials', 4, 'FAC018'),
('MM205', 'Corrosion Engineering', 3, 'FAC019'),
('MM206', 'Polymer Science', 4, 'FAC019'),
('MM207', 'Composite Materials', 3, 'FAC020'),
('MM208', 'Nanomaterials', 4, 'FAC020'),
('MM209', 'Ceramic Engineering', 4, 'FAC021'),
('MM210', 'Metallurgical Thermodynamics', 4, 'FAC021');

-- Mathematics
INSERT INTO crs_offrd (crs_code, crs_name, crs_credits, crs_fac_cd) VALUES
('MATH201', 'Differential Equations', 4, 'FAC019'),
('MATH202', 'Probability and Statistics', 4, 'FAC020'),
('MATH203', 'Abstract Algebra', 4, 'FAC019'),
('MATH204', 'Real Analysis', 4, 'FAC020'),
('MATH205', 'Complex Analysis', 3, 'FAC021'),
('MATH206', 'Numerical Methods', 4, 'FAC021'),
('MATH207', 'Discrete Mathematics', 3, 'FAC022'),
('MATH208', 'Optimization Techniques', 4, 'FAC022'),
('MATH209', 'Graph Theory', 4, 'FAC023'),
('MATH210', 'Operations Research', 4, 'FAC023');
