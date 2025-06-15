-- Point-in-Time Restore Script
RESTORE DATABASE MiniERP
FROM DISK = 'D:\Backups\MiniERP_FULL.bak'
WITH NORECOVERY;

-- Then apply logs
RESTORE LOG MiniERP
FROM DISK = 'D:\Backups\MiniERP_LOG.trn'
WITH STOPAT = '2020-03-15T10:15:00', RECOVERY;