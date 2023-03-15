void main(List<String> args) {
  String? lastName;

  /// If an variable is optional, then you can't access the properties of the variables
  print(lastName
      ?.length); // This will run a check to see if the value is null, then it won't access the properties adn return null, else, it will run as normal
  print(lastName ?? 'Foo');
  final bla = lastName ?? 'Foo'; // Guarantee that the variable is not null.
  // ?? check if null, then assign else
  // dart resolve compound from left to right if no other condition is applied
  String? nullName;
  print(lastName ?? nullName ?? "Bar");
}
