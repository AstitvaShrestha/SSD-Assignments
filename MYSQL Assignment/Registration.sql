USE Campus;

CREATE table if not exists Student_Registration(
	RegistrationID int auto_increment primary key,
    StudentID int,
    CourseID int,
    RegistrationDate date default '2025-01-26',
    Status ENUM('Registered', 'Dropped', 'Completed') DEFAULT 'Registered',
    foreign key (StudentID) references Students(StudentID),
    foreign key (CourseID) references Course(CourseID)
);
    
show tables; 
		