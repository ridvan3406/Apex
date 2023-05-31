@isTest
public class CalculatorTest {
    @isTest
   private static void testMethod1() {
       //we test our actual method
       string returnMsg = Calculator.printAndReturnMessage('somthing else');
       //'this is from test...OK Cool'
       system.assertEquals('somthing else...OK Cool', returnMsg);
   }
   @isTest
   private static void testMethodAdd1() {
    integer sum1 = Calculator.add(15, 150);
    //to verify we do asserts
    System.assertEquals(165, sum1);
   }
   @isTest 
   public static void addTwonumber() {
    integer num1  = 1;
    integer num2 = 2;
    integer expected = 3;
    integer actual= Calculator.add(num1, num2);
    System.assertEquals(expected, actual,'Unexpected result from add');
}
   @isTest
   private static void testMethodAdd2() {
    integer sum1 = Calculator.add(15, 150,1);
    //to verify we do asserts
    System.assertEquals(166, sum1);
   }
}

// @isTest
// private class CalculatorTest {

//     @isTest
//     static void testPrintAndReturnMessage() {
//         String message = 'Hello';
//         String expected = message + '...OK Cool';
//         String actual = Calculator.printAndReturnMessage(message);
//         System.assertEquals(expected, actual, 'Unexpected message returned');
//     }
    
//     @isTest
//     static void testAddTwoNumbers() {
//         Integer num1 = 10;
//         Integer num2 = 20;
//         Integer expected = 30;
//         Integer actual = Calculator.add(num1, num2);
//         System.assertEquals(expected, actual, 'Unexpected result for adding two numbers');
//     }

//     @isTest
//     static void testAddThreeNumbers() {
//         Integer num1 = 10;
//         Integer num2 = 20;
//         Integer num3 = 30;
//         Integer expected = 60;
//         Integer actual = Calculator.add(num1, num2, num3);
//         System.assertEquals(expected, actual, 'Unexpected result for adding three numbers');
//     }
// }