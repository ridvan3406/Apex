public class SalesforceProjectTriggerHandler {
   
    public static void createDefultSalesforceTicket(List<salesforce_project__c> spTriggerNew,
                                                    List<salesforce_project__c> spTriggerOld,
                                                    Map<id,salesforce_project__c> spTriggerNewMap,
                                                    Map<id,salesforce_project__c> spTriggerOldMap) {
        try {
            List <Salesforce_Ticket__c> newTicketList = new List<Salesforce_Ticket__c>();
            // Fetch subjevt and decriptions values from Custom settings
            DefaultTicketinfo__c ticketInfo = DefaultTicketinfo__c.getOrgDefaults();
            for (salesforce_project__c eachProject : spTriggerNew) {
                Salesforce_Ticket__c newTicket = new Salesforce_Ticket__c();
                //newTicket.Subject__c= 'Default Ticket';
                newTicket.Subject__c= ticketInfo.Subject__c;
                newTicket.Description__c= ticketInfo.Description__c;
                newTicket.Salesforce_Project__c= eachProject.id;
                newTicketList.add(newTicket);
                newTicket.Priority__c= 'Low';
            }
            if (!newTicketList.isEmpty()) {
                //insert newTicketList;
                List<Database.SaveResult> results = Database.insert(newTicketList,false);
                System.debug('result  ===>' + results);

                for(Database.SaveResult eachResult : results){
                    if (eachResult.isSuccess()) {
                        System.debug('Accounts Inserted Successfully. Account Id: ' + eachResult.getId());
                    }else{
                        System.debug('Errors : ' + eachResult.getErrors());
                    }
                }
            }
        } catch (Exception ex) {
            for (salesforce_project__c eachProject : spTriggerNew) {
                eachProject.addError('Salesforce Ticket Creation Failed.Please contact your salesforce administrator.');
            }
        }
        
    }

//You first loop through all the new projects in the trigger to find the ones that have a status change to 'Completed'. You add these project IDs to a set called setCompletedProjectIds.

// Next, you query for all tickets related to projects in setCompletedProjectIds that are not already completed or cancelled. You store this in a List called ticketList.

// Finally, you loop through each ticket in ticketList and check if the associated project ID is in setCompletedProjectIds. If it is, you retrieve the project from the spTriggerNewMap and add an error message to prevent the project from being completed if all its tickets are not completed.


    public static void validateProjectCompletion(List<Salesforce_Project__c> spTriggerNew,List<Salesforce_Project__c> spTriggerOld,Map<Id,salesforce_project__c> spTriggerNewMap,Map<Id,salesforce_project__c> spTriggerOldMap){
        // find all the project completed 
        set <id> setCompletedProjectIds = new set<id>();
        for (salesforce_project__c eachProject : spTriggerNew){
            if (eachProject.status__c != spTriggerOldMap.get(eachProject.id).status__c
            && eachProject.status__c == 'Completed') {
                setCompletedProjectIds.add(eachProject.id);
            }
        }
        // get all the tickets of projects which are in setCompletedProjectIds
        // and whose status is not completed
        List<Salesforce_Ticket__c> ticketList =[SELECT id,status__c,Salesforce_Project__c FROM Salesforce_Ticket__c WHERE Salesforce_Project__c IN :setCompletedProjectIds and (status__c != 'Completed' and status__c != 'Cancelled')];

        // loop all the tickets
        // and is project is in set of completed projects

        for (salesforce_ticket__c eachTicket: ticketList) {
            if (setCompletedProjectIds.contains(eachTicket.salesforce_project__c)) {
                //get the project using trigger map
                salesforce_project__c sp =spTriggerNewMap.get(eachTicket.salesforce_project__c);
                sp.addError('Cannot complete project because all its ticket are not completed');
            }
        }
    }
    @future
    public static void updateProjectDescription(Set<Id> setSPIds) {
        List<salesforce_project__c> listSP =[SELECT id,name,description__c FROM Salesforce_Project__c where id in :setSPIds];
        for (salesforce_project__c eachSP: listSP) {
            eachSP.description__c= eachSP.description__c + 'This line is from future method' ;
        }
        update listSP;
    }
    public static void spCompletedStatus(List<Salesforce_Project__c> spTriggerNew,
                                        List<Salesforce_Project__c> spTriggerOld,
                                        Map<Id,salesforce_project__c> spTriggerNewMap,
                                        Map<Id,salesforce_project__c> spTriggerOldMap) {
    
            Set<Id> spIds = new set<id>();
            for (Salesforce_Project__c spRecords : spTriggerNew ) {
                Salesforce_Project__c spOld = spTriggerOldMap.get(spRecords.Id);
                if (spRecords.status__c == 'Completed' && spOld.status__c != 'Completed') {
                    spIds.add(spRecords.Id);
                }
            if (!spIds.isEmpty()) {
                //here we call the future method
                updateTicketStatusCompleted(spIds);
            }
            }
    }

    @future
    public static void updateTicketStatusCompleted(Set<Id> spIds) {
        List<Salesforce_Ticket__c> listST = [SELECT id,status__c,salesforce_project__c
                                            FROM Salesforce_Ticket__c
                                            WHERE salesforce_project__c in :spIds
                                            AND status__c != 'Completed' ];
        for (salesforce_ticket__c eachTicketRecord : listST) {
            eachTicketRecord.status__c = 'Completed';
        }
        update listST;
    }
   
}