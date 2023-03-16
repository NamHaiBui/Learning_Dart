void main(List<String> args) {}
// You have to pass in a value for a param with the required keyword
// required param cannot have a default value as it is already required
void doSomethingWith({required String name}) {
  print('Hello, $name');
}
