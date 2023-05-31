public class ParentToChildSOQL {
   public static void ParentToChildSOQL_1() {

    List<Account> accountWithOpps =[SELECT name,AnnualRevenue,
    (
        SELECT amount,name FROM Opportunities WHERE stageName='Closed Won'
    ),(
        Select id,subject ,status From Cases where status = 'Closed'
    )
    FROM Account WHERE type='Customer - Direct' and AnnualRevenue > 150000 ];

    for (Account acc : accountWithOpps) {
        System.debug('==========================');
        System.debug('account name : ' + acc.name + ' and its annual revenue : '+ acc.AnnualRevenue);
        for (Opportunity opp : acc.Opportunities) {
            System.debug('opp name : ' + opp.name + ' and its amount is' + opp.Amount );
        }
        for (Case cases : acc.Cases) {
            System.debug('case subjevt: ' + cases.subject);
        }
    }

}
}