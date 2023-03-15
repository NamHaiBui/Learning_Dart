import 'dart:html';

void main(List<String> args) {
  // ?. access the properties of nullable variables
  // ?? Take the value to the right hand side if the value at the left handside is null
  String? lastName = null;
  void changeLastName() {
    lastName = 'Bar';
  }

  changeLastName();
  final foo = lastName;
  if (lastName?.contains('Bar') ?? false) {
    print('Last Name contains Bar');
  }
  if (lastName?.contains('Bar') == true) {
    print('LastName contains Bar');
  }
}
