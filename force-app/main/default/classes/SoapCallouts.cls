public with sharing class SoapCallouts {
  public static String[] getParksByCountry(string country) {
    ParksServices.ParksImplPort parkService = new ParksServices.ParksImplPort();
    string[] parks = parkService.byCountry(country);
    System.debug(parks);
    return parks;
  }
  public static Decimal getSum(Double num1, Double num2) {
    CalculatorServices.CalculatorImplPort calculatorService = new CalculatorServices.CalculatorImplPort();
    Decimal result = calculatorService.doAdd(num1, num2);
    return result;
  }
  public static Decimal getMultiply(Double num1, Double num2) {
    CalculatorServices.CalculatorImplPort calculatorService = new CalculatorServices.CalculatorImplPort();
    Decimal result = calculatorService.doMultiply(num1, num2);
    return result;
  }
  public static Decimal getDivide(Double num1, Double num2) {
    CalculatorServices.CalculatorImplPort calculatorService = new CalculatorServices.CalculatorImplPort();
    Decimal result = calculatorService.doDivide(num1, num2);
    return result;
  }
  public static Decimal getSubtract(Double num1, Double num2) {
    CalculatorServices.CalculatorImplPort calculatorService = new CalculatorServices.CalculatorImplPort();
    Decimal result = calculatorService.doSubtract(num1, num2);
    return result;
  }
}
