public class CalculatorServices {
  public class doDivideResponse {
    public Double return_x;
    private String[] return_x_type_info = new List<String>{
      'return',
      'http://calculator.services/',
      null,
      '0',
      '1',
      'false'
    };
    private String[] apex_schema_type_info = new List<String>{
      'http://calculator.services/',
      'false',
      'false'
    };
    private String[] field_order_type_info = new List<String>{ 'return_x' };
  }
  public class doMultiply {
    public Double arg0;
    public Double arg1;
    private String[] arg0_type_info = new List<String>{
      'arg0',
      'http://calculator.services/',
      null,
      '0',
      '1',
      'false'
    };
    private String[] arg1_type_info = new List<String>{
      'arg1',
      'http://calculator.services/',
      null,
      '0',
      '1',
      'false'
    };
    private String[] apex_schema_type_info = new List<String>{
      'http://calculator.services/',
      'false',
      'false'
    };
    private String[] field_order_type_info = new List<String>{ 'arg0', 'arg1' };
  }
  public class doAdd {
    public Double arg0;
    public Double arg1;
    private String[] arg0_type_info = new List<String>{
      'arg0',
      'http://calculator.services/',
      null,
      '0',
      '1',
      'false'
    };
    private String[] arg1_type_info = new List<String>{
      'arg1',
      'http://calculator.services/',
      null,
      '0',
      '1',
      'false'
    };
    private String[] apex_schema_type_info = new List<String>{
      'http://calculator.services/',
      'false',
      'false'
    };
    private String[] field_order_type_info = new List<String>{ 'arg0', 'arg1' };
  }
  public class doAddResponse {
    public Double return_x;
    private String[] return_x_type_info = new List<String>{
      'return',
      'http://calculator.services/',
      null,
      '0',
      '1',
      'false'
    };
    private String[] apex_schema_type_info = new List<String>{
      'http://calculator.services/',
      'false',
      'false'
    };
    private String[] field_order_type_info = new List<String>{ 'return_x' };
  }
  public class doDivide {
    public Double arg0;
    public Double arg1;
    private String[] arg0_type_info = new List<String>{
      'arg0',
      'http://calculator.services/',
      null,
      '0',
      '1',
      'false'
    };
    private String[] arg1_type_info = new List<String>{
      'arg1',
      'http://calculator.services/',
      null,
      '0',
      '1',
      'false'
    };
    private String[] apex_schema_type_info = new List<String>{
      'http://calculator.services/',
      'false',
      'false'
    };
    private String[] field_order_type_info = new List<String>{ 'arg0', 'arg1' };
  }
  public class doSubtract {
    public Double arg0;
    public Double arg1;
    private String[] arg0_type_info = new List<String>{
      'arg0',
      'http://calculator.services/',
      null,
      '0',
      '1',
      'false'
    };
    private String[] arg1_type_info = new List<String>{
      'arg1',
      'http://calculator.services/',
      null,
      '0',
      '1',
      'false'
    };
    private String[] apex_schema_type_info = new List<String>{
      'http://calculator.services/',
      'false',
      'false'
    };
    private String[] field_order_type_info = new List<String>{ 'arg0', 'arg1' };
  }
  public class doSubtractResponse {
    public Double return_x;
    private String[] return_x_type_info = new List<String>{
      'return',
      'http://calculator.services/',
      null,
      '0',
      '1',
      'false'
    };
    private String[] apex_schema_type_info = new List<String>{
      'http://calculator.services/',
      'false',
      'false'
    };
    private String[] field_order_type_info = new List<String>{ 'return_x' };
  }
  public class doMultiplyResponse {
    public Double return_x;
    private String[] return_x_type_info = new List<String>{
      'return',
      'http://calculator.services/',
      null,
      '0',
      '1',
      'false'
    };
    private String[] apex_schema_type_info = new List<String>{
      'http://calculator.services/',
      'false',
      'false'
    };
    private String[] field_order_type_info = new List<String>{ 'return_x' };
  }
  public class CalculatorImplPort {
    public String endpoint_x = 'https://th-apex-soap-service.herokuapp.com/service/calculator';
    public Map<String, String> inputHttpHeaders_x;
    public Map<String, String> outputHttpHeaders_x;
    public String clientCertName_x;
    public String clientCert_x;
    public String clientCertPasswd_x;
    public Integer timeout_x;
    private String[] ns_map_type_info = new List<String>{
      'http://calculator.services/',
      'CalculatorServices'
    };
    public Double doDivide(Double arg0, Double arg1) {
      CalculatorServices.doDivide request_x = new CalculatorServices.doDivide();
      request_x.arg0 = arg0;
      request_x.arg1 = arg1;
      CalculatorServices.doDivideResponse response_x;
      Map<String, CalculatorServices.doDivideResponse> response_map_x = new Map<String, CalculatorServices.doDivideResponse>();
      response_map_x.put('response_x', response_x);
      WebServiceCallout.invoke(
        this,
        request_x,
        response_map_x,
        new List<String>{
          endpoint_x,
          '',
          'http://calculator.services/',
          'doDivide',
          'http://calculator.services/',
          'doDivideResponse',
          'CalculatorServices.doDivideResponse'
        }
      );
      response_x = response_map_x.get('response_x');
      return response_x.return_x;
    }
    public Double doSubtract(Double arg0, Double arg1) {
      CalculatorServices.doSubtract request_x = new CalculatorServices.doSubtract();
      request_x.arg0 = arg0;
      request_x.arg1 = arg1;
      CalculatorServices.doSubtractResponse response_x;
      Map<String, CalculatorServices.doSubtractResponse> response_map_x = new Map<String, CalculatorServices.doSubtractResponse>();
      response_map_x.put('response_x', response_x);
      WebServiceCallout.invoke(
        this,
        request_x,
        response_map_x,
        new List<String>{
          endpoint_x,
          '',
          'http://calculator.services/',
          'doSubtract',
          'http://calculator.services/',
          'doSubtractResponse',
          'CalculatorServices.doSubtractResponse'
        }
      );
      response_x = response_map_x.get('response_x');
      return response_x.return_x;
    }
    public Double doMultiply(Double arg0, Double arg1) {
      CalculatorServices.doMultiply request_x = new CalculatorServices.doMultiply();
      request_x.arg0 = arg0;
      request_x.arg1 = arg1;
      CalculatorServices.doMultiplyResponse response_x;
      Map<String, CalculatorServices.doMultiplyResponse> response_map_x = new Map<String, CalculatorServices.doMultiplyResponse>();
      response_map_x.put('response_x', response_x);
      WebServiceCallout.invoke(
        this,
        request_x,
        response_map_x,
        new List<String>{
          endpoint_x,
          '',
          'http://calculator.services/',
          'doMultiply',
          'http://calculator.services/',
          'doMultiplyResponse',
          'CalculatorServices.doMultiplyResponse'
        }
      );
      response_x = response_map_x.get('response_x');
      return response_x.return_x;
    }
    public Double doAdd(Double arg0, Double arg1) {
      CalculatorServices.doAdd request_x = new CalculatorServices.doAdd();
      request_x.arg0 = arg0;
      request_x.arg1 = arg1;
      CalculatorServices.doAddResponse response_x;
      Map<String, CalculatorServices.doAddResponse> response_map_x = new Map<String, CalculatorServices.doAddResponse>();
      response_map_x.put('response_x', response_x);
      WebServiceCallout.invoke(
        this,
        request_x,
        response_map_x,
        new List<String>{
          endpoint_x,
          '',
          'http://calculator.services/',
          'doAdd',
          'http://calculator.services/',
          'doAddResponse',
          'CalculatorServices.doAddResponse'
        }
      );
      response_x = response_map_x.get('response_x');
      return response_x.return_x;
    }
  }
}
