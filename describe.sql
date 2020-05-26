-- Nick DeMarco; CS 205-01; Fall 2019

-- describe.sql Version 1

-- Purpose: This file will describe all tables within the schema

-- Change Summary: Version 1; no changes

-- The results of running this script will be spooled to 
-- 'spoolDescribe.txt'


\o 'spoolDescribe.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho


-- describe Dentist table 
\d Dentist 

-- describe Assistant table 
\d Assistant

-- describe Procedure table 
\d Procedure

-- describe Appointment table 
\d Appointment

-- describe Patient table 
\d Patient

-- describe AssistantHoursWorked view
\d AssistantHoursWorked



\qecho ' '
\qecho ----------------------------
\qecho 'End of script'

-- Turn off spooling
\o