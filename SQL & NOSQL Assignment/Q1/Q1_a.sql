with stage_progress AS (
	SELECT StudentID, Stage, ExamDateTime, Status,
    row_number() over (partition by StudentID order by ExamDateTime) as Stage_Seq,
    lag(ExamDateTime) over (partition by StudentID order by ExamDateTime) as Prev_Exam_Date
    FROM time_travel
    WHERE ExamDateTime is not null
),

stage_metrics AS (
	SELECT Stage, 
	MIN(stage_seq) as Stage_Order,
    count(distinct StudentID) as Total_Students,
    count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) as Passed_Students,
    count(distinct CASE WHEN Status = 'FAIL' THEN StudentID END) as Failed_Students,
    
    AVG(CASE
		WHEN Prev_Exam_Date is not null THEN timestampdiff(DAY, Prev_Exam_Date, ExamDateTime)
        END) AS Avg_Turnaround_Time
        
	FROM stage_progress
    GROUP BY 1
)

SELECT Stage, Total_Students, Passed_Students, Failed_Students,
	concat(ROUND((Passed_Students * 100.0 / Total_Students), 1), ' %') as 'Pass %',
    concat(ROUND((Failed_Students * 100.0 / Total_Students), 1), ' %') as 'Fail %',
    
    CASE 
    WHEN Avg_Turnaround_Time is null THEN 'First Stage'
    ELSE concat(ROUND(Avg_Turnaround_Time, 1), ' days') 
    END as 'Avg Turnaround Time'
    
FROM stage_metrics
ORDER BY Stage_Order
    

