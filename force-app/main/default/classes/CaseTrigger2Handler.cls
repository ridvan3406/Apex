public class CaseTrigger2Handler {
   public static void createChildCase(List<Case> caseTriggerNew, Map<Id,Case> caseTriggerNewMap) {
        // 10 case are inserted

        //set of id to store case id of records that description field has 'password' in it.

        Set<Id> setCaseId = new Set<Id>();
        // for each loop
            // check if description field contains 'password' , then add to set of id
        for (Case eachCase : caseTriggerNew){
                // check if Vip field is updated
            if (eachCase.Description != null && eachCase.Description.containsIgnoreCase('password')) {
                    setCaseId.add(eachCase.id);
            }
                
        }
        //List<Case>
        List <Case> createCase = new List<Case>();
        // for each loop on set of case ids
        for (Id eachId : setCaseId) {
            //new instance of case
            Case c = new Case();
            c.Subject= 'Parent case may contain secret info';
            c.ParentId=eachId;
            c.Priority='High';
            c.Description='Secret information is not allowed in case';
            // add to list
            createCase.add(c);
        }
        //insert list
        if (!createCase.isEmpty()) {
            insert createCase;
        }
   }
}