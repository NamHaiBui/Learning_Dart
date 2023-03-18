void main(List<String> args) {}
void addToArrayWrong() {
  final names1 = ['Foo 1', 'Bar 1', 'Baz 1'];
  final names2 = ['Foo 2', 'Bar 2', 'Baz 2'];
  // The following kind of assignment are essentially pointing to the same value
  final allNamesWrong = names1;
  allNamesWrong.addAll(names2);
}

void addToArrayRight() {
  final names1 = ['Foo 1', 'Bar 1', 'Baz 1'];
  final names2 = ['Foo 2', 'Bar 2', 'Baz 2'];
  final allNamesWrong = [...names1, ...names2];
}

void addToDictionaryRight() {
  const info = {'c': 'l', 12: 20};
  final result = {...info}..addAll({"weight": 80});
}
