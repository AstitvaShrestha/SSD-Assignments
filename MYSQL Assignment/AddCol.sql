USE Campus;

alter table Student_Registration add column semester varchar(10) after status;

select * from Student_Registration;

UPDATE Student_Registration
set semester = case RegistrationID
    when 1 then 3
    when 2 then 1
    when 3 then 4
    when 4 then 2
    when 5 then 3
    when 6 then 1
    when 7 then 4
    when 8 then 2
    when 9 then 1
    when 10 then 3
END
where  RegistrationID between 1 and 10;


select * from Student_Registration;
