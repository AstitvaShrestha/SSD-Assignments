with pass_rate AS(
	SELECT Stage, 'Gender' as dtype, Gender as dvalue,
		count(distinct StudentID) as Total_Students,
		count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) as Passed_Students,
        ROUND( count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) * 100.0 / count(distinct StudentID), 1) as Pass_Rate

	FROM time_travel
    GROUP BY Stage, Gender
    
    UNION ALL
    
    SELECT Stage, 'Age Band' as dtype, 
		CASE
			WHEN Age BETWEEN 18 AND 20 THEN '18-20'
            WHEN Age BETWEEN 21 AND 23 THEN '21-23'
            WHEN Age BETWEEN 24 AND 25 THEN '24-25'
            ELSE '>25'
		END AS dvalue,
        
        count(distinct StudentID) as Total_Students,
		count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) as Passed_Students,
        ROUND(count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) * 100.0 / count(distinct StudentID), 1) as Pass_Rate
		
	FROM time_travel
    WHERE Age is not null
    GROUP BY Stage,
		CASE
			WHEN Age BETWEEN 18 AND 20 THEN '18-20'
            WHEN Age BETWEEN 21 AND 23 THEN '21-23'
            WHEN Age BETWEEN 24 AND 25 THEN '24-25'
            ELSE '>25'
		END
        
	UNION ALL
    
    SELECT Stage, 'City' as dtype, City as dvalue,
		count(distinct StudentID) as Total_Students,
		count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) as Passed_Students,
        ROUND( count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) * 100.0 / count(distinct StudentID), 1) as Pass_Rate
		
	FROM time_travel
	WHERE City is not null
    Group by Stage, City

),

stage_order AS(
	SELECT Stage, MIN(ExamDateTime) as min_exam_date
    FROM time_travel
    GROUP BY 1
)

SELECT pr.Stage as 'Admission Stage',
	pr.dtype as 'Dimension',
    pr.dvalue as 'Category',
    pr.Total_Students as 'Total Students',
    pr.Passed_Students as 'Passed Students',
    concat(pr.Pass_Rate, ' %') as 'PASS %'

FROM pass_rate as pr
JOIN stage_order as so
ON pr.Stage = so.Stage
ORDER BY pr.dtype,
        pr.dvalue,
        so.min_exam_date;



