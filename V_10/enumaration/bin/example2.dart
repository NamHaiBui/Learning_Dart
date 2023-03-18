void main(List<String> args) {
  final foo = Person(car: Car.teslaModelX, name: 'Foo');
  switch (foo.car) {
    case Car.teslaModelX:
      print('Foo has a Tesla model X = $foo.car');
      break;
    case Car.teslaModelY:
      print('Foo has a Tesla model Y = $foo.car');
      break;
  }
}

class Person {
  final String name;
  final Car car;
  const Person({
    required this.name,
    required this.car,
  });
}

enum Car {
  teslaModelX(
    manufacturer: 'Tesla',
    model: 'Model X',
    year: 2023,
  ),
  teslaModelY(
    manufacturer: 'Tesla',
    model: 'Model Y',
    year: 2022,
  );

  final String manufacturer;
  final String model;
  final int year;
  const Car(
      {required this.manufacturer, required this.model, required this.year});
  @override
  String toString() => '$manufacturer $model $year';
}
