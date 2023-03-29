public class PrimitiveDataTypeDemo {
    public void printBasicDataType(){
        string batchName = 'Falcons';
        integer totalCandidates =40;
        boolean isAdminCompleted = true;

        system.debug(batchName);
        system.debug(totalCandidates);
        system.debug('isAdminCompleted:'+isAdminCompleted);

        string batchDescription = batchName + ' is best ' ;

        system.debug(batchDescription);
    }

    public void printBasicDataType2(){
        Decimal decvalue = 27.01;
        System.debug('Decimal: ' + decvalue);

        Long longValue = 817638712L;
        system.debug('LongValue: ' + longValue);

    }

    public void printNewDate(){
       Date newDate = Date.newInstance(2023 ,2 ,9);
       Date newDate2 = Date.newInstance(2024 ,3 ,10);
       Date todayDate = date.today();

       System.debug('Date is ' + newDate);
       System.debug('today date is ' + todayDate);

    }

    public void printNewTime(){
        Time myTime = Time.newInstance(17,44,3,45);
        System.debug('myTime is ' + myTime);
    }

    public void printNewDateTime(){
        //todays date.
        date newDate = date.today();
        //new time.
        time newTime = time.newInstance(9,23,7,44);
        time tryTime = time.newInstance(23,34,56,33);
        System.debug(tryTime);

        // 1. Create date time  from date and time
        Datetime datetime1 = datetime.newInstance(newDate,newTime);
        System.debug('datetime1 is ' + datetime1);

        //2. create datetime by using year, month and day

        Datetime datetime2 = datetime.newInstance(2023,5,25);
        System.debug('datetime2 is ' + datetime2);

        //3. create datetime by using year, month, day,hour ,min,second

        datetime datetime3 = datetime.newInstance(2023,4,11,2,33,44);
        System.debug('datetime3 is ' + datetime3);

        datetime currenttime = datetime.now();
        System.debug('currenttime is ' + currenttime);
    }
   
}