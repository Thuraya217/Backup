CREATE DATABASE TrainingDB; 
GO 
USE TrainingDB; 

CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    FullName NVARCHAR(100), 
    EnrollmentDate DATE 
); 

INSERT INTO Students VALUES  
(1, 'Sara Ali', '2023-09-01'), 
(2, 'Mohammed Nasser', '2023-10-15');

-- Step 2: Perform Backup Operations
-- creates a full backup of the entire database TrainingDB
BACKUP DATABASE TrainingDB 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Full.bak';

-- Insert New Record (simulate data change) 
INSERT INTO Students VALUES (3, 'Fatma Said', '2024-01-10'); 
 
-- view Students table
select * from Students

-- creates a Differential Backup 
BACKUP DATABASE TrainingDB 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Diff.bak'
WITH DIFFERENTIAL;

-- creates a Transaction Log Backup
ALTER DATABASE TrainingDB SET RECOVERY FULL; 
BACKUP Log TrainingDB   
BACKUP LOG TrainingDB TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Log.trn';

-- creates a Copy-Only Backup 
BACKUP DATABASE TrainingDB 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB__CopyOnly.bak'
WITH COPY_ONLY;

