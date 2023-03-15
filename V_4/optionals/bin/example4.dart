void main(List<String> args) {
  int a;
  a = 20;
  print(a);
  String? lastName;
  print(lastName);
  lastName ??=
      'Bar'; // assign the value to the variable only if the variable is null
}

void doSomthing(String? one, String? two) {
  one ??= two;
}
