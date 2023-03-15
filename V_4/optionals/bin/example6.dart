void main(List<String> args) {
  //Either the elements of the list can be null or the whole list is null or it can contains both null and the value of the given Data Type
  List<String?>? names = [];
  names?.add('Foo');
  print(names);
  List<String> names2 = [];
  final foo = names2
      .first; // Always return a value --> May complete crash your application.
  final String? first = names?.first;
  print(first ?? 'No first name found');
  names.add('Baz');
  names.add(null);
}
