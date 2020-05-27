--Nick DeMarco; CS205-01; Fall2019

--userEdits.sql

--Test user edits on database

--Based on: Logical Schema, Version 4

-- Uncomment the line under this and the last line '\o' to spool results.
-- \o 'spoolUserEdits.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho 


\qecho Generating User Edits
\qecho ----------------------------

\qecho Inserting into Dentist table
\qecho -----------------------------

INSERT INTO Dentist
VALUES(1, 'Scott Fawcett'),
      (2, 'Brenda Aurelia'),
      (3, 'Joe Fiorita'),
      (4, 'Bob Kornhaas');
 
\qecho Inserting into Assistant table
\qecho -------------------------------

INSERT INTO Assistant
VALUES(1, 'Jada Brown'),
      (2, 'Zed Varrone'),
      (3, 'Andrea Gillespie');
      
\qecho Inserting into Procedure table
\qecho -------------------------------

INSERT INTO Procedure
VALUES('Tooth Removal', 1000),
      ('Crown Installation', 250),
      ('Cleaning', 80),
      ('Whitening', 55);
      

\qecho Inserting into Patient table
\qecho -------------------------------

INSERT INTO Patient
VALUES(1, 'Jeanne Marquis', '10 South Street', 'Southbury', 'CT', '12345', '1965-03-14', NULL),
      (2, 'Patricia Renda', '5 Main Street', 'Danbury', 'CT', '12343', '1946-02-17', NULL),
      (3, 'Kyle Lucke', '12 North Street', 'Newtown', 'CT', '09876', '1950-06-25', 'Best Health Insurance');
      

\qecho Inserting new appts into Appointment table
\qecho -------------------------------------------

INSERT INTO Appointment
VALUES(1, 1, 1, 'Cleaning', 1, '2019-12-3', '12:30', '13:00'),
      (2, 1, 2, 'Tooth Removal', 2, '2019-12-03', '13:00', '13:30'),
      (3, 1, 1, 'Whitening', NULL, '2018-01-10', '15:30', '16:00');
      
\qecho Removing from Bob Kornhaas from Dentist
\qecho ---------------------------------------

DELETE FROM Dentist
WHERE ID = 4;

\qecho Adding Jeff Mellon to Dentist
\qecho -------------------------------------------

INSERT INTO Dentist
VALUES(4, 'Jeff Mellon');

\qecho Removing Kyle Lucke from Patient
\qecho ------------------------------------

DELETE FROM Patient
WHERE ID = 3;

\qecho Update appt 3 to have assistant Jada Brown
\qecho -------------------------------------------

UPDATE Appointment
SET AssistantID = 1
WHERE ID = 3;

\qecho Removing Andrea Gillespie from Assistant
\qecho -----------------------------------------

DELETE FROM Assistant
WHERE ID = 3;

\qecho Inserting new appts into Appointment table
\qecho -------------------------------------------

INSERT INTO Appointment
VALUES(4, 2, 2, 'Cleaning', NULL, '2019-12-01', '10:00', '10:30'),
      (5, 2, 1, 'Tooth Removal', 1, '2019-12-02', '09:00', '10:00');

\qecho Updating time of appointment 5
\qecho -------------------------------------------

UPDATE Appointment
SET TimeIn = '09:30', TimeOut = '10:30'
WHERE ID = 5;

\qecho ' '
\qecho ----------------------------
\qecho End of script

-- Turn off spooling
-- \o