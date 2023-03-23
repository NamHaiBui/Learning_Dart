void main(List<String> args) {
  print(ShortDesc(Person(name: 'John', age: 18)).description);
  print(LongDesc(Person(name: 'John', age: 18)).description);
}

class Person {
  final String name;
  final int age;
  const Person({required this.name, required this.age});
}

extension ShortDesc on Person {
  String get description {
    return '$name ($age)';
  }
}

extension LongDesc on Person {
  String get description {
    return ' The name is $name and the age is $age.';
  }
}
