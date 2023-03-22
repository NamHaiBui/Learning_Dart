void main(List<String> args) {
  print(Vehicle.car());
  print(Vehicle.truck());
}

class Vehicle {
  // Factory constuctor can create instances of there subclasses
  // A normal constructor of a class can only create an instance of the class in question
  // While a factory constructor can create an instance of subclasses

  const Vehicle();
  factory Vehicle.car() => Car();
  factory Vehicle.truck() => Truck();
  @override
  String toString() => "Vehicle of type $runtimeType";
}

class Car extends Vehicle {
  const Car();
}

class Truck extends Vehicle {
  const Truck();
}
