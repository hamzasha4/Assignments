SELECT * FROM (
  SELECT
    [patient_id],
    [vital],
    [vitaldate],
	[vitalvalue]
  FROM PF_Vitals
) sourcetable
PIVOT (
  MIN([vitalvalue])
  FOR [vital]
  IN (
    [Weight],
    [Height],
    [BMI (Body Mass Index)],
	[O2 Saturation],
	[Systolic BP],
	[Temperature],
	[Diastolic BP],
	[Respiratory rate],
	[Pulse],
	[Pain],
	[Body mass index (BMI) [Percentile]] Per age and sex]
		
  )
) AS PivotTable

Select * from [dbo].[PF_Vitals]
where vital='Body mass index (BMI) [Percentile] Per age and sex'