@isTest
public with sharing class RankHandlerTest {
    @isTest
    public static void testRankPrize() {
        RankHandler rh= new RankHandler();
        string prize1 =rh.rankPrize(1);
        System.assertEquals('Gold', prize1);

        string prize2 =rh.rankPrize(2);
        System.assertEquals('Silver', prize2);

        string prize3 =rh.rankPrize(3);
        System.assertEquals('Bronze', prize3);

        string top10 =rh.rankPrize(4);
        System.assertEquals('top 10 certifications', top10);

        string participation =rh.rankPrize(15);
        System.assertEquals('Participation certificate', participation);
    }

    @isTest
    public static void testRankPrizeSwitch() {
        RankHandler rh= new RankHandler();
        string prize1 =rh.getRankPrize(1);
        System.assertEquals('Gold', prize1);

        string prize2 =rh.getRankPrize(2);
        System.assertEquals('Silver', prize2);

        string prize3 =rh.getRankPrize(3);
        System.assertEquals('Bronze', prize3);

        string top10 =rh.getRankPrize(4);
        System.assertEquals('Top 10 certifications', top10);

        string participation =rh.getRankPrize(15);
        System.assertEquals('Thank you for Participation', participation);
    }
   
}