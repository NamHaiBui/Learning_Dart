/// Postional parameters, they are passed in orders, they don't have name associated with them at call site and they are always required and can't have default values
void main(List<String> args) {
  sayGoodbyeTo('Bob', 'Carl');
  sayGoodbyeTo(null, null);
}

void sayGoodbyeTo(
  String? person,
  String? OtherPerson,
) {
  print('Goodbye, $person and $OtherPerson !!');
}
