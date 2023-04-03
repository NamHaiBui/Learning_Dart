import 'dart:async';

/// This program simulates waiting for multiple results from a given source with a timeout limit
/// in between batches of data. If such timeout limit is exceeded, the program will throw an exception to stop and inform the coder.
/// However, the program can also absorb the exception and continue running.
///
/// In the simulation, the program waits for the results of 3 Streams then print out all the yielded results
/// in a list with fancy marking depending on the generation of the instance of Person
/// if the duration between yielding data of each Stream exceeds a given limit,
/// then a TimeoutBetweenEventsException will be thrown.
void main(List<String> args) async {
  final List<List<Person>> users = [];
  const timeLimit = 2;

  try {
    final List<Person> batch1 = [];

    /// The code will run normally
    await for (final name in getNamesWithNoTimeout(
      time: timeLimit - 1,
    ).withTimeoutBetweenEvents(const Duration(
      seconds: timeLimit,
    ))) {
      final individual =
          Person(firstName: name.split(' ')[0], lastName: name.split(' ')[1]);
      final registeredIndividual = individual + batch1.length;

      if (registeredIndividual.generation == 0) {
        OriginalPerson original = OriginalPerson(pep: registeredIndividual);
        batch1.add(original);
      } else {
        batch1.add(registeredIndividual);
      }
    }
    users.add(batch1);

    final List<Person> batch2 = [];

    /// The error will be absorbed in this instance and the code will keep running
    await for (final name in getNamesWithTimeoutEx(
      time: timeLimit - 1,
    )
        .withTimeoutBetweenEvents(const Duration(
          seconds: timeLimit,
        ))
        .absorbStreamError()) {
      final individual =
          Person(firstName: name.split(' ')[0], lastName: name.split(' ')[1]);
      final registeredIndividual = individual + batch2.length;
      if (registeredIndividual.generation == 0) {
        OriginalPerson original = OriginalPerson(pep: registeredIndividual);
        batch2.add(original);
      } else {
        batch2.add(registeredIndividual);
      }
    }
    users.add(batch2);

    final List<Person> batch3 = [];

    /// The error will be catched here and the code will stop running
    await for (final name in getNamesWithTimeoutEx(time: timeLimit - 1)
        .withTimeoutBetweenEvents(const Duration(
      seconds: timeLimit,
    ))) {
      final individual =
          Person(firstName: name.split(' ')[0], lastName: name.split(' ')[1]);
      final registeredIndividual = individual + users.length;
      if (registeredIndividual.generation == 0) {
        OriginalPerson original = OriginalPerson(pep: registeredIndividual);
        batch3.add(original);
      } else {
        batch3.add(registeredIndividual);
      }
    }
    users.add(batch3);
  } on TimeoutBetweenEvents catch (e, stackTrace) {
    print('TimeoutBetweenEventsException: $e');
    print('Stack trace: $stackTrace');
  } finally {
    int i = 0;
    do {
      for (final pep in users[i]) {
        switch (pep.generation) {
          case 0:
            print('$pep the First');
            break;
          case 1:
            print('$pep the Second');
            break;
          case 2:
            print('$pep the Third');
            break;
          default:
            print(pep);
            break;
        }
      }
      i++;
    } while (i < users.length);
  }
}

mixin HasFirstName {
  String get firstName;
}
mixin HasLastName {
  String get lastName;
}

class Person with HasFirstName, HasLastName {
  @override
  final String firstName;
  @override
  final String lastName;

  final int generation;

  Person(
      {required this.firstName, required this.lastName, this.generation = 0});

  String get fullName => '$firstName $lastName';

  Person operator +(int other) => Person(
      firstName: firstName, lastName: lastName, generation: generation + other);

  @override
  String toString() {
    return 'Person (first name: "$firstName", last name: "$lastName", generation: $generation)';
  }
}

class OriginalPerson extends Person {
  OriginalPerson({required Person pep})
      : super(firstName: pep.firstName, lastName: pep.lastName);
  @override
  String toString() {
    return 'Original Person (first name: "$firstName", last name: "$lastName", generation: $generation)';
  }
}

/// All the Duration between data are within the limit
Stream<String> getNamesWithNoTimeout({required int time}) async* {
  yield 'Bob Brown';
  await Future.delayed(Duration(seconds: time));
  yield 'Alexander Hamilton';
  await Future.delayed(Duration(seconds: time));
  yield 'Joe Swanson';
}

/// There exists a duration that exceeds the limit
Stream<String> getNamesWithTimeoutEx({required int time}) async* {
  yield 'John Doe';
  await Future.delayed(Duration(seconds: time));
  yield 'Carl Jacobs';
  await Future.delayed(Duration(seconds: time + 1));
  yield 'Ferb Fletcher';
}

/// extension on the Stream
/// Timeout
extension WithTimeoutBetweenEvents<T> on Stream<T> {
  Stream<T> withTimeoutBetweenEvents(Duration duration) =>
      transform(TimeoutBetweenEvents(duration: duration));
}

/// Absorbing Error
extension AbsorbErrors<T> on Stream<T> {
  Stream<T> absorbStreamError() => handleError(
        (err, stackTrace) {
          print(err);
        },
      );
}

/// A Timeout Checker:
class TimeoutBetweenEvents<E> extends StreamTransformerBase<E, E> {
  final Duration duration;

  /// Given a duration (limit), the function will check the amount of time elapsed between received batches of data in a single stream.
  /// If that time exceeds the given limit, the function will throw a custom Timeout Exception
  const TimeoutBetweenEvents({
    required this.duration,
  });

  @override
  Stream<E> bind(Stream<E> stream) {
    StreamController<E>? controller;
    StreamSubscription<E>? subscription;
    Timer? timer;

    controller = StreamController(
      onListen: () {
        subscription = stream.listen(
          (data) {
            // cancel Previous Timer
            timer?.cancel();
            // start a new Timer
            timer = Timer.periodic(duration, (timer) {
              controller?.addError(
                TimeoutBetweenEventsException(
                  'Timeout',
                ),
              );
            });
            controller?.add(data);
          },
          onError: controller?.addError,
          onDone: controller?.close,
        );
      },
      onCancel: () {
        subscription?.cancel();
        timer?.cancel();
      },
    );
    return controller.stream;
  }
}

/// custom Timeout Exception
class TimeoutBetweenEventsException implements Exception {
  final String message;
  TimeoutBetweenEventsException(this.message);
}
