void main(List<String> args) {
  const names = ['Foo', 'Bar', 'Baz', 'Qux'];
  //modern for loop (for each loop)
  for (final name in names) {
    if (name.startsWith('B')) {
      continue; // Continue the for loop with the next value, jump over the rest of the for code
    }
    print(name);
  }
  for (final name in names) {
    if (name == "Baz") {
      break;
    }
    print(name);
  }
  // going backward
  for (final name in names.reversed) {
    print(name);
  }
  //range
  for (final value in Iterable.generate(20)) {
    print(value);
  }
}
