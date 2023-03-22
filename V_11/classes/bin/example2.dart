void main(List<String> args) {
  const me = Person('Bob', 20);
  const foo = Person.foo();
  const bar = Person.bar(10);
}

class Person {
  final String name;
  final int age;
  const Person(this.name, this.age);
  // custom contructor
  const Person.foo()
      : name = 'Foo',
        age = 20;
  const Person.bar(
    this.age,
  ) : name = 'Bar';
  const Person.other({
    String? name,
    int? age,
  })  : name = name ?? 'Baz',
        age = age ?? 30;
}
