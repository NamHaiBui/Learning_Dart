void main(List<String> args) {
  final v = Vehicle(4);
}

class Vehicle {
  final int wheelCount;
  const Vehicle(this.wheelCount);
  @override
  String toString() {
    if (runtimeType == Vehicle) {
      return 'Vehicle with $wheelCount wheels';
    } else {
      return super.toString();
    }
    // return '$runtimeType with $wheelCount wheels';
  }
}

class Car extends Vehicle {
  const Car(wheelCount) : super(wheelCount);
  // const Car(super.wheelCount)
}

class Bicycle extends Vehicle {
  const Bicycle() : super(2);
  // const Car(super.wheelCount)
}
