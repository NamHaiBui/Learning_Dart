import 'example5.dart';

void main(List<String> args) async {
  // awaiting for the entire stream to complete
  final allNames = await getNames().toList();
  print(allNames);
  for (final name in allNames) {
    print(name);
  }
}

Stream<String> names = Stream.fromIterable(['Seth', 'Kathe', 'Carl']);
