void main(List<String> args) async {
  final result = getNames().asyncExpand((event) => getCharacters((event)));
  await for (final letters in result) {
    print(letters);
  }
}

Stream<String> getCharacters(String fromString) async* {
  for (var i = 0; i < fromString.length; i++) {
    await Future.delayed(Duration(milliseconds: 300));
    yield fromString[i];
  }
}

Stream<String> getNames() async* {
  await Future.delayed(Duration(milliseconds: 200));
  yield "John";
  await Future.delayed(Duration(milliseconds: 200));
  yield "Doe";
}
