void main(List<String> args) {
  // final foo = Person();
  // foo.name = 'Foo';
  // final bar = Person();
  // bar.name = 'Bar';
  // print(foo.name);
  // print(bar.name);
  // Person.name = 'Foo';
  // print(Person.name);
  // Person.name = 'Baz';
  // print(Person.name);
  print(Car.carsInstantiated);
  Car(name: 'My Car');
  print(Car.carsInstantiated);
  Car(name: 'Your Car');
  print(Car.carsInstantiated);
}

class Person {
  // same on all instances of the object
  static String name = '';
}

class Car {
  static int _carInstantiated = 0;
  static int get carsInstantiated => _carInstantiated;
  static void _incrementCarsInstantiated() => _carInstantiated++;
  final String name;
  Car({
    required this.name,
  }) {
    _incrementCarsInstantiated();
  }
}
