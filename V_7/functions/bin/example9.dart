void main(List<String> args) {
  describePerson();
  describePerson(name: 'Bob', age: 20);
  describePerson(age: 20, name: 'Shen');
}

void describePerson({
  String? name,
  int? age,
}) {
  print('Hello $name, your are $age years old.');
}
