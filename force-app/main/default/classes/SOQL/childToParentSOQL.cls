public class childToParentSOQL {
   
    public static void childToParentSOQL_1(){
        List<Contact> listContact = [SELECT id,name,Account.Name,Account.Phone 
        FROM Contact
        WHERE Account.Industry='Energy'];

        for (Contact eachContact : listContact) {
            string accName = eachContact.Account.Name;
            string accPhone = eachContact.Account.Phone;
            System.debug('contact name is = ' + eachContact.Name + ', and its acc is ' + accName+' account phone is = ' + accPhone);
        }
    }

    public static void sampleSOQL(){
        List<Account> accountWithOpss=  [SELECT name,annualRevenue , 
        (SELECT amount,name FROM Opportunities WHERE stageName = 'Closed Won')
        from Account where Type ='Customer - Direct'
        ];
        for (Account eachAccount : accountWithOpss) {
            System.debug('account name is = ' + eachAccount.name + ',and its revenue is ' + eachAccount.AnnualRevenue);
            //we want all opportunities in each account 
            List<Opportunity> listOpportunities = eachAccount.Opportunities;
            for (Opportunity eachOpportunity : listOpportunities) {
                system.debug('opportunity name is = ' + eachOpportunity.Name + ',and its amount is ' + eachOpportunity.Amount);
                
            }
        }
    }
}