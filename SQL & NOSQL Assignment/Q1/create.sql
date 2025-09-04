/* created database to store exam data */
create database masters; 
use masters;

create table if not exists time_travel (
	StudentID varchar(10) not null, 
    FirstName varchar(50) not null,	
    LastName varchar(50),
	Age int,
	Gender enum('Male', 'Female') not null,
	City varchar(50),
	State varchar(50),
	Email varchar(50),
	PhoneNumber varchar(15),
	Stage enum('Descriptive Exam', 'Face-to-Face Interview', 'IQ Test', 'Technical Entrance Test') not null,
	ExamDateTime datetime,
	Status enum('Pass', 'Fail') not null,
    
    primary key (StudentID, Stage)
);

show tables;


