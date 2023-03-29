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
}