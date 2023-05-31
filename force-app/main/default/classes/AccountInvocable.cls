public with sharing class AccountInvocable {
  @InvocableMethod(
    label='Close Related Opportunities'
    description='Closes all the related opportunities of the given accounts'
    category='Account'
  )
  public static void closeOpportunities(List<Id> accountIds) {
    //get all the related opportunities
    List<Opportunity> opps = [
      SELECT id, stageName
      FROM Opportunity
      WHERE AccountId IN :accountIds
      AND stageName not IN ('Closed Won', 'Closed Lost')
    ];
    //iterate over the record and populate stage name
    for (Opportunity eachOpp : opps) {
        eachOpp.stageName = 'Closed Lost';
    }
    //hit update
    try {
        update opps;
    }
    catch (Exception ex) {
        System.debug(ex.getMessage());
    }
  }
}
