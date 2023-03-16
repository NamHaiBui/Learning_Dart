void main(List<String> args) {
  final person = Person();
  person.description = 'Description 1';
  print(person.description);
  person.description = 'Description 2';
  print(person.description);
}

class Person {
  late String description;
}

class Dog {
  late final String description;
}
