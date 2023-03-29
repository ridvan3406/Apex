public class DateTimeMethodsDemo {
    public void  CalculateAgeInMonths() {
        date birthDate = date.newInstance(1989, 4, 25);
        date todayDate = date.today();

        integer ageInMonth = birthDate.monthsBetween(todayDate);
        System.debug(ageInMonth);
    }
    public void  CalculateAgeInDays() {
        date birthDate = date.newInstance(1989, 4, 25);
        date todayDate = date.today();

        integer ageInDay = birthDate.daysBetween(todayDate);
        System.debug('ageInDay : ' + ageInDay);
    }

    public void subscriptionEndDate() {
        date subscriptionStartDate = date.today();
        date subscriptionEndDate = subscriptionStartDate.addDays(1000);

        system.debug('subscriptionEndDate : ' + subscriptionEndDate);

        Integer endDateYear=subscriptionEndDate.year();
        system.debug('endDateYear : ' + endDateYear);

        Integer endDateMonth=subscriptionEndDate.month();
        system.debug('endDateMonth : ' + endDateMonth);
    }

    public void offerEndTime() {
        datetime offerStartTime = datetime.now();
        datetime offerEndTime = offerStartTime.addHours(51).addMinutes(45);
        System.debug('offerEndTime : ' + offerEndTime);
    }
}