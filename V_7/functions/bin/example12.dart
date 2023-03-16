/// You can also mix up the types of params
///
void main(List<String> args) {
  describeFully('Foo');
  describeFully('Foo', lastName: null);
  describeFully('Foo', lastName: 'Baz');
}

void describeFully(
  String firstName, {
  String? lastName = 'Bar',
}) {
  print('Hello $firstName $lastName');
}
