public class PrimitiveDataType3 {
    public void printNewDate() {
        system.debug('create new date instance');
        //create date here
        Date newDate = Date.newInstance(1990,2,2);
        system.debug('new date = ' + newDate);

        Date newDate2 = Date.newInstance(2022,1,18);
        system.debug('new date2 = ' + newDate2);

        Date todayDate = Date.today();
        system.debug('today date = ' + todayDate);

        integer ageInMonth = newDate.monthsBetween(newDate2);
        System.debug(ageInMonth);
    }

    public void printNewTime(){
        Time myTime = Time.newInstance(12,00,34,89);
        Time meTime = Time.newInstance(6,0,0,0);

        system.debug('myTime = ' + myTime);
        system.debug('meTime = ' + meTime);

    }

    public void printNewDateTime(){
        Date newDate = date.today();
        Time newTime = Time.newInstance(12,34,56,00);
        datetime datetime1 = datetime.newInstance(newDate,newTime);
        system.debug('datetime1 is  = ' + datetime1);
        
    }
} 