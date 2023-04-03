import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

void main(List<String> args) async {
  // await for (final msg in getMessages().take(10)) {
  //   print(msg);
  // }
  final rp = ReceivePort();
  Isolate.spawn(_parseJsonIsolateEntry, rp.sendPort);
  final todos = rp
      .takeWhile((element) => element is Iterable<Todo>)
      .cast<Iterable<Todo>>()
      .take(1);
  await for (final todo in todos) {
    print(todo);
  }
}

// outside nice interface
Stream<String> getMessages() {
  final rp = ReceivePort();
  return Isolate.spawn(_getMessages, rp.sendPort)
      .asStream()
      .asyncExpand(
        (_) => rp,
      )
      .takeWhile((element) => element is String)
      .cast<String>();
}

void _getMessages(SendPort sp) async {
  await for (final time in Stream.periodic(
    const Duration(milliseconds: 200),
    (_) => DateTime.now().toIso8601String(),
  )) {
    sp.send(time);
  }
}

class Responder {
  final ReceivePort rp;
  final Stream<dynamic> broadcastRp;
  final SendPort communicatorSendPort;
  Responder({
    required this.rp,
    required this.broadcastRp,
    required this.communicatorSendPort,
  });
  static Future<Responder> create() async {
    final rp = ReceivePort();
    Isolate.spawn(_communicator, rp.sendPort);
    final broadcastRp = rp.asBroadcastStream();
    final SendPort communicatorSendPort = await broadcastRp.first;
    return Responder(
        rp: rp,
        communicatorSendPort: communicatorSendPort,
        broadcastRp: broadcastRp);
  }

  static void _communicator(SendPort sp) async {
    final rp = ReceivePort();
    sp.send(rp.sendPort);
    final messages =
        rp.takeWhile((element) => element is String).cast<String>();
    await for (final message in messages) {
      for (final entry in dialect.entries) {
        if (entry.key.trim().toLowerCase() == message.trim().toLowerCase()) {
          sp.send(entry.value);
          continue;
        }
      }
      sp.send('You are not a poet');
    }
  }

  Future<String> getMessage(String str) async {
    communicatorSendPort.send(str);

    return broadcastRp
        .takeWhile((element) => element is String)
        .cast<String>()
        .take(1)
        .first;
  }
}

Future<String> getMessage(String str) async {
  final rp = ReceivePort();
  Isolate.spawn(_communicator, rp.sendPort);
  final broadcastRp = rp.asBroadcastStream();
  final SendPort communicatorSendPort = await broadcastRp.first;
  communicatorSendPort.send(str);

  return broadcastRp
      .takeWhile((element) => element is String)
      .cast<String>()
      .take(1)
      .first;
}

void _communicator(SendPort sp) async {
  final rp = ReceivePort();
  sp.send(rp.sendPort);
  final messages = rp.takeWhile((element) => element is String).cast<String>();
  await for (final message in messages) {
    for (final entry in dialect.entries) {
      if (entry.key.trim().toLowerCase() == message.trim().toLowerCase()) {
        sp.send(entry.value);
        continue;
      }
    }
    sp.send('You are not a poet');
  }
  // dialect['messages'];
}

const dialect = {
  'Nothing': "I lost myself in the dark",
  "Without": "A shine of light in my path",
};

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool isCompleted;
  Todo(
      {required this.userId,
      required this.id,
      required this.title,
      required this.isCompleted});
  Todo.fromJson(Map<String, dynamic> json)
      : this(
          userId: json['userId'] as int,
          id: json['id'] as int,
          title: json['title'] as String,
          isCompleted: json['completed'] as bool,
        );
  @override
  String toString() {
    return 'Todo(userId :$userId, id: $id, title: $title, isCompleted: $isCompleted)';
  }
}

void _parseJsonIsolateEntry(SendPort sp) async {
  final client = HttpClient();
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos/');
  final todos = await client
      .getUrl(uri)
      .then((req) => req.close())
      .then((response) => response.transform(utf8.decoder).join())
      .then((value) => jsonDecode(value) as List<dynamic>)
      .then((json) => json.map((map) => Todo.fromJson(map)));
  sp.send(todos);
}

Future<void> mainIso() async {
  final uri = Uri.parse('package:isolates/isolates.dart');
  final rp = ReceivePort();
  Isolate.spawnUri(
    uri,
    [],
    rp.sendPort,
  );
  final firstMessage = await rp.first;
  print(firstMessage);
}
