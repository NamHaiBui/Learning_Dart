import 'dart:async';

void main(List<String> args) {
  mainStream();
  // mainStreamController();
}

void mainFuture() async {
  /// normal functions when you call then, the application will stop executing the caller function until it returns and then it will continue
  /// for future objects, the execution of the caller function will just continue. It does not really care when the future ends unless you ask the application to wait for the result using `await`
  print(await asyncString());
  // wait for 1 second then return the value
  print(durationCase());
  print('Hello');
  final strLength = await asyncString().then((value) => futureChaining(value));
  print(strLength);
}

// adding an async tag here will convert the result to a Future instance
Future<String> asyncString() async {
  return "asyncString";
}

Future<String> durationCase() {
  return Future.delayed(const Duration(seconds: 1), () {
    print('this was delayed by 1 sec');
    return '';
  });
}

Future<int> futureChaining(String str) async {
  return str.length;
}

/// Streaming
void mainStream() async {
  //essentially .then() in Future but this one is for Stream
  // final res = getString().asyncExpand((event) => getCharsEvery100milis(event));
  // await for (final char in res) {
  //   print(char);
  // }
  final res2 = await getString().asyncMap((event) => getChars(event)).fold('',
      (previous, element) {
    final elements = element.join('');
    return '$previous $elements';
  });
  print(res2);
  // This will return a Future
  final sum = await getInt().reduce((previous, element) => previous + element);
  print(sum);
}

Stream<String> getString() async* {
  yield 'Behemoth';
  await Future.delayed(const Duration(milliseconds: 200));
  yield 'Someone stole my laptop';
}

Stream<String> getCharsEvery100milis(String str) async* {
  for (var i = 0; i < str.length; i++) {
    await Future.delayed(const Duration(milliseconds: 100));
    yield str[i];
  }
}

Future<List<String>> getChars(String str) async {
  final List<String> listChars = [];
  for (var i = 0; i < str.length; i++) {
    await Future.delayed(const Duration(milliseconds: 100));
    listChars.add(str[i]);
  }
  return listChars;
}

Stream<int> getInt() async* {
  yield 10;
  yield 10;
  yield 20;
  yield 10;
}

void mainStreamController() async {
  // Stream Controllers are essentially values where you can add values in and read values from
  // while Streams are read only
  final controller = StreamController<String>();
  // Values storage : .sink
  controller.sink.add('Hello');
  controller.sink.add('World');

  /// You can consume a Stream once like you can only fulfill a promise once
  // await for (final value in controller.stream) {
  //   print(value);
  // }
  final Stream<String> stringStream = controller.stream;
  await for (final value in stringStream.getUpper) {
    print(value);
  }
}

extension on Stream<String> {
  Stream<String> get getUpper => transform(ToUpperCase());
}

/// Stream Transformer takes in a value and returns a value
class ToUpperCase extends StreamTransformerBase<String, String> {
  @override
  Stream<String> bind(Stream<String> stream) {
    return stream.map((name) => name.toUpperCase());
  }
}

extension ErrorAbsorber<T> on Stream {
  Stream<T> errorSponge() => transform(StreamErrorAbsorber());
}

class StreamErrorAbsorber<T> extends StreamTransformerBase<T, T> {
  @override
  Stream<T> bind(Stream<T> stream) {
    final controller = StreamController<T>();
    stream.listen(
      (event) => controller.sink.add,
      onError: (_) {},
      onDone: controller.close,
    );
    return controller.stream;
  }
}
