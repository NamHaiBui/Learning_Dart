void main(List<String> args) {
  try {
    tryCreatingPerson(age: -1);
    tryCreatingPerson(age: 0);
    tryCreatingPerson(age: 140);
  } catch (err, st) {
    print(err);
    print(st);
  }
}

void tryCreatingPerson({int age = 0}) {
  try {
    print(Person(age: age).age);
  } on InvalidAgeException {
    rethrow; // rethrow back to the caller
  } catch (e) {
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
      throw InvalidAgeException(
        age,
        'Age must be positive',
      );
    } else if (age >= 140) {
      throw InvalidAgeException(
        age,
        'Age must be less than 140',
      );
    }
  }
}

// a bit of Java
class InvalidAgeException implements Exception {
  final int age;
  final String message;
  InvalidAgeException(this.age, this.message);
  @override
  String toString() {
    return 'Invalid Age Exception ($age , $message)';
  }
}
