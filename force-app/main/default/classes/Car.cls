public class Car {
    public string carColor = '';
    public string carName = '';
    integer maxSpeedKmperHour = 150;

    public void switchOn() {
        system.debug('Starting the car');
    }
    public void drive() {
        system.debug('driving ' + carName);
    }
    public void driveMaxSpeed() {
        string drivingDescription = 'Driving ' + carName + ' at ' + maxSpeedKmperHour + 'km/h.';
        system.debug(drivingDescription);
    }

    public void createCars() {
        Car suzuki = new Car();
        suzuki.carColor='blues';
        suzuki.carName = 'suzuki';
        suzuki.switchOn();
        suzuki.driveMaxSpeed();
        suzuki.drive();
        System.debug(suzuki);
    }

}