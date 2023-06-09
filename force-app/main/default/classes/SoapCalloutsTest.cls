@isTest
public with sharing class SoapCalloutsTest {
  @isTest
  private static void parkSrviceTest() {
    ParksServicesMock mock = new ParksServicesMock();
    Test.setMock(WebServiceMock.class, mock);
    string country = 'Japan';
    string[] parks = SoapCallouts.getParksByCountry(country);
    System.assert(parks.size() != 0);
  }
  @isTest
  public static void getSumTest() {
    CalculatorServiceMock mock = new CalculatorServiceMock();
    Test.setMock(WebServiceMock.class, mock);
    Double output = SoapCallouts.getSum(5, 5);
    System.assertEquals(output, 10);
  }
}
