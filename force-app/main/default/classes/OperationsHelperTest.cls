@isTest
public with sharing class OperationsHelperTest {
    @isTest
    public static void testLargestOutofTwoNumbers() {
        OperationsHelper oppHelper = new OperationsHelper();
        decimal test1 =oppHelper.largestOutOfTwoNumbers(23, 23.23);
        System.assertEquals(23.23, test1);

        decimal test2 =oppHelper.largestOutOfTwoNumbers(23,23);
        System.assertEquals(23, test2);
    }
    @isTest
    public static void smallestOutOfThreeNumbers() {
        OperationsHelper oppHelper = new OperationsHelper();
        decimal test1 = oppHelper.smallestOutOfThreeNumbers(3.33,3.3,3.03);
        System.assertEquals(3.03, test1);
    }
    @isTest
    public static void testSumOfPositiveInteger() {
        OperationsHelper oppHelper = new OperationsHelper();
        decimal test1 = oppHelper.sumOfPositiveInteger(33);
        System.assertEquals(561, test1);

        integer test2 = oppHelper.sumOfPositiveInteger(-33);
        System.assertEquals(null,test2);
    }
}