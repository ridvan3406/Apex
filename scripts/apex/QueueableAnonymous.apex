List<Account> accs = [SELECT id, name FROM Account];
AccountsQueueableExample aqe = new AccountsQueueableExample (accs);

Id jobId = system.enqueueJob(aqe);
System.debug('job id is  = ' + jobId );