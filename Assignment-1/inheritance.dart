void main() {
  Bike bike = Bike("Bike");
  Car car = Car("Car");

  print("New Vehicle has appeared !!!");
  bike.noOfWHeels();
  bike.turnOnVehicle();
  bike.horn();
  bike.turnOffVehicle();

  print("\nNew Vehicle has appeared !!!");
  car.noOfWHeels();
  car.turnOnVehicle();
  car.horn();
  car.turnOffVehicle();
}

class Roadways {
  String vehicleType;

  Roadways(this.vehicleType);

  void turnOnVehicle() {
    print("$vehicleType turned on !!");
  }

  void horn() {
    print("$vehicleType Beeps Loudly !!");
  }

  void turnOffVehicle() {
    print("$vehicleType turned Off !!");
  }
}

class Car extends Roadways {
  Car(super.vehicleType);

  void noOfWHeels() {
    print("$vehicleType has has 4 wheels !!");
  }
}

class Bike extends Roadways {
  Bike(super.vehicleType);

  void noOfWHeels() {
    print("$vehicleType has has 2 wheels !!");
  }
}
