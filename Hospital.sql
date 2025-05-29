CREATE DATABASE Hospital;
GO
USE Hospital;

CREATE TABLE Patients (
PatientID INT PRIMARY KEY,
FullName NVARCHAR(50),
DateOfBirth DATE,
Diagnosis NVARCHAR(50)
);

INSERT INTO Patients VALUES 
(1, 'Ali Hassan', '1985-04-12', 'Hypertension'),
(2, 'Sara Mohamed', '1990-11-20', 'Diabetes'),
(3, 'Khaled Youssef', '1978-09-05', 'Asthma');

select * from Patients;

-- Set Recovery Model to FULL 
ALTER DATABASE Hospital SET RECOVERY FULL;

-- Full Backup - every Sunday
BACKUP DATABASE Hospital
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalBackup_Full_Sun_20240526.bak'
WITH INIT, FORMAT, NAME = 'Weekly Full Backup - Sunday';

-- Differential Backup - every night from Monday to Saturday
BACKUP DATABASE Hospital
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalBackup_Diff_20240528.bak'
WITH DIFFERENTIAL, INIT, NAME = 'Nightly Differential Backup';

-- Transaction Log Backup - every hour
BACKUP LOG Hospital
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalBackup_Log_20240528_1300.trn'
WITH INIT, NAME = 'Hourly Transaction Log Backup';
