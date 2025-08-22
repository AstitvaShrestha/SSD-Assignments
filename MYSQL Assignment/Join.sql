USE Campus;

SELECT
    s.StudentID,
    s.FirstName AS StudentFirstName,
    s.LastName AS StudentLastName,
    s.Email AS StudentEmail,
    c.CourseID,
    c.CourseName,
    c.Credits,
    sr.RegistrationDate,
    sr.Status AS RegistrationStatus,
    sr.semester
FROM
    Students s
INNER JOIN
    Student_Registration sr ON s.StudentID = sr.StudentID
INNER JOIN
    Course c ON sr.CourseID = c.CourseID;
    