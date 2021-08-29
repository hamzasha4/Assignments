





TRUNCATE TABLE mig_pmptxft;
ALTER TABLE mig_pmptxft MODIFY COLUMN VTITLE varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VFNAME varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VLNAME varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN DDOB varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VSEX varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VSTATUS varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VADDRESS1 varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VADDRESS2 varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VCITY varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VSTATE varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VZIPCODE varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VPHONE varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VSSN varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VEMAIL varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VCELLNO varchar(100);
ALTER TABLE mig_pmptxft MODIFY COLUMN VWPHONE varchar(100);

INSERT INTO mig_pmptxft (VTITLE, VFNAME, VLNAME, DDOB,VSEX,VSTATUS,VADDRESS1,VADDRESS2,VCITY,VSTATE,VZIPCODE,VPHONE,VSSN,VEMAIL,VCELLNO,VWPHONE)
SELECT 
CASE WHEN patientsex = 'M' THEN 'MALE'
WHEN patientsex = 'F' THEN 'FEMALE'
ELSE 'OTHER' 
END AS VSEX,
IF(patientsex ='M', "MR","MISS") as Title, 
`patient firstname` as VFNAME, 
`patient lastname` as VLNAME,
ifnull(patientdob,"1900-01-01") AS DDOB,

CASE WHEN `patient marital status` = 'Married' THEN 'MR'
WHEN `patient marital status` = 'Widow' THEN 'WD'
WHEN `patient marital status` = 'Single' THEN 'S'
WHEN `patient marital status` = 'Divorced' THEN 'DIV'
WHEN `patient marital status` = 'Separated' THEN 'LS'
WHEN `patient marital status` = 'Partnered' THEN 'PAT'
WHEN `patient marital status` = 'Patnered' THEN 'PAT'
ELSE 'UN' 
END AS VSTATUS,

substring(`patient address1`,1,55) as VADDRESS1,
substring(`patient address2`,1,55) as VADDRESS2,
`patient city` AS VCITY,
substring(`patient state`,1,2) AS VSTATE,
substring(replace(replace(replace(`patient zip`,'-',''),',',''),' ',''),1,9) as VZIPCODE,
substring(replace(replace(replace(`patient homephone`,'-',''),',',''),' ',''),1,10) as VPHONE,
substring(replace(replace(replace(`patient ssn`,'-',''),',',''),' ',''),1,9) as VSSN,
`patient email` AS VEMAIL,
`patient mobile no` AS VCELLNO,
`patient workphone` AS VWPHONE

FROM patients;


SELECT `claim ref prvdr npi no` AS IREFPRVID
FROM patients;

SELECT 
FROM patients;

-- SELECT `ptnt emrgncy cntct rltnshp` as VRRELATION
-- from patients;

SELECT `guarantor frstnm` AS VRFNAME,
`guarantor lastnm` AS VRLNAME, 
substring(`guarantor addr`,1,30) as VRADDRESS1, 
substr(`guarantor addr2`,1,30) as VRADDRESS2,
`guarantor city` as VRCITY,
substring(`guarantor state`,1,2) as VRSTATE,
substring(replace(replace(replace(`guarantor zip`,'-',''),',',''),' ',''),1,9) as VRZIPCODE
-- substring(replace(replace(replace(replace(,'-',''),'(',''),')',''),' ',''),1,10) as VRPHONE
FROM patients;

ALTER TABLE mig_pmptxft MODIFY COLUMN VComments varchar(16);
Insert into mig_pmptxft (VComments)
values("Hamza");

select * from mig_pmptxft;
TRUNCATE TABLE mig_pmptxft;

ALTER TABLE mig_pmptxft MODIFY COLUMN VMI varchar(50);
INSERT INTO mig_pmptxft (VMI)
Select `patient firstname` from 
patients;
