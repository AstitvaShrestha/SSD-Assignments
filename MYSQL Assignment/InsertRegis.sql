USE Campus;

insert into Student_Registration (StudentID, CourseID, RegistrationDate, Status) VALUES
('1', '1', '2025-01-26', 'Registered'),
('2', '2', '2025-01-27', 'Completed'),
('3', '3', '2025-01-28', 'Dropped'),
('4', '4', '2025-01-29', 'Registered'),
('5', '5', '2025-01-30', 'Completed'),
('1', '3', '2025-02-01', 'Dropped'),
('2', '4', '2025-02-02', 'Registered'),
('3', '5', '2025-02-03', 'Completed'),
('4', '1', '2025-02-04', 'Registered'),
('5', '2', '2025-02-05', 'Dropped');

select * from Student_Registration