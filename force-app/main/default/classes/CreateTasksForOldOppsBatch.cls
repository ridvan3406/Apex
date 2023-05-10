public class CreateTasksForOldOppsBatch implements Database.Batchable<SObject> {
    //Start
    //we get all the data for opps that last activity is more than  7 days
    public Database.QueryLocator start(Database.BatchableContext bc){
      return Database.getQueryLocator([select id , name ,lastModifiedDate , StageName ,CloseDate,OwnerId from opportunity where StageName not in ('Closed Won','Closed Lost') and lastModifiedDate < LAST_N_DAYS:7]);
    }
     //Execute
     //we create tasks for old opportunity that last activity is more than 7 days ago
    public void execute(Database.BatchableContext bc, List<Opportunity> oppList){
        List<Task> insertTasks = new List<Task>();
        for (Opportunity opp : oppList) {
            Task t = new Task();
            t.Subject = 'other';
            t.ActivityDate= (opp.CloseDate <= date.today()) ? date.today() : opp.CloseDate.addDays(-2);
            t.Description='Reminder - TAKE ACTION PLEASE';
            t.WhatId = opp.Id;
            t.OwnerId = opp.OwnerId;
            t.Status = 'In Progress';
            insertTasks.add(t);
        }
        if (!insertTasks.isEmpty()) {
            insert insertTasks;
        }
    }
   
    //Finish
    public void finish(Database.BatchableContext bc){
        System.debug('created tasks for all pending opps');
    }
}