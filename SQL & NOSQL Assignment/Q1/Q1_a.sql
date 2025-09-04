/* CTE to track student progress through stages
   Calculates sequence of stages and previous exam date for each student */
with stage_progress AS (
	SELECT StudentID, Stage, ExamDateTime, Status,
    row_number() over (partition by StudentID order by ExamDateTime) as Stage_Seq, /* provided to display stage order */
    lag(ExamDateTime) over (partition by StudentID order by ExamDateTime) as Prev_Exam_Date /* provided to calculate turnaround time */
    FROM time_travel /* name of table containing exam data of students */
    WHERE ExamDateTime is not null 
),

/* CTE to calculate metrics for each stage
   Calculates metrics like pass, fail students and avg turnaround time */
stage_metrics AS (
	SELECT Stage, 
	MIN(stage_seq) as Stage_Order, /* provided to display stage order */
    count(distinct StudentID) as Total_Students,
    count(distinct CASE WHEN Status = 'Pass' THEN StudentID END) as Passed_Students,
    count(distinct CASE WHEN Status = 'FAIL' THEN StudentID END) as Failed_Students,
    
    /* Calculate average turnaround time */
    AVG(CASE
		WHEN Prev_Exam_Date is not null THEN timestampdiff(DAY, Prev_Exam_Date, ExamDateTime)
        END) AS Avg_Turnaround_Time
        
	FROM stage_progress
    GROUP BY 1
)

/* Final output with formatted results */
SELECT Stage, Total_Students, Passed_Students, Failed_Students,
	concat(ROUND((Passed_Students * 100.0 / Total_Students), 1), ' %') as 'Pass %',
    concat(ROUND((Failed_Students * 100.0 / Total_Students), 1), ' %') as 'Fail %',
    
    /* If this is the first stage, then avg turnaround time is null, 
    print 'First Stage' else average turnaround time */
    CASE 
    WHEN Avg_Turnaround_Time is null THEN 'First Stage'
    ELSE concat(ROUND(Avg_Turnaround_Time, 1), ' days') 
    END as 'Avg Turnaround Time'
    
FROM stage_metrics
ORDER BY Stage_Order /* Orders values in this order - Descriptive Exam, Face-to-Face Interview, IQ Test and Technical Entrance Test */
    

