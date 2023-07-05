// HttpResponse res= RESTCallouts.getAnimals();
// HttpResponse response2= RESTCallouts.getUsers();
// System.debug(response2);

// HttpResponse response3= RESTCallouts.getProducts();
// System.debug(response3);

// HttpResponse response4= RESTCallouts.getBlog();
// System.debug(response4);

//post request
// PostCallout.postMethod();


//test post userst//
// HttpResponse response4= RESTCallouts.postContacts();
// System.debug(response4);


//Test Soap Api Parks callout//

// String [] parks = SoapCallouts.getParksByCountry('Japan');
// System.debug(parks);

//Test Calculator Soap callout//
// Double result = SoapCallouts.getSum(3, 4);
// System.debug(result);


// Double result1 = SoapCallouts.getMultiply(3,7);
// System.debug(result1);

// Double result2 = SoapCallouts.getDivide(3,7);
// System.debug(result2);

// Double result3 = SoapCallouts.getSubtract(3,7);
// System.debug(result3);


// // Covid info Rest callouts

// HttpResponse response44= CovidInfoCallouts.getCovidCaseInfo();
//  System.debug(response44);

// //Test Post object callout//

// HttpResponse response444= RESTCallouts.postPosts();
//  System.debug(response444);

String url1 =System.URL.getSalesforceBaseUrl().toExternalForm();
String cool =system.URL.getSalesforceBaseUrl().toExternalForm();
System.debug(cool);
System.debug(UserInfo.getSessionId().substring(1));
