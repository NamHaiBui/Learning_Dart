void main(List<String> args) {
  final me2003 = Person(age: 0);
  final me2023 = me2003 + (2023 - 2003);
  print(me2023);
}

class Person {
  final int age;
  Person({required this.age});
  @override
  String toString() => 'Person (age: $age)';
  Person operator +(int age) => Person(age: this.age + age);
}
