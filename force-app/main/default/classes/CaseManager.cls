@RestResource(urlMapping='/Case/*')
global with sharing class CaseManager {
  @HttpGet
  global static Case getCase() {
    //https://d8d0000090l4eeaq-dev-ed.develop.lightning.force.com/lightning/r/Case/{caseID}

    RestRequest request = RestContext.request;
    String requestURL = request.requestURI;
    Integer lastIndex = requestURL.lastIndexOf('/');
    Id caseId = requestURL.substring(lastIndex + 1);

    // Retrieve the case based on the provided ID
    Case caseRecord = [
      SELECT CaseNumber, Subject, Priority, Origin, Description
      FROM Case
      WHERE Id = :caseId
    ];
    return caseRecord;
  }

  @HttpPost
  global static Id createCase(
    String subject,
    String priority,
    String origin,
    String description
  ) {
    Case cs = new Case();
    cs.Subject = subject;
    cs.Priority = priority;
    cs.Origin = origin;
    cs.Description = description;
    insert cs;
    return cs.Id;
  }

  @HttpDelete
  global static String deleteCase() {
    RestRequest request = RestContext.request;
    String uri = request.requestURI;
    Integer lastIndex = uri.lastIndexOf('/');
    Id caseId = uri.substring(lastIndex + 1);

    Case cs = [
      SELECT id
      FROM Case
      WHERE Id = :caseId
      LIMIT 1
    ];
    delete cs;
    return 'Case has been deleted successfully!! ' + cs.id;
  }
  //update the case if case exist otherwise create new one
  @HttpPut
  global static Id upsertCase(
    String id,
    String subject,
    String priority,
    String origin,
    String description
  ) {
    if (id != null) {
      Case cs = new Case();
      cs.Id = id;
      cs.Subject = subject;
      cs.Priority = priority;
      cs.Origin = origin;
      cs.Description = description;
      upsert cs;

      return cs.Id;
    } else {
      return null;
    }
  }

  //updates the case
  @HttpPatch
  global static Case updateCase() {
    RestRequest request = RestContext.request;
    String jsonString = request.requestBody.toString();
    Map<String, Object> caseInfo = (Map<String, Object>) JSON.deserializeUntyped(
      jsonString
    );
    System.debug(caseInfo);

    Case cs = new Case();
    for (String key : caseInfo.keySet()) {
      cs.put(key, caseInfo.get(key));
    }
    update cs;
    return cs;
  }
}
