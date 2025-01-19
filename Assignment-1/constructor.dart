void main() {
  Car mercedes =
      Car(color: "Black", model: "Mercedes Benz Maybach", yearOfMake: "2002");
  mercedes.printCarData();
  Car bmw = Car.withoutYearofMake(color: "Yellow", model: "BMW Homage");
  bmw.printCarData();
}

class Car {
  final String color;
  final String model;
  final String yearOfMake;
  Car({required this.color, required this.model, required this.yearOfMake});
  Car.withoutYearofMake({required this.color, required this.model})
      : yearOfMake = "Not known";
  void printCarData() {
    print("\n****Showing new car****");
    print("The model of the car is $model");
    print("The color of the car is $color");
    print("The make Year of the car is $yearOfMake");
  }
}
