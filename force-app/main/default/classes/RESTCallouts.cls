public with sharing class RESTCallouts {
  public static HttpResponse getAnimals() {
    //1. Prepare HTTPRequest and wrap the necessary information in it
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
    request.setMethod('GET');

    //2. Preapare internet
    Http http = new Http();

    //3. Send the HTTPRequest over the internet to recieve HttpResponse back
    HttpResponse response = http.send(request);

    //4. Process the HttpResponse
    if (response.getStatusCode() == 200) {
      // The request was successful (status code 200)
      String responseBody = response.getBody();
      System.debug('Response Body: ' + responseBody);
    } else {
      // The request failed or returned an error status code
      System.debug(
        'HTTP Request failed with status code: ' + response.getStatusCode()
      );
      CommonUtility.createLog(
        'RestCallouts - getAnimals',
        'Integration Apex',
        '',
        'Error',
        'Callouts Exception',
        response.getStatus(),
        response.getBody()
      );
    }
    return response;
  }
  public static HttpResponse getUsers() {
    //1. Prepare HTTPRequest and wrap the necessary information in it
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://jsonplaceholder.typicode.com/users');
    request.setMethod('GET');

    //2. Preapare internet
    Http http = new Http();

    //3. Send the HTTPRequest over the internet to recieve HttpResponse back
    HttpResponse response = http.send(request);

    //4. Process the HttpResponse
    if (response.getStatusCode() == 200) {
      // The request was successful (status code 200)
      String jsonString = response.getBody();
      System.debug('Response Body: ' + jsonString);
      List<UserWrapper> userWrappers = (List<UserWrapper>) JSON.deserialize(
        jsonString,
        List<UserWrapper>.class
      );
      List<My_User__c> users = new List<My_User__c>();
      for (UserWrapper uw : userWrappers) {
        My_User__c user = new My_User__c();
        user.Email__c = uw.email;
        user.Phone__c = uw.phone;
        user.Username__c = uw.username;
        user.Website__c = uw.website;
        user.Name = uw.name;
        user.Street__c = uw.address.street;
        user.City__c = uw.address.city;
        users.add(user);
      }
      try {
        if (!users.isEmpty()) {
          insert users;
        }
      } catch (Exception ex) {
        CommonUtility.createLog(
          'RestCallouts - getProducts',
          'Integration Apex',
          ex.getStackTraceString(),
          'Exception',
          ex.getTypeName(),
          ex.getMessage(),
          ''
        );
      }
    }
    return response;
  }

  public static HttpResponse getProducts() {
    //1. Prepare HTTPRequest and wrap the necessary information in it
    HttpRequest request = new HttpRequest();
    //request.setEndpoint(' https://jsonplaceholder.typicode.com/todos');
    request.setEndpoint(' https://60a557ffc0c1fd00175f3bb3.mockapi.io/movies');
    request.setMethod('GET');

    //2. Preapare internet
    Http http = new Http();

    //3. Send the HTTPRequest over the internet to recieve HttpResponse back
    HttpResponse response = http.send(request);

    //4. Process the HttpResponse
    if (response.getStatusCode() == 200) {
      // The request was successful (status code 200)
      String jsonString = response.getBody();
      System.debug('Response Body: ' + jsonString);
      List<ProductWrapper> productWrappers = (List<ProductWrapper>) JSON.deserialize(
        jsonString,
        List<ProductWrapper>.class
      );
      List<Product__c> products = new List<Product__c>();
      for (ProductWrapper pw : productWrappers) {
        Product__c prod = new Product__c();
        prod.Name = pw.productId;
        prod.Category__c = pw.category;
        String pr = pw.price.substring(1);
        prod.Price__c = Decimal.valueOf(pr);
        prod.Description__c = pw.description;
        prod.Image__c = pw.image;
        prod.Prdouct_Name__c = pw.productName;
        products.add(prod);
      }
      try {
        if (!products.isEmpty()) {
          insert products;
        }
      } catch (Exception ex) {
        CommonUtility.createLog(
          'RestCallouts - getProducts',
          'Integration Apex',
          ex.getStackTraceString(),
          'Exception',
          ex.getTypeName(),
          ex.getMessage(),
          ''
        );
      }
    }
    return response;
  }
  public static HttpResponse getBlog() {
    //1. Prepare HTTPRequest and wrap the necessary information in it
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://60a557ffc0c1fd00175f3bb3.mockapi.io/blog');
    request.setMethod('GET');

    //2.prepare the internet
    Http http = new Http();
    HttpResponse response = http.send(request);
    //3. wrap the response
    if (response.getStatusCode() == 200) {
      String jsonstring = response.getBody();
      System.debug('Response ' + jsonstring);

      List<BlogWrapper> blogWrappers = (List<BlogWrapper>) JSON.deserialize(
        jsonString,
        List<BlogWrapper>.class
      );
      List<Blog__c> blogs = new List<Blog__c>();
      for (BlogWrapper bw : blogWrappers) {
        Blog__c blog = new Blog__c();
        blog.Author__c = bw.author;
        blog.Body__c = bw.body;
        blog.Topic__c = bw.topic;
        blog.Title__c = bw.title;
        blogs.add(blog);
      }
      try {
        if (!blogs.isEmpty()) {
          insert blogs;
        }
      } catch (Exception ex) {
        CommonUtility.createLog(
          'RestCallouts - getBlog',
          'Integration Apex',
          ex.getStackTraceString(),
          'Exception',
          ex.getTypeName(),
          ex.getMessage(),
          ''
        );
      }
    }
    return response;
  }
  public static HttpResponse postContacts() {
    //1.Prepare hhttp request and wrap the necessry information in it
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://gorest.co.in/public/v2/posts');
    request.setMethod('POST');
    //1.1 Get the data and prepare it as json
    List<Contact> contacts = [
      SELECT Name, Email, Gender__c, Status__c
      FROM Contact
      WHERE Gender__c != NULL AND Status__c != NULL
      LIMIT 1
    ];

    ContactWrapper cw = new ContactWrapper();
    for (Contact con : contacts) {
      cw.name = con.Name;
      cw.email = con.Email;
      cw.gender = con.Gender__c;
      cw.status = con.Status__c;
    }
    request.setBody(JSON.serialize(cw));
    request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    request.setHeader(
      'Authorization',
      'Bearer cd9f3a01284e1f90c9ead328ebc740933c81f4c40bb56f1235c075141924af50'
    );
    System.debug('json: ' + JSON.serialize(cw));
    //2.Prepare the internet connection
    Http http = new Http();
    //3.Send rhe HttpRequest over the internet to reveive HTTPRESPONSE basck
    HttpResponse response = http.send(request);
    System.debug(response.getBody());
    //4. Process the HTTPresponse
    if (response.getStatusCode() == 201) {
      System.debug('Request has been processed succesfully');
    }
    return response;
  }
  public static HttpResponse postPosts() {
    //1.Prepare hhttp request and wrap the necessry information in it
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://gorest.co.in/public/v2/users');
    request.setMethod('POST');

    //1.1 Prepare body
    Posts__c posts = [
      SELECT User_ID__c, Title__c, Body__c
      FROM Posts__c
      WHERE CreatedDate = TODAY
      LIMIT 1
    ];
    PostWrapper post = new PostWrapper();
    post.user_id = Integer.valueOf(posts.User_ID__c);
    post.title=posts.Title__c;
    post.body=posts.Body__c;
    request.setBody(JSON.serialize(post));
    request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    request.setHeader(
      'Authorization',
      'Bearer cd9f3a01284e1f90c9ead328ebc740933c81f4c40bb56f1235c075141924af50'
    );

    //2.Prepare the internet connection
    Http http = new Http();
    //3.Send rhe HttpRequest over the internet to reveive HTTPRESPONSE basck
    HttpResponse response = http.send(request);
    System.debug(response.getBody());
    //4. Process the HTTPresponse
    if (response.getStatusCode() == 201) {
      System.debug(
        'Request has been processed succesfully' + response.getBody()
      );
    } else {
      System.debug('error');
    }
    return response;
  }
}
