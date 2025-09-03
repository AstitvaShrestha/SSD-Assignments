-- USE masters;
-- DROP PROCEDURE IF EXISTS getStudentPerformance;

DELIMITER $$

CREATE PROCEDURE getStudentPerformance(IN p_StudentID VARCHAR(10))
BEGIN
    -- Define the 4 fixed stages
    with stages AS (
        SELECT 'Technical Entrance Test' AS Stage, 1 AS stage_order 
        UNION ALL
        SELECT 'IQ Test', 2 
        UNION ALL
        SELECT 'Descriptive Exam', 3 
        UNION ALL
        SELECT 'Face-to-Face Interview', 4
    )
    SELECT 
        p_StudentID AS StudentID,
        st.Stage,
        coalesce(s.Status, 'Fail') AS Status,
        coalesce(s.Gender, (SELECT Gender FROM time_travel WHERE StudentID = p_StudentID LIMIT 1)) as Gender,
        coalesce(s.City, (SELECT City FROM time_travel WHERE StudentID = p_StudentID LIMIT 1)) as City,
        coalesce(s.Age, (SELECT Age FROM time_travel WHERE StudentID = p_StudentID LIMIT 1)) as Age,

        -- Peer stats by Gender
        (SELECT concat(ROUND(sum(Status='Pass') * 100.0 / count(*), 1), ' %')
         FROM time_travel as t
         WHERE t.Stage = st.Stage
           AND t.Gender = (SELECT Gender 
						   FROM time_travel 
                           WHERE StudentID = p_StudentID 
                           LIMIT 1)
           AND t.StudentID != p_StudentID) AS `Peer Pass Rate Gender`,

        -- Peer stats by City
        (SELECT concat(ROUND(sum(Status='Pass') * 100.0 / count(*), 1), ' %')
         FROM time_travel as t
         WHERE t.Stage = st.Stage
           AND t.City = (SELECT City 
						 FROM time_travel 
                         WHERE StudentID = p_StudentID 
                         LIMIT 1)
           AND t.StudentID != p_StudentID) AS `Peer Pass Rate City`,

        -- Peer stats by Age
        (SELECT concat(ROUND(sum(Status='Pass') * 100.0 / count(*), 1), ' %')
         FROM time_travel t
         WHERE t.Stage = st.Stage
           AND t.Age = (SELECT Age 
						FROM time_travel 
                        WHERE StudentID = p_StudentID 
                        LIMIT 1)
           AND t.StudentID != p_StudentID) AS `Peer Pass Rate Age`

    FROM stages st
    LEFT JOIN time_travel as s
      ON s.StudentID = p_StudentID AND s.Stage = st.Stage
    ORDER BY st.stage_order;
END$$

DELIMITER ;


-- call getStudentPerformance('S202500001');