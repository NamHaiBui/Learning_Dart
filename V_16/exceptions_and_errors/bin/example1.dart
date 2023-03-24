void main(List<String> args) {
  tryCreatingPerson(age: -1);
  tryCreatingPerson(age: 0);
  tryCreatingPerson(age: 140);
}

void tryCreatingPerson({int age = 0}) {
  try {
    print(Person(age: age).age);
  } catch (e) {
    print(e.runtimeType);
    print(e);
  }
  print('_' * 10);
}

class Person {
  final int age;
  Person({
    required this.age,
  }) {
    if (age < 0) {
      throw Exception('Age must be positive');
    } else if (age >= 140) {
      throw 'Age must be less than 140';
    }
  }
}
