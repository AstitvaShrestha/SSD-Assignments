/* CTE to calculate pass rate for each stage and dimension */
with pass_rate AS(

    /* Calculates pass rate for each stage and gender */
	SELECT Stage, 'Gender' as dtype, Gender as dvalue,
		count(distinct StudentID) as Total_Students,
		count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) as Passed_Students,

        /* Passed students / total students * 100 */
        ROUND( count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) * 100.0 / count(distinct StudentID), 1) as Pass_Rate

	FROM time_travel /* table containing exam data of student */
    GROUP BY Stage, Gender
    
    UNION ALL
    
    /* Calculates pass rate for each stage and age band */
    SELECT Stage, 'Age Band' as dtype, 
		CASE
			WHEN Age BETWEEN 18 AND 20 THEN '18-20'
            WHEN Age BETWEEN 21 AND 23 THEN '21-23'
            WHEN Age BETWEEN 24 AND 25 THEN '24-25'
            ELSE '>25'
		END AS dvalue,
        
        count(distinct StudentID) as Total_Students,
		count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) as Passed_Students,
        
        /* Passed students / total students * 100 */
        ROUND(count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) * 100.0 / count(distinct StudentID), 1) as Pass_Rate
		
	FROM time_travel /* name of table containing exam data of students */
    WHERE Age is not null

    /* Group by stage and age band */
    GROUP BY Stage,
		CASE
			WHEN Age BETWEEN 18 AND 20 THEN '18-20'
            WHEN Age BETWEEN 21 AND 23 THEN '21-23'
            WHEN Age BETWEEN 24 AND 25 THEN '24-25'
            ELSE '>25'
		END
        
	UNION ALL
    
    /* Calculates pass rate for each stage and city */
    SELECT Stage, 'City' as dtype, City as dvalue,
		count(distinct StudentID) as Total_Students,
		count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) as Passed_Students,
        
        /* Passed students / total students * 100 */
        ROUND( count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) * 100.0 / count(distinct StudentID), 1) as Pass_Rate
		
	FROM time_travel /* name of table containing exam data of students */
	WHERE City is not null
    Group by Stage, City

),

/* CTE to calculate stage order */
stage_order AS(
	SELECT Stage, MIN(ExamDateTime) as min_exam_date
    FROM time_travel
    GROUP BY 1
)

/* Final output with formatted results */
SELECT pr.Stage as 'Admission Stage',
	pr.dtype as 'Dimension', /* Gender, Age Band, City */
    pr.dvalue as 'Category', /* Male, Female, 18-20, 21-23, 24-25, >25, Mumbai, Delhi, Bangalore */
    pr.Total_Students as 'Total Students',
    pr.Passed_Students as 'Passed Students',
    concat(pr.Pass_Rate, ' %') as 'PASS %'

FROM pass_rate as pr
JOIN stage_order as so
ON pr.Stage = so.Stage

/* Order by dimension, category and then by stage order */
ORDER BY pr.dtype,
        pr.dvalue,
        so.min_exam_date;



