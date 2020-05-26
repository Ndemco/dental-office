--Nick DeMarco; CS205-01; Fall2019

--drop.sql

--Delete the physical schema for Dental Office

--Based on: Logical Schema, Version 4

--The results of running this script will be spooled to
--'spoolDrop.txt'

\o 'spoolDrop.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho

\qecho ' ' 
\qecho Dropping AssistantHoursWorked
\qecho ------------------------------ 

DROP VIEW IF EXISTS AssistantHoursWorked CASCADE;

\qecho ' ' 
\qecho Dropping Appointment
\qecho ---------------------------- 

DROP TABLE IF EXISTS Appointment CASCADE;

\qecho ' ' 
\qecho Dropping Patient
\qecho ---------------------------- 

DROP TABLE IF EXISTS Patient CASCADE;

\qecho ' ' 
\qecho Dropping Procedure
\qecho ---------------------------- 

DROP TABLE IF EXISTS Procedure CASCADE;

\qecho ' ' 
\qecho Dropping Assistant 
\qecho ---------------------------- 

DROP TABLE IF EXISTS Assistant CASCADE;

\qecho Dropping Dentist 
\qecho ---------------------------- 

DROP TABLE IF EXISTS Dentist CASCADE;

\qecho ' '
\qecho ----------------------------
\qecho End of script

-- Turn off spooling
\o