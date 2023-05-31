//invoke a flow
Account acc = [SELECT id ,name , OwnerId ,CreatedBy.Name FROM Account WHERE id = '0018d00000VSem0AAD' LIMIT 1];
Map<String,Object> inputs = new Map<String,Object>();

inputs.put('AccountId', acc.id);
inputs.put('AccountName', acc.name);
inputs.put('AccountOwnerId', acc.ownerId);
inputs.put('CreatedByName', acc.createdBy.Name);

Flow.Interview flow = new Flow.Interview.Account_Auto_Launched_No_Trigger_Flow(inputs);
flow.start();