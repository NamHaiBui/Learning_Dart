import 'dart:async';

void main(List<String> args) async {
  await for (final name in names.capaitalized) {
    print(name);
  }
  print('-' * 10);
  await for (final name in names.capitalizedUsingMap) {
    print(name);
  }
}

Stream<String> names = Stream.fromIterable(['Seth', 'Kathe', 'Carl']);

class ToUpperCase extends StreamTransformerBase<String, String> {
  @override
  Stream<String> bind(Stream<String> stream) {
    return stream.map((name) => name.toUpperCase());
  }
}

extension on Stream<String> {
  Stream get capaitalized => transform(ToUpperCase());
  Stream<String> get capitalizedUsingMap => map((e) => e.toUpperCase());
}
