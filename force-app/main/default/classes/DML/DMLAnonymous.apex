//DMLDemo.insert_standartObjevt();
//DMLDemo.insert_customObjevt();

//updateRecord.updateDML();

//insertRelatedRecordDemo.insertRelated();
//insertRelatedRecordDemo.multipleRecordInsert();

//insertRelatedRecordDemo.multipleRecordInsertWithLoop();
//insertRelatedRecordDemo.multipleRecordUpdate();

List<Account> deleteAccounts = [select id from Account where name like'%bulk%'];

delete deleteAccounts;
