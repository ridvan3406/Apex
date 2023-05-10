@isTest
public with sharing class TestPracticeTest {
    @isTest
    public static void testForStudent() {
        TestPractice student1 = new TestPractice() ;
        student1.name = 'ridvan';
        student1.lastName = 'cool mate';
        student1.year= 2023;
        student1.major = 'engineering';

        string majorReturned = student1.generateReport();
        System.assertEquals(student1.major, majorReturned);
    }
}