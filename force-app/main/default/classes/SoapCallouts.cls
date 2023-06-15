public with sharing class SoapCallouts {
  public static String[] getParksByCountry(string country) {
    ParksService.ParkImplPort parkService = new ParksService.ParkImplPort();
    string[] parks = parkService.byCountry(country);
    System.debug(parks);
    return parks;
  }
}
