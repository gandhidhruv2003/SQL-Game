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
    disabilities varchar(255) default 'null',
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
    sentence_length int,
    foreign key (criminal_id) references Person(person_id)
);

create table Crime_Scene_Report (
    report_id int primary key not null,
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
    (11403, 'Phil Mayer', '113335405', 'Back Eddisbury Circle'),
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
	()