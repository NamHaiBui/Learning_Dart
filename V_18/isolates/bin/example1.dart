import 'dart:isolate';

/// Isolates are functions that you spawn (create an instance of) of which has a port (send port) and the function that create the instance of the isolates then create a receiver port
/// The function can send and receive message to and form the isolates while the isolates can only send messages
/// However, there are ways around this.
/// Isolates is kinda like a thread.
///
void main(List<String> args) async {
  await for (final msg in getMessages().take(10)) {
    print(msg);
  }
}

Stream<String> getMessages() {
  final rp = ReceivePort();
  final foo = Isolate.spawn(_getMessages, rp.sendPort) // create isolate
      .asStream() // turn into Stream<Isolates>
      .asyncExpand((event) => rp) // change the Stream type to the receive port
      .takeWhile((e) => e is String) // take them if they are string
      .cast<String>(); // actually turning them into String
  return foo;
  /**
   * await Isolate.spawn(_getMessages, rp.sendPort);
  await for (final msg
      in rp.takeWhile((element) => element is String).cast<String>()) {
    yield msg;
  } */
}

// underscore representing private var/funcs
void _getMessages(SendPort sp) async {
  await for (final now in Stream.periodic(
    const Duration(milliseconds: 200),
    (_) => DateTime.now().toIso8601String(),
  )) {
    sp.send(now);
  }
}
