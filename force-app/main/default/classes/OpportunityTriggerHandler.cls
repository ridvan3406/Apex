public class OpportunityTriggerHandler {
  public static void createProductsOnOppCreation(List<Opportunity> oppTriggerNew, Map<Id,Opportunity> oppTriggerNewMap) {
    Set<Id> oppIDs = oppTriggerNewMap.keySet();

    List<OpportunityLineItem> opportunityLineItems = new List<OpportunityLineItem>();
    List<Product2> p2 = [
      SELECT id, ProductCode
      FROM Product2
      WHERE ProductCode IN ('SFDC', 'CH')
      LIMIT 2
    ];
    // PricebookEntry pbEntry = [
    //     SELECT Id
    //     FROM PricebookEntry
    //     WHERE Pricebook2.Name = 'Standard'
    //     AND Product2.ProductCode = 'SFDC'
    //     LIMIT 1
    // ];

    System.debug('product2 ==> ' + p2);
    // Iterate through the newly created opportunities
    for (Opportunity opp : oppTriggerNew) {
      // Create a default opportunity product record
      for (Product2 eachProduct : p2) {
        OpportunityLineItem oli = new OpportunityLineItem();
        oli.OpportunityId = opp.Id;
        oli.Product2Id = eachProduct.id; // Replace with your default product ID
        //oli.PricebookEntryId = pbEntry.id; // Replace with your default price book entry ID
        oli.Quantity = 1;
        oli.UnitPrice = eachProduct.ProductCode == 'SFDC' ? 999 : 3.99;

        opportunityLineItems.add(oli);
        System.debug('oli ==> ' + oli);
      }
    }
    if (!opportunityLineItems.isEmpty()) {
      insert opportunityLineItems;
      System.debug('opportunityLineItems ==> ' + opportunityLineItems);
    }
  }
  @future
  public static void updateHighestOppName(Set<id> accountIds) {
    //soql query to fetch Accounts with opportunities
    //below soql query will fetch the Account where opportunity that has highest amount.
    List<Account> listAcc = [
      SELECT
        id,
        name,
        Highest_Amount_Opportunity_Name__c,
        (
          SELECT id, amount, name
          FROM Opportunities
          ORDER BY amount DESC
          LIMIT 1
        )
      FROM account
      WHERE id IN :accountIds
    ];
    //in this for loop we updtae highest_amount_opportunity field with the highest opportunity name
    List<Account> updateAcc = new List<Account>();
    for (Account acc : listAcc) {
      if (!acc.Opportunities.isEmpty()) {
        List<Opportunity> listOpp = acc.Opportunities;
        Opportunity opp = listOpp[0];
        acc.Highest_Amount_Opportunity_Name__c = opp.Name;
        updateAcc.add(acc);
      }
    }
    update updateAcc;
  }
  @future
  public static void updateHighestTargetOppName(Set<id> accountIds) {
    //soql query to fetch Accounts with opportunities
    //below soql query will fetch the Account where opportunity that has highest amount.
    List<Account> listAcc = [
      SELECT
        id,
        name,
        Highest_Amount_Opportunity_Name__c,
        Target_Amount__c,
        Target_Amount_Achieved_Opportunity_Name__c,
        (
          SELECT id, amount, name
          FROM Opportunities
          WHERE StageName = 'Closed Won'
          ORDER BY amount DESC
        )
      FROM account
      WHERE id IN :accountIds
    ];
    //in this for loop check opp.amount>account.target_amount
    //then update acc field with opp name
    List<Account> updateAcc = new List<Account>();
    for (Account acc : listAcc) {
      if (!acc.Opportunities.isEmpty()) {
        List<Opportunity> listOpp = acc.Opportunities;
        Boolean updateAccount = false;
        for (Opportunity opp : listOpp) {
          if (opp.Amount > acc.Target_Amount__c) {
            acc.Target_Amount_Achieved_Opportunity_Name__c = opp.Name;
            //updateAcc.add(acc);
            updateAccount = true;
            break;
          }
        }

        Decimal allClosedWonOppAmount = 0;

        for (Opportunity opp : listOpp) {
          allClosedWonOppAmount += opp.Amount;
        }
        acc.Total_Amount_Generated__c = allClosedWonOppAmount;
        updateAccount = true;
        if (updateAccount) {
          updateAcc.add(acc);
        }
      }
    }
    if (!updateAcc.isEmpty()) {
      update updateAcc;
    }
  }
  @future
  public static void updateTotalAmountGenerated(Set<id> accountIds) {
    List<Account> listAcc = [
      SELECT
        id,
        name,
        Highest_Amount_Opportunity_Name__c,
        Target_Amount__c,
        Target_Amount_Achieved_Opportunity_Name__c,
        (
          SELECT id, amount, name
          FROM Opportunities
          WHERE StageName = 'Closed Won'
          ORDER BY amount DESC
        )
      FROM account
      WHERE id IN :accountIds
    ];

    List<Account> updateAcc = new List<Account>();
    for (Account acc : listAcc) {
      Decimal allClosedWonOppAmount = 0;
      if (!acc.Opportunities.isEmpty()) {
        List<Opportunity> listOpp = acc.Opportunities;
        for (Opportunity opp : listOpp) {
          allClosedWonOppAmount += opp.Amount;
        }
        acc.Total_Amount_Generated__c = allClosedWonOppAmount == 0
          ? null
          : allClosedWonOppAmount;
        updateAcc.add(acc);
      }
    }
    update updateAcc;
  }
}