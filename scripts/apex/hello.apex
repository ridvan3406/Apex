// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'ridvan';
integer numberr = 0;
System.debug('Hello World!');
System.debug('My name is ' + tempvar + ' ' + numberr);


List<Account> accountsToUpdate = new List<Account>();
   
// Query for accounts with Annual Revenue blank or equal to 0
accountsToUpdate = [SELECT Id, AnnualRevenue FROM Account WHERE (AnnualRevenue = null OR AnnualRevenue = 0)];
   
// Check if there are accounts to update
if (!accountsToUpdate.isEmpty()) {
    for (Account acc : accountsToUpdate) {
        // Set the custom value of 1000
        acc.AnnualRevenue = 1000;
    }
    
    // Update the accounts
    update accountsToUpdate;
    System.debug('Updated ' + accountsToUpdate.size() + ' accounts.');
}

Integer x = 0;
do {
    x = 1;
    x++;
} while (x < 1);
System.debug(x);