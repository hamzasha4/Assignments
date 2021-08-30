select  ROW_NUMBER() over (order by Student_Name) as Roll_Number, 
Student_Name,
Student_Discipline,
Student_Score,
dense_rank() over (order by Student_Score DESC) as University_rank,
ROW_NUMBER() over (partition by Student_Discipline order by Student_Name) as Discipline_Roll_NO,
Dense_Rank() over (partition by Student_Discipline order by Student_Score DESC) as Discipline_Ranking,
rank() over (order by Student_Score DESC) as University_Unique_Ranking
from [dbo].[StudentScore]
order by Roll_Number
