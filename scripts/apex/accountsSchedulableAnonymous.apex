AccountsSchedulable accSchedule = new AccountsSchedulable();

string cron = '0 0 13 * * ?';
id jobId = System.schedule('Acc Batch Everyday', cron, accSchedule);