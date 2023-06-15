public with sharing class PostCallout {
    public static void postMethod() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setHeader('Content-Type', 'application/json');
        
        Map<String, Object> input = new Map<String, Object>();
        input.put('name', 'tutkun yurek');
        
        // Convert the input map to JSON
        String requestBody = JSON.serialize(input);
        request.setBody(requestBody);
        
        try {
            HttpResponse response = http.send(request);
            
            if (response.getStatusCode() == 201) {
                // Successful response
                String responseBody = response.getBody();
                System.debug('Response: ' + responseBody);
            } else {
                // Error handling
                System.debug('Error: HTTP status code - ' + response.getStatusCode());
            }
        } catch (Exception ex) {
            // Exception handling
            System.debug('Exception: ' + ex.getMessage());
        }
    }
}
