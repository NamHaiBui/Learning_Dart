import 'dart:async';

void main(List<String> args) async {
  /// A Stream is an object that can be listen to, from one listener at a time
  /// If you have a Stream and you start going through the stream than you can only do it once
  ///Broadcast Stream: is a Stream where you can have multiple listener at a time
  ///Non-broadcast Stream: is a Stream where you can only have one listener at a time
  await nonBroadcastStreamExample();
  await broadcastStreamExample();
}

Future<void> nonBroadcastStreamExample() async {
  final controller = StreamController<String>();
  controller.sink.add('Bob');
  controller.sink.add('Bobby');
  controller.sink.add('Boby');
  try {
    await for (final name in controller.stream) {
      print(name);
      await for (final name in controller.stream) {
        print(name);
      }
    }
  } catch (e) {
    print(e);
  }
}

Future<void> broadcastStreamExample() async {
  late final StreamController<String> controller;
  controller = StreamController<String>.broadcast();
  final sub1 = controller.stream.listen((name) {
    print('sub1: $name');
  });
  final sub2 = controller.stream.listen((name) {
    print('sub2: $name');
  });
  controller.sink.add('Bob');
  controller.sink.add('Bobby');
  controller.sink.add('Boby');
  controller.close();
  controller.onCancel = () {
    print('onCancel called');
    sub1.cancel();
    sub2.cancel();
  };
}
