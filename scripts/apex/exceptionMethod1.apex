
try {
    Account acc =new Account();
    insert acc;
} catch (DMLException DMLex) {
    System.debug('something DML wrong mate');
}
catch (Exception ex) {
    System.debug('something went wrong mate');
}

System.debug('Apex is cool');