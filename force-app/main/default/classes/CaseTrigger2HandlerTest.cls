@isTest
public class CaseTrigger2HandlerTest {
    @isTest
    public static void testMethodChildCasePositive() {
        List<Case> cases = new List<Case>();
        for (Integer i = 0; i < 250; i++) {
            Case a = new Case();
            a.Subject = 'SI Test';
            a.Priority ='high';
            a.Description='desc conntains password';
            cases.add(a);
        }
       insert cases;

       List<Case> getCases = [SELECT Id, Subject, Priority, Description FROM Case WHERE ParentId in :cases];
        System.assertEquals(250, getCases.size());
        System.assertEquals('Parent case may contain secret info', getCases[0].Subject);
        System.assertEquals('High', getCases[0].Priority);
    }

    @isTest
    public static void testMethodChildCaseNegative() {
        List<Case> cases = new List<Case>();
        for (Integer i = 0; i < 250; i++) {
            Case a = new Case();
            a.Subject = 'SI Test';
            a.Priority ='high';
            a.Description='desc DDOES NOT contain PWORD';
            cases.add(a);
        }
       insert cases;

       List<Case> getCases = [SELECT Id, Subject, Priority, Description FROM Case WHERE ParentId in :cases];
        System.assertEquals(0, getCases.size());
        // System.assertEquals('Parent case may contain secret info', getCases[0].Subject);
        // System.assertEquals('High', getCases[0].Priority);
    }
}