public class RankHandler {
    public string rankPrize(integer rank){
        string prize='';

        if (rank==1) {
            prize='Gold';
        }else if (rank==2) {
            prize='Silver';
        }else if (rank==3) {
            prize='Bronze';
        }else {
            if (rank<=10) {
                prize='top 10 certifications';
            }else {
                prize='Participation certificate';
            }

        }

        return prize;
    }
    public string getRankPrize(integer rank){
        string prize='';
        switch on rank {
            when 1{
                prize='Gold';
            }
            when 2{
                prize='Silver';
            }
            when 3{
                prize='Bronze';
            }
            when 4,5,6,7,8,9,10{
                prize='Top 10 certifications';
            }
            when else{
                prize='Thank you for Participation';
            }
        }
        return prize;
    }
}