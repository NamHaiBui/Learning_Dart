import 'package:collection/collection.dart';

void main(List<String> args) {
  final names = {'Foo', 'Bar', 'Baz', 'Qux'};
  names.add('Foo');
  final foo1 = 'Foo';
  var foo2 = 'Foo';
  // Hash Code is the same with the same value
  print(foo1.hashCode);
  print(foo2.hashCode);
  if (names.contains('Foo')) {
    print('Found Foo');
  } else {
    print('Did not find Foo');
  }
  final ages1 = {10, 20, 30};
  final ages2 = {10, 20, 30};
  print(ages1 == ages2); // this does not work for setss
  print(SetEquality().equals(ages1,
      ages2)); // this will. This is from the package. Ordering of the element in the set does not matter
}
