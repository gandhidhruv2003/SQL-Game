create database if not exists game;
USE game;

create table Person (
    person_id int primary key,
    name varchar(255),
    email varchar(255),
    phone_number varchar(15)
);

create table Room (
    room_id int primary key,
    room_type enum ('Single', 'Double', 'Suite'),
    availability enum ('Available', 'Occupied', 'Under Maintenance'),
    rate_per_night DECIMAL(10, 2),
    smoking_allowed enum ('Yes', 'No')
);

create table Guest (
    guest_id int primary key,
    person_id int,
    room_assigned_id int,
    check_in date,
    check_out date,
    foreign key (person_id) references Person(person_id),
    foreign key (room_assigned_id) references Room(room_id)
);

create table Room_Access (
    access_id int primary key,
    accesser_id int,
    room_id int,
    check_in_time date,
    check_out_time date,
    foreign key (accesser_id) references Person(person_id),
    foreign key (room_id) references Room(room_id)
);

create table Department (
    department_id int primary key,
    department_name varchar(50)
);

create table Employee (
    employee_id int primary key,
    person_id int,
    department_id int,
    joining_date date,
    foreign key (person_id) references Person(person_id),
    foreign key (department_id) references Department(department_id)
);

create table Demography (
    demographic_id int primary key,
    person_id int,
    gender varchar(10),
    date_of_birth date,
    marital_status enum ('Single', 'Married', 'Divorced'),
    education_level varchar(50),
    occupation varchar(50),
    disabilities varchar(255),
    height int,
    hair_color varchar(20),
    eye_color varchar(20),
    foreign key (person_id) references Person(person_id)
);

create table Criminal_Record (
    record_id int primary key,
    criminal_id int,
    crime_type varchar(50),
    crime_date date,
    arress_date date,
    court_date date,
    conviction_status enum ('Convicted', 'Acquitted', 'Pending'),
    sentence varchar(255),
    sentence_length int,
    foreign key (criminal_id) references Person(person_id)
);

create table Crime_Scene_Report (
    report_id int primary key,
    date_of_crime date,
    type varchar(50),
    description varchar(255),
    place_of_crime varchar(255)
);

create table Interview (
    InterviewerID int primary key,
    Transcript TEXT
);
