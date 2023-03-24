void main(List<String> args) async {
  final names3Times = getNames().asyncExpand((event) => times3(event));
  await for (final name in names3Times) {
    print(name);
  }
}

Stream<String> getNames1() async* {
  yield 'Bob';
  yield 'Alice';
  yield 'Joe';
}

Stream<String> getNames2 = Stream.fromIterable(['Bob', 'Shawn', 'Finn']);

Stream<String> getNames() async* {
  yield* getNames1();
  yield* getNames2;
}

Stream<String> times3(String value) =>
    Stream.fromIterable(Iterable.generate(3, (_) => value));
