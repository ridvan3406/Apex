public class DeleteLostOpportunityBatch implements Database.Batchable<SObject> {
    //Start
    //we get all the data for opps that Lost
    public Database.QueryLocator start(Database.BatchableContext bc){
      return Database.getQueryLocator([select id from opportunity where StageName in ('Closed Lost')]);
    }
     //Execute
     //we delete opps that Lost
    public void execute(Database.BatchableContext bc, List<Opportunity> oppList){
        delete oppList;
    }
   
    //Finish
    public void finish(Database.BatchableContext bc){
        System.debug('Deleted opps closed lost');
    }
}