CREATE TABLE DailyFee
(WeekDayName VARCHAR(50), Fee MONEY DEFAULT NULL)

INSERT INTO DailyFee
VALUES
('Monday', 20 ), 
( 'Tuesday', 60 ),
( 'Wednesday', NULL ), 
(  'Thurusday', 40 ),
(  'Friday', 80 ),
('Saturday',NULL),
('Sunday',12),
('',NULL),
('',12)

select  *
from  [dbo].[DailyFee] as p
where p.Fee IS NULL;

select  *
from  [dbo].[DailyFee] as p
where p.WeekDayName = '';

select 