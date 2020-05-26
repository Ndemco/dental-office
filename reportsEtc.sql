--Nick DeMarco; CS205-01; Fall2019

--reportsEtc.sql

--Generate a monthly report
--This report would be run at the end of the last day of every month

--Based on: Physical Schema, Version 4

\o 'spoolReportsEtc.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho 


\qecho Generating Monthly Bills
\qecho ----------------------------

SELECT Patient.name AS patient_name, Patient.street, Patient.city, Patient.state, Patient.zip
FROM Patient
WHERE ID = 1;

SELECT Dentist.name AS service_provider, Appointment.procedure, Appointment.DateOfService, Procedure.cost
FROM Appointment INNER JOIN Procedure ON Procedure.name = Appointment.procedure
     AND Appointment.DateOfService BETWEEN CURRENT_DATE - interval '1 month' AND CURRENT_DATE
     AND Appointment.patientID = 1
     INNER JOIN Dentist ON Dentist.id = Appointment.dentistid
     INNER JOIN Patient ON Patient.id = Appointment.patientid;
     
SELECT SUM(Procedure.cost) AS Total_Cost
FROM Procedure INNER JOIN Appointment ON Procedure.name = Appointment.procedure
     AND Appointment.DateOfService BETWEEN CURRENT_DATE - interval '1 month' AND CURRENT_DATE
     AND Appointment.patientID = 1;
     
SELECT Patient.name AS patient_name, Patient.street, Patient.city, Patient.state, Patient.zip
FROM Patient
WHERE ID = 2;

SELECT Dentist.name AS service_provider, Appointment.procedure, Appointment.DateOfService, Procedure.cost
FROM Appointment INNER JOIN Procedure ON Procedure.name = Appointment.procedure
     AND Appointment.DateOfService BETWEEN CURRENT_DATE - interval '1 month' AND CURRENT_DATE
     AND Appointment.patientID = 2
     INNER JOIN Dentist ON Dentist.id = Appointment.dentistid
     INNER JOIN Patient ON Patient.id = Appointment.patientid;
     
SELECT SUM(Procedure.cost) AS Total_Cost
FROM Procedure INNER JOIN Appointment ON Procedure.name = Appointment.procedure
     AND Appointment.DateOfService BETWEEN CURRENT_DATE - interval '1 month' AND CURRENT_DATE
     AND Appointment.patientID = 2;
     
\qecho ' '
\qecho ----------------------------
\qecho End of script

-- Turn off spooling
\o