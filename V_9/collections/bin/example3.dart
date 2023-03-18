void main(List<String> args) {
  final person1 = Person(age: 10, name: 'Foo');
  final dog = Dog(age: 10, name: 'Foo');
  final persons = {person1, dog};
  print(persons);
}

class Person {
  final String name;
  final int age;
  Person({required this.name, required this.age});

  @override
  String toString() => 'Person:$name, $age';
  @override
  int get hashCode => Object.hash(name, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person && name == other.name && age == other.age;
}

class Dog {
  final String name;
  final int age;
  Dog({required this.name, required this.age});

  @override
  String toString() => 'Person:$name, $age';
  @override
  int get hashCode => Object.hash(name, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Dog && name == other.name && age == other.age;
}
