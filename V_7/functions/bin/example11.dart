void main(List<String> args) {
  makeUpperCase();
  makeUpperCase(null);
  makeUpperCase("Foo");
  makeUpperCase('Foo', 'Bar');
}

// Optional Positional Parameter
void makeUpperCase([String? name, String lastName = 'Doe']) {
  print(name?.toUpperCase());
  print(lastName.toUpperCase() + '\n');
}
