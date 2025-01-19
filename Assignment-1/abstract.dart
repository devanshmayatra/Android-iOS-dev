abstract class Vehicle {
  void turnOn();
  void acclerate();
  void brake();
  void turnOff();

  void displayVehicleStatus(String status) {
    print(status);
  }
}

void main() {
  // ... some code ...
  Airplane aeroplane = Airplane(100);
  // ... some code ...
  Tank tank = Tank(50);

  print("\n*****The AEROPLANE has entered the chat*****");
  aeroplane.displayVehicleStatus("The pplane is in new condition");
  aeroplane.turnOn();
  aeroplane.acclerate();
  aeroplane.acclerate();
  aeroplane.landing();
  aeroplane.displayVehicleStatus("The plane is a bit worn down");
  aeroplane.brake();
  aeroplane.brake();
  aeroplane.brake();
  aeroplane.turnOff();
  aeroplane.displayVehicleStatus(
      "The plane is worn down due to constant dombardment");
  print("\n*****The AEROPLANE has left the chat*****");

  print("\n*****The TANK has entered the chat*****");
  aeroplane.displayVehicleStatus("The tank is in new condition");
  tank.turnOn();
  tank.acclerate();
  tank.acclerate();
  tank.acclerate();
  tank.brake();
  aeroplane.displayVehicleStatus("The tank is a bit worn down");
  tank.blast();
  tank.brake();
  tank.brake();
  tank.turnOff();
  aeroplane.displayVehicleStatus("The tank is about to be blasted");
  print("\n*****The TANK has left the chat*****");
}

class Airplane extends Vehicle {
  int speed = 0;
  Airplane(this.speed);
  @override
  void acclerate() {
    speed += 30;
    print(
        "You have pressed the accelerator. The Speed of the Aeroplane is $speed kmph");
  }

  @override
  void brake() {
    speed -= 30;
    print(
        "You have pressed the brakes. The Speed of the Aeroplane is $speed kmph");
  }

  @override
  void turnOff() {
    speed = 0;
    print(
        "The Aeroplane has Stopped. The Speed of the Aeroplane is $speed kmph");
  }

  @override
  void turnOn() {
    speed += 10;
    print(
        "The Aeroplane has started. The Speed of the Aeroplane is $speed kmph");
  }

  void landing() {
    print("The Aeroplane is landing..............");
    print("The aeroplane has landed.");
  }
}

class Tank extends Vehicle {
  int speed = 0;  
  Tank(this.speed);
  @override
  void acclerate() {
    speed += 20;
    print(
        "You have pressed the accelerator. The Speed of the Tank is $speed kmph");
  }

  @override
  void brake() {
    speed -= 20;
    print("You have pressed the brakes. The Speed of the Tank is $speed kmph");
  }

  @override
  void turnOff() {
    speed = 0;
    print("The Tank has Stopped. The Speed of the Tank is $speed kmph");
  }

  @override
  void turnOn() {
    speed += 10;
    print("The Tank has started. The Speed of the Tank is $speed kmph");
  }

  void blast() {
    print("The Tank is blasting..............");
    print("The Tank has blasted the enemies !!.");
    print("We won !!");
  }
}
