void main(List<String> args) {
  const car = Car();
  print(car.kind);
  car.accelerate();
  car.decelerate();
  const motorcycle = Motorcycle();
  print(motorcycle.kind);
  motorcycle.accelerate();
  motorcycle.decelerate();
}

abstract class Vehicle {
  final VehicleKind kind;
  const Vehicle({required this.kind});
  void accelerate() => print('$kind is accelerating');
  void decelerate() => print('$kind is decelerating');
}

class Car extends Vehicle {
  const Car() : super(kind: VehicleKind.car);
}

// By implementing an abstract class allows the current child to use the parent as a kind of blue print
class Motorcycle implements Vehicle {
  const Motorcycle();
  @override
  void accelerate() => print('motorcycle is accelerating');

  @override
  void decelerate() => print('motorcycle is decelerating');

  @override
  VehicleKind get kind => VehicleKind.motorcycle;
}

enum VehicleKind {
  car,
  truck,
  motorcycle,
  bicycle,
}
