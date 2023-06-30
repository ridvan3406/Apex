public with sharing class CalculatorServiceMock implements WebServiceMock {
    public void doInvoke(Object a, Object b, Map<String,Object> response, String d, String e, String f, String g, String h, String k){
        CalculatorServices.doAddResponse response_x = new  CalculatorServices.doAddResponse();
        response_x.return_x = 10;
        response.put('return_x', response_x);
    }
}