void main(List<String> args) {
  final johnDoe = Person(name: 'John Doe');
  final janeDoe = Person(name: 'Jane Doe');
  final doeFamily = WrongImplementationOfFamily(members: [johnDoe, janeDoe]);
  print(doeFamily.membersCount);
}

class Person {
  final String name;
  Person({
    required this.name,
  });
}

class WrongImplementationOfFamily {
  final Iterable<Person> members;
  late int membersCount;
  WrongImplementationOfFamily({required this.members}) {
    membersCount = getMembersCount();
  }
  int getMembersCount() {
    return members.length;
  }
}

class CorrectImplementationOfFamily {
  final Iterable<Person> members;
  late int membersCount = getMembersCount();
  CorrectImplementationOfFamily({required this.members});
  int getMembersCount() {
    return members.length;
  }
}
