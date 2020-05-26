-- Nick DeMarco; CS 205-01; Fall 2019

-- allData.sql Version 1

-- Purpose: This file will read all tables or the table's view form if 
-- applicable

-- Change Summary: Version 1; no changes

-- The results of running this script will be spooled to 
-- 'spoolAllData.txt'


\o 'spoolAllData.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho



--read Dentist table 
\qecho Dentist table 
\qecho ---------------------------- 
\qecho ' '   

SELECT ID, Name 
FROM Dentist 
ORDER BY ID; 
  

\qecho ' ' 
--read Assistant table 
\qecho Assistant table 
\qecho ---------------------------- 
\qecho ' ' 
  
SELECT ID, Name 
FROM Assistant 
ORDER BY ID; 

 
--read Procedure table 
\qecho Procedure table 
\qecho ---------------------------- 
\qecho ' ' 

SELECT Name, Cost 
FROM Procedure
ORDER BY Name;

--read Patient table 
\qecho Patient table 
\qecho ---------------------------- 
\qecho ' ' 
  
SELECT ID, Name, Street, City, State, Zip, DateOfBirth, DentalInsurance 
FROM Patient 
ORDER BY ID; 
  

\qecho ' ' 
--read Appointment table 
\qecho Appointment table 
\qecho ---------------------------- 
\qecho ' ' 
  
SELECT ID, PatientID, DentistID, Procedure, AssistantID, DateOfService, TimeIn, TimeOut 
FROM Appointment
ORDER BY PatientID; 

\qecho ' ' 
--read AssistantHoursWorked view
\qecho AssistantHoursWorked view 
\qecho ---------------------------- 
\qecho ' ' 

SELECT AssistantID, Name, hours_worked
FROM AssistantHoursWorked;

\qecho ' '
\qecho ----------------------------
\qecho End of script

--Turn off spooling
\o