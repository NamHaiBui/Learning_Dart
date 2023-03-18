void main(List<String> args) {
  // Index from 0  to 3
  const names = ['Foo', 'Bar', 'Baz', "Qux"];
  for (final name in names.reversed) {
    print(name);
  }
  for (final name in names) {
    print(name);
  }
  if (names.contains('Bar')) {
    print('Bar is in the list');
  }
  for (final name in names.where(stringStratsWithLetterB)) {
    print(name);
  }
  for (final name in names.where((name) => name.startsWith('B'))) {
    print(name);
  }
  for (var i = 0; i < names.length; i++) {
    print(names[i]);
  }
  //sublist(i) go from i to end and print the element
  names.sublist(1).forEach(print);
  //sublist(i,j) go from i to j and print the element
  names.sublist(1, 2).forEach(print);
  final ages = [20, 30, 40];
  ages.add(50);
  ages.add(60);
  print(ages);
  const names1 = ['Foo', 'Bar', 'Baz', "Qux"];
  const names2 = ['Foo', 'Bar', 'Baz', "Qux"];
  print(names1 == names2);
  ['Foo', 'Bar', 'Baz'].map((str) => str.length);
  names.map((str) => str.toUpperCase()).forEach(print);
  final numbers = [1, 2, 3, 4, 5];
  var sum = 0;
  for (final number in numbers) {
    sum += number;
  }
  print(sum);
  //copyrighted reduce from Java and Javascript (starting, (tracker, curr)=> tracker+ curr)
  final sumOfList = numbers.fold(
      0, (int previousValue, int thisValue) => previousValue + thisValue);
  final tLength = names.fold(0, (totalLength, str) => totalLength + str.length);
  print(tLength);
  final results =
      names.fold('', (result, str) => '$result${str.toUpperCase()}');
  print(results);
}

bool stringStratsWithLetterB(String value) => value.startsWith('B');
