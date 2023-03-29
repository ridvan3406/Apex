public class SoqlDemo {
   public static void accountSOQL_1() {
    //SOQL query returns LIST<sObject>
    List<Account> listAccounts =[SELECT id, name FROM Account WHERE name LIKE '%A%'];
    System.debug('list of acc ' + listAccounts);
    System.debug('size of accounts ' + listAccounts.size());

    // if we fetch ONLY 1 record , we can store it in "Account " instead of "List<Account>"
    Account myAccount = [SELECT id, name FROM Account ORDER BY CreatedDate DESC LIMIT 1];
    System.debug('last created account record = ' + myAccount);

   }

   public static void accountSOQL_2() {
    Account lastAccount = [SELECT name,phone,AccountNumber FROM Account ORDER BY CreatedDate DESC LIMIT 1];
    System.debug('last created account record = ' + lastAccount);

    String accName = lastAccount.Name;
    String accPhone = lastAccount.Phone;
    String accNumber = lastAccount.AccountNumber;
    System.debug('account name is =' + accName);
    System.debug('account phone is =' + accPhone);
    System.debug('account number is =' + accNumber);
   }

   public static void accountSOQL_3() {
    List<Account> listAccounts =[SELECT name,phone,AccountNumber,ShippingCity FROM Account ORDER BY CreatedDate DESC ];

    for (Account eachaccount : listAccounts){
        String accName = eachaccount.Name;
        String accPhone = eachaccount.Phone;
        String accNumber = eachaccount.AccountNumber;

        string accShippingCity = eachaccount.ShippingCity;

        System.debug('accounts name=' + accName + ' phone=' + accPhone + ' accNumber=' + accNumber);
        System.debug(accShippingCity);

    }
   }
   public static void soqlDemo_Filter() {
        String accNameFilter = 'green bottle';
        List<Account> listAcc =[SELECT id,name,phone FROM Account WHERE name = :accNameFilter];

        System.debug(listAcc);
   }

   public static void soqlDemo_Filter(string accNameFilter) {
    List<Account> listAcc =[SELECT id,name,phone FROM Account WHERE name = :accNameFilter];

    System.debug(listAcc);
   }
}