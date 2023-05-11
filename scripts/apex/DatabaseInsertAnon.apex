List<account> listAcc = new List<account>();
        Account a = new Account();
        a.name = 'SI Test';
        a.Industry ='Energy';
        a.Type = 'Customer - Direct';
        listAcc.add(a);

        Account a1 = new Account();
        a1.name = 'UI Test';
        a1.Industry ='Energy';
        a1.Type = 'Customer - Direct';
        listAcc.add(a1);

        Account a2 = new Account();
        listAcc.add(a2);

        Account a3 = new Account();
        listAcc.add(a3);
//this line will give us the list of all records that succesfully inserted or failed
List<Database.SaveResult> results = Database.insert(listAcc,false);
System.debug('result  ===>' + results);

for(Database.SaveResult eachResult : results){
    if (eachResult.isSuccess()) {
        System.debug('Accounts Inserted Successfully. Account Id: ' + eachResult.getId());
    }else{
        System.debug('Errors : ' + eachResult.getErrors());
    }
}

