USE Campus;

CREATE TABLE IF NOT EXISTS Students (
	StudentID INT auto_increment primary key,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    DateOfBirth DATE,
    Email varchar(100) unique
    );
    
CREATE table IF NOT exists Faculty(
	FacultyID int auto_increment primary key,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    Department varchar(100),
    email varchar(100) unique
    );
    
create table if not exists Course(
	CourseID int auto_increment primary key,
    CourseName varchar(100) not null,
    Credits int check (Credits > 0),
    FacultyID int,
    foreign key (FacultyID) references Faculty(FacultyID)
    );
    
Show tables;
describe Students;









    