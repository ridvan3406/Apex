public with sharing class TestPractice {
    public string name;
    public string lastName;
    public string major;
    public integer year;

    public string generateReport() {
        System.debug('report generated for ' + name + ' ' + lastName + ' of ' + year);
        return major ;
    }
}