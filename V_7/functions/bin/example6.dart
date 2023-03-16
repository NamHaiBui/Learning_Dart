void main(List<String> args) {
  describe();

  describe(something: null);
}

// An Optional Param with a default value will take the default value if the params are empty and can also accept and take null if given.
void describe({String? something = "Hello, World!"}) {
  print(something);
}
