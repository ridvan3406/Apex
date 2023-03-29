public class Candidate {
    public string name ;
    public string gender;
    public static string CompanyName;
    public void printCandidate() {
        System.debug('=============');
        System.debug('name is ' + name + ' gender is ' + gender);
        System.debug('company name is ' + CompanyName);
        System.debug('=============');
    }

    public static void printCandidateInfo() {
        System.debug('company name is ' + CompanyName);
    }

}