create database if not exists game;
USE game;

create table Person (
    person_id int primary key not null,
    name varchar(255),
    phone_number varchar(15),
    address text
);

create table Room (
    room_id int primary key not null,
    room_type enum ('Single', 'Double', 'Suite'),
    availability enum ('Available', 'Occupied', 'Under Maintenance'),
    rate_per_night decimal (10, 2),
    smoking_allowed enum ('Yes', 'No')
);

create table Guest (
    guest_id int primary key not null,
    person_id int not null,
    room_assigned_id int not null,
    check_in datetime,
    check_out datetime,
    foreign key (person_id) references Person(person_id),
    foreign key (room_assigned_id) references Room(room_id)
);

create table Room_Access (
    access_id int primary key not null,
    accesser_id int not null,
    room_id int not null,
    check_in_time datetime,
    check_out_time datetime,
    foreign key (accesser_id) references Person(person_id),
    foreign key (room_id) references Room(room_id)
);

create table Department (
    department_id int primary key not null,
    department_name varchar(50)
);

create table Employee (
    employee_id int primary key not null,
    person_id int not null,
    department_id int not null,
    joining_date date,
    foreign key (person_id) references Person(person_id),
    foreign key (department_id) references Department(department_id)
);

create table Demography (
    demographic_id int primary key not null,
    person_id int not null,
    gender varchar(10),
    date_of_birth date,
    marital_status enum ('Single', 'Married', 'Divorced'),
    education_level varchar(50),
    occupation varchar(50),
    disabilities varchar(255) default NULL,
    height int,
    hair_color varchar(20),
    eye_color varchar(20),
    foreign key (person_id) references Person(person_id)
);

create table Criminal_Record (
    record_id int primary key not null,
    criminal_id int not null,
    crime_type varchar(50),
    crime_date date,
    arrest_date date,
    court_date date,
    conviction_status enum ('Convicted', 'Acquitted', 'Pending'),
    sentence varchar(255),
    sentence_length int default 0,
    foreign key (criminal_id) references Person(person_id)
);

create table Crime_Scene_Report (
    date_of_crime date,
    type varchar(50),
    description varchar(255),
    place_of_crime varchar(255)
);

create table Interrogation (
	interrogation_id int not null primary key,
    interrogee_id int not null,
    transcript TEXT,
    foreign key (interrogee_id) references Person(person_id)
);

insert into person (person_id, name, phone_number, address)
values 
	(10034, 'John Wilson', 223877684, 'Cityville'),
    (15545, 'Mary Jones', 886016660, 'Leever Way'),
    (16458, 'David Brown', 199098510, 'Townsville'),
    (14215, 'Sarah Davis', 848426583, 'Volpi Circle'),
    (13647, 'Michael Lee', '308711568', 'Virginia Blvd'),
    (11794, 'Doretta Bowline', '737391581', 'Liddicoat Circle'),
    (12533, 'Fawn Harrop', '325500736', 'Keel Circle'),
    (12103, 'Gregoria Kayler', '876115774', 'Northstead Road'),
    (11403, 'Phil Mayer - Culprit', '113335405', 'Back Eddisbury Circle'),
    ('11177', 'Charlie Korth', '355304085', 'Wash Pan Street');

insert into room (room_id, room_type, availability, rate_per_night, smoking_allowed)
values
    (999691, 'Single', 'Available', 75.00, 'Yes'),
    (994473, 'Suite', 'Available', 150.00, 'Yes'),
    (98367, 'Single', 'Available', 75.00, 'Yes'),
    (98778, 'Double', 'Under Maintenance', 120.00, 'Yes'),
    (99442, 'Double', 'Under Maintenance', 120.00, 'Yes'),
    (90775, 'Single', 'Occupied', 60.00, 'No'),
    (93049, 'Single', 'Occupied', 60.00, 'No'),
    (94276, 'Suite', 'Occupied', 140.00, 'No'),
    (94326, 'Double', 'Available', 105.00, 'No'),
    (98631, 'Double', 'Under Maintenance', 120.00, 'Yes'),
    (91297, 'Single', 'Occupied', 60.00, 'No'),
    (98792, 'Double', 'Under Maintenance', 120.00, 'Yes'),
    (99421, 'Double', 'Available', 105.00, 'No'),
    (90061, 'Double', 'Available', 105.00, 'No'),
    (93905, 'Single', 'Available', 75.00, 'Yes'),
    (99050, 'Double', 'Available', 105.00, 'No'),
    (90391, 'Single', 'Available', 75.00, 'Yes'),
    (90421, 'Single', 'Available', 75.00, 'Yes'),
    (90688, 'Suite', 'Available', 150.00, 'Yes'),
    (90955, 'Suite', 'Available', 150.00, 'Yes'),
    (94480, 'Double', 'Available', 105.00, 'No'),
    (94934, 'Single', 'Occupied', 60.00, 'No'),
    (99057, 'Suite', 'Occupied', 140.00, 'No'),
    (90307, 'Suite', 'Occupied', 140.00, 'No'),
    (90710, 'Suite', 'Available', 150.00, 'Yes'),
    (92418, 'Suite', 'Occupied', 140.00, 'No'),
    (99262, 'Suite', 'Occupied', 140.00, 'No'),
    (99654, 'Double', 'Under Maintenance', 120.00, 'Yes'),
    (91307, 'Suite', 'Available', 150.00, 'Yes'),
    (97998, 'Double', 'Under Maintenance', 120.00, 'Yes'),
    (93665, 'Double', 'Available', 105.00, 'No'),
    (93851, 'Single', 'Occupied', 60.00, 'No'),
    (97496, 'Suite', 'Occupied', 140.00, 'No'),
    (99075, 'Single', 'Occupied', 60.00, 'No'),
    (98021, 'Suite', 'Available', 150.00, 'Yes'),
    (99310, 'Single', 'Available', 75.00, 'Yes');
    
insert into guest (guest_id, person_id, room_assigned_id, check_in, check_out)
values
    (879691, 10034, 90307, '2008-11-11 13:23:44', '2008-11-13 15:49:49'),
    (874473, 13647, 90775, '2008-11-09 15:45:21', '2008-11-10 12:40:20'),
    (871367, 14215, 91297, '2008-10-29 14:56:59', '2008-11-01 18:00:56'),
    (872778, 15545, 92418, '2008-11-10 17:13:14', '2008-11-13 15:19:11'),
    (894326, 16458, 93049, '2008-11-01 17:03:04', '2008-11-03 19:40:40');
    
insert into room_access (access_id, accesser_id, room_id, check_in_time, check_out_time)
values
	(79691, 10034, 90307, '2008-10-29 14:56:59', '2008-10-29 16:40:19'),
	(74473, 11177, 90307, '2008-10-28 11:16:49', '2008-10-28 12:01:19'),
	(71367, 11794, 94276, '2008-10-27 12:18:40', '2008-10-27 12:29:45'),
	(72778, 10034, 90307, '2008-10-29 20:01:51', '2008-10-30 11:10:20'),
	(70024, 10034, 90307, '2008-10-30 11:16:49', '2008-10-30 12:01:19'),
	(70288, 10034, 90307, '2008-10-31 16:16:49', '2008-11-01 18:00:56'),
	(70230, 11403, 90307, '2008-11-01 20:16:49', '2008-11-01 21:01:19');
    
insert into department (department_id, department_name)
values
	(401, 'Reception'),
    (402, 'Housekeeping'),
    (403, 'Food and Beverage'),
    (404, 'Maintenance'),
    (405, 'Security'),
    (406, 'Sales and Marketing'),
    (407, 'Finance'),
    (408, 'Human Resources'),
    (409, 'Concierge'),
    (410, 'Spa and Wellness');
    
insert into employee (employee_id, person_id, department_id, joining_date)
values
	(60312, 11403, 402, '2006-10-29'),
	(60260, 12103, 410, '2005-11-19'),
	(60707, 11177, 401, '2009-12-20'),
	(61016, 11794, 406, '2008-10-09'),
	(69143, 12533, 407, '2003-12-12');
    
insert into demography (demographic_id, person_id, gender, date_of_birth, marital_status, education_level, occupation, disabilities, height, hair_color, eye_color)
values
	('30743', '10034', 'Male', '1978-05-21', 'Married', 'Bachelor\'s Degree', 'Engineer', NULL, 188, 'Brown', 'Blue'),
	('31062', '11177', 'Male', '1989-09-15', 'Single', 'Bachelor\'s Degree', 'Receptionist', NULL, 178, 'Black', 'Brown'),
	('30744', '11403', 'Male', '1981-03-04', 'Divorced', 'High School Diploma', 'Janitors', 'Limb loss', 181, 'Brown', 'Green'),
	('30548', '11794', 'Female', '1975-11-30', 'Married', 'Master\'s Degree', 'Manager', NULL, 168, 'Blonde', 'Hazel'),
	('30880', '12103', 'Female', '1983-07-17', 'Single', 'Associate\'s Degree', 'Masseuse', NULL, 163, 'Brown', 'Brown'),
	('30532', '12533', 'Female', '1992-12-08', 'Single', 'Bachelor\'s Degree', 'Accountant', NULL, 172, 'Brown', 'Brown'),
	('38532', '13647', 'Male', '1982-08-29', 'Divorced', 'High School Diploma', 'Chef', NULL, 175, 'Brown', 'Brown'),
	('35528', '14215', 'Female', '1974-04-25', 'Married', 'Doctorate', 'Physician', NULL, 165, 'Blonde', 'Blue'),
	('35891', '15545', 'Female', '1970-10-12', 'Divorced', 'Bachelor\'s Degree', 'Lawyer', NULL, 170, 'Brown', 'Green'),
	('34236', '16458', 'Male', '1977-12-03', 'Married', 'Master\'s Degree', 'Architect', NULL, 183, 'Brown', 'Brown');

insert into criminal_record (record_id, crime_type, crime_date, arrest_date, court_date, conviction_status, sentence, sentence_length)
values
	(20693, 'Murder', '2023-05-10', '2023-05-15', '2023-06-20', 'Convicted', 'Jail', 48),
	(22030, 'Assault', '2022-12-03', '2022-12-05', '2023-01-10', 'Convicted', 'Jail', 4),
	(20773, 'Drug Possession', '2023-08-20', '2023-08-25', '2023-09-30', 'Convicted', 'Execution', NULL),
	(20593, 'Burglary', '2023-02-15', '2023-02-18', '2023-03-25', 'Pending', NULL, NULL),
	(20967, 'Fraud', '2023-10-05', '2023-10-10', NULL, 'Acquitted', NULL, NULL);
    
insert into interrogation (interrogation_id, interrogee_id, transcript)
values
	(51180, 14215, 'I heard someone shouting. When I checked through the peephole, I saw a brown haired man.');
    
insert into crime_scene_report (date_of_crime, type, description, place_of_crime)
values
	('2018-02-02', 'Murder', 'Murder', 'Hotel A90'),
	('2018-01-15', 'Robbery', 'A Man Dressed as Spider-Man Is on a Robbery Spree', 'Grand Rapids');
    
