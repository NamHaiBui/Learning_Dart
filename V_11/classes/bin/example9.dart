void main(List<String> args) {}

enum Role { mom, dad, son, daughter, grandma, grandpa }

class Person {
  final Role role;
  const Person({
    required this.role,
  });
}
