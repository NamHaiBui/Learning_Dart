void main(List<String> args) async {
  final result = await getNames().asyncMap((e) => extractChracters(e)).fold('',
      (previous, element) {
    final elements = element.join(' ');
    return '$previous $elements';
  });
  print(result);
}

Stream<String> getNames() async* {
  yield 'John';
  yield 'Jane';
  yield 'Jonathan';
}

Future<List<String>> extractChracters(String from) async {
  final characters = <String>[];
  for (final character in from.split('')) {
    await Future.delayed(Duration(milliseconds: 100));
    characters.add(character);
  }
  return characters;
}
