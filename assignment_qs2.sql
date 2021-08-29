create table  table_from_file_path as 
select substring_index(substr(filepath,char_length(substring_index(filepath,' ',1))+7),'_',1) as LastName, 
substring_index(substring_index(filepath,"-",-1),"_",1) as DOB, 
substring_index(substring_index(filepath,"_",-1),".",1) as id 
from dbo.patients;
select * from dbo.table_from_file_path;