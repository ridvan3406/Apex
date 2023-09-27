public with sharing class OpportunityController {
    @AuraEnabled(cacheable=true)
  public static List<Opportunity> getTopOpportunities() {
    return [
      SELECT Name, Type, StageName, Amount
      FROM Opportunity
      WHERE Amount != NULL
      WITH SECURITY_ENFORCED
      ORDER BY Amount DESC
      LIMIT 10
    ];
  }
}
