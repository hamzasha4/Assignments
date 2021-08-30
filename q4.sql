TRUNCATE TABLE mig_pmptxft;

Alter table [dbo].[Mig_PMPTXFT] alter column [DDOB] float;
INSERT INTO mig_pmptxft (RowID, VTITLE, VFNAME, VLNAME, DDOB,VSEX,VSTATUS,VADDRESS1,VADDRESS2,VCITY,VSTATE,VZIPCODE,VPHONE,VSSN,VEMAIL,VCELLNO,VWPHONE,IREFPRVID,VRFNAME,VRLNAME,VRADDRESS1,VRADDRESS2,VRCITY,VRSTATE,VRZIPCODE,VECFNAME,VECPHONE,VECRRelation,dRegDate)
SELECT ROW_NUMBER() Over (Order by [patient lastname]),


CASE WHEN patientsex = 'M' THEN 'MR'
WHEN patientsex = 'F' THEN 'MISS'
ELSE 'OTHER'
END AS VTITILE,
 
[patient firstname] as VFNAME, 
[patient lastname] as VLNAME,

iSnull(patientdob,19000101) AS DDOB,

CASE WHEN patientsex = 'M' THEN 'MALE'
WHEN patientsex = 'F' THEN 'FEMALE'
ELSE 'OTHER' 
END AS VSEX,

CASE WHEN [patient marital status] = 'Married' THEN 'MR'
WHEN [patient marital status] = 'Widow' THEN 'WD'
WHEN [patient marital status] = 'Single' THEN 'S'
WHEN [patient marital status] = 'Divorced' THEN 'DIV'
WHEN [patient marital status] = 'Separated' THEN 'LS'
WHEN [patient marital status] = 'Partnered' THEN 'PAT'
WHEN [patient marital status] = 'Patnered' THEN 'PAT'
ELSE 'UN' 
END AS VSTATUS,

substring([patient address1],1,55) as VADDRESS1,
substring([patient address2],1,55) as VADDRESS2,
[patient city] AS VCITY,
substring([patient state],1,2) AS VSTATE,
substring(replace(replace(replace([patient zip],'-',''),',',''),' ',''),1,9) as VZIPCODE,
substring(replace(replace(replace([patient homephone],'-',''),',',''),' ',''),1,10) as VPHONE,
substring(replace(replace(replace([patient ssn],'-',''),',',''),' ',''),1,9) as VSSN,
[patient email] AS VEMAIL,
[patient mobile no] AS VCELLNO,
[patient workphone] AS VWPHONE,
[claim ref prvdr npi no] AS IREFPRVID,
[guarantor frstnm] AS VRFNAME,
[guarantor lastnm] AS VRLNAME, 
substring([guarantor addr],1,30) as VRADDRESS1, 
substring([guarantor addr2],1,30) as VRADDRESS2,
[guarantor city] as VRCITY,
substring([guarantor state],1,2) as VRSTATE,
substring(replace(replace(replace([guarantor zip],'-',''),',',''),' ',''),1,9) as VRZIPCODE,
[ptnt emrgncy cntct name] AS VECFNAME,
[ptnt emrgncy cntct ph] as VECPHONE,
[ptnt emrgncy cntct rltnshp] as VECRRelation,
getdate()

FROM patients;

SELECT * from [dbo].[Mig_PMPTXFT]

