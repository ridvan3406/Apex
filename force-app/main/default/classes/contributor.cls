public class ManageDonation {
    
    public List<Contact> fetchTopContributors() {
        List<Contact> topContributors = new List<Contact>();
        
        // Query the Contacts with the highest Donation Amounts
        List<AggregateResult> results = [SELECT ContactId, SUM(Amount) totalAmount 
                                         FROM Donation__c 
                                         GROUP BY ContactId 
                                         ORDER BY totalAmount DESC 
                                         LIMIT ];
        
        // Extract the Contact Ids from the AggregateResults
        Set<Id> contactIds = new Set<Id>();
        for (AggregateResult result : results) {
            Id contactId = (Id)result.get('ContactId');
            contactIds.add(contactId);
        }
        
        // Query the Contacts with the matching Ids
        topContributors = [SELECT Id, Name, Email, Phone 
                           FROM Contact 
                           WHERE Id IN :contactIds];
        
        return topContributors;
    }
}