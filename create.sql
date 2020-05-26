--Nick DeMarco; CS205-01; Fall2019

--create.sql

--Create the physicial schema for Dental Office

--Based on: Logical Schema, Version 4

--Change summary: Added "Appointment" table that represents ternary
--relationship between Dentist, Patient, Assistant and Appointment.
--Changed 'name' field in Procedure to be Primary Key and got rid of
--procedureID.

\o 'spoolCreate.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho 


\qecho Creating Dentist table
\qecho ----------------------------

CREATE TABLE IF NOT EXISTS Dentist
(
ID	INTEGER NOT NULL PRIMARY KEY,
Name	VARCHAR(30) NOT NULL CHECK (Name <> '')
);

\qecho ' '
\qecho ' '
\qecho Creating Assistant table
\qecho ----------------------------

CREATE TABLE IF NOT EXISTS Assistant
(
ID	INTEGER NOT NULL PRIMARY KEY,
Name VARCHAR(30) NOT NULL CHECK (Name <> '')
);

\qecho ' '
\qecho ' '
\qecho Creating Procedure table
\qecho ----------------------------

CREATE TABLE IF NOT EXISTS Procedure
(
Name	VARCHAR(30) NOT NULL PRIMARY KEY CHECK (NAME <> ''),
Cost	INTEGER NOT NULL
);

\qecho ' '
\qecho ' '
\qecho Creating Patient table
\qecho ----------------------------

CREATE TABLE IF NOT EXISTS Patient
(
ID	INTEGER NOT NULL PRIMARY KEY,
Name	VARCHAR(30) NOT NULL CHECK (Name <> ''),
Street	VARCHAR(40) NOT NULL CHECK (Street <> ''),
City	VARCHAR(30) NOT NULL CHECK (City <> ''),
State	CHAR(2) NOT NULL CHECK (State <> ''),
Zip	CHAR(5) NOT NULL CHECK (Zip <> ''),
DateOfBirth	DATE NOT NULL,
DentalInsurance	VARCHAR(50)
);

\qecho ' '
\qecho ' '
\qecho Creating Appointment table
\qecho ----------------------------

CREATE TABLE IF NOT EXISTS Appointment
(
ID		INTEGER NOT NULL,
PatientID	INTEGER NOT NULL REFERENCES Patient,
DentistID	INTEGER NOT NULL REFERENCES Dentist,
Procedure       VARCHAR(30) NOT NULL REFERENCES Procedure,
AssistantID	INTEGER REFERENCES Assistant,
DateOfService	DATE NOT NULL,
TimeIn		TIME NOT NULL,
TimeOut		TIME NOT NULL,
PRIMARY KEY(ID)
);

\qecho ' '
\qecho ' '
\qecho Creating AssistantHoursWorked view
\qecho -----------------------------------
--To be run at the end of the day, at the end of each pay period (weekly).

CREATE VIEW AssistantHoursWorked AS
SELECT Appointment.AssistantID, Assistant.name,
SUM(Appointment.TimeOut - Appointment.TimeIn) AS hours_worked
FROM Assistant INNER JOIN Appointment ON Assistant.ID = Appointment.AssistantID
AND DateOfService >= CURRENT_DATE - interval '7 days'
GROUP BY AssistantID, name;

\qecho ' '
\qecho ----------------------------
\qecho End of script

-- Turn off spooling
\o
