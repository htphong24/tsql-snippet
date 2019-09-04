USE master;
GO

-- Step 1
-- Retrive the Logical file name of the database from backup
RESTORE FILELISTONLY FROM DISK = 'D:\Databases\Backups\MyDatabase.bak'
GO

-- Step 2
-- Then use values in LogicalName Column to move database to new location
ALTER DATABASE MyDatabase SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

-- Step 3
-- Restore database
RESTORE DATABASE MyDatabase
    FROM DISK = 'D:\Databases\Backups\MyDatabase.bak'
      WITH MOVE 'MyDatabase' TO 'D:\Databases\Data\MyDatabase.mdf',
           MOVE 'MyDatabase_Log' TO 'D:\Databases\Data\MyDatabase_log.ldf';
GO
