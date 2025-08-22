USE Campus;

SHOW Tables;

insert into Students(FirstName, LastName, DateOfBirth, Email) VALUES
('Aiden', 'Parker', '1990-02-14', 'aiden.parker@students.iiit.ac.in'),
('Bella', 'Martinez', '1988-07-23', 'bella.martinez@students.iiit.ac.in'),
('Caleb', 'Johnson', '1992-11-05', 'caleb.johnson@students.iiit.ac.in'),
('Diana', 'Thompson', '1995-03-18', 'diana.thompson@students.iiit.ac.in'),
('Ethan', 'Rivera', '1987-09-09', 'ethan.rivera@students.iiit.ac.in'),
('Fiona', 'Brooks', '1993-01-27', 'fiona.brooks@students.iiit.ac.in'),
('Gavin', 'Mitchell', '1991-12-12', 'gavin.mitchell@students.iiit.ac.in'),
('Hannah', 'Lee', '1994-08-30', 'hannah.lee@students.iiit.ac.in'),
('Isaac', 'Carter', '1989-05-16', 'isaac.carter@students.iiit.ac.in'),
('Jacob', 'Adams', '1996-04-02', 'jacob.adams@students.iiit.ac.in');

select * from Students;



insert into Faculty(FirstName, LastName, Department, Email) VALUES
('Dr. Andrew', 'Hughes', 'Computer Science', 'andrew.hughes@iiit.ac.in'),
('Prof. Barbara', 'Stewart', 'Mathematics', 'barbara.stewart@iiit.ac.in'),
('Dr. Charles', 'Wright', 'Physics', 'charles.wright@iiit.ac.in'),
('Prof. Diane', 'Morgan', 'Chemistry', 'diane.morgan@iiit.ac.in'),
('Dr. Edward', 'Foster', 'Biology', 'edward.foster@iiit.ac.in');

select * from Faculty;



insert into Course(CourseName, Credits, FacultyID) VALUES
('Data Structures', '4', '1'),
('Linear Algebra', '3', '2'),
('Quantum Physics', '4', '3'),
('Organic Chemistry', '3', '4'),
('Molecular Biology', '4', '5');

select * from Course;


