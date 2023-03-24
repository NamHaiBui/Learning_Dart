// Stream: a chain of event
/// future => | ------ 1SEC ------ X|start - delay - value: you can get 1 value
/// stream => | ------ 1SEC --- X --- 1 SEC --- XXX| start - delay - stop: you can get multiple value
void main(List<String> args) async {
  for (final value in names()) {
    print(value);
  }
  // await for (final number in getNumbers()) {
  //   print(number);
  // }
  /// You can only use await for for Stream<> and not Future as Stream can contain multiple values while Future returns 1 result
  try {
    await for (final name in getName()) {
      print(name);
    }
  } catch (e) {
    print(e);
  }
}

List<String> names() => ['John', 'Doe'];
Stream<int> getNumbers() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    yield i; // insert value into the stream
  }
}

Stream<String> getName() async* {
  await Future.delayed(Duration(seconds: 1));
  yield "John";
  throw Exception("Somehting is wrong");
  // Anything after the throw is DEAD Code
}
