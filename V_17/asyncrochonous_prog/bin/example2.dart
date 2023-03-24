// Future Error Handling
void main(List<String> args) async {
  /// await  stops the execution of the program and then wait for the results of function and then it will continue

  try {
    final fullName = await getFullName(firstName: 'John', lastName: 'Doe');
    print(fullName);
    print(await getFullName(firstName: 'John', lastName: ''));
  } on FirstOrLastNameMissingException catch (e) {
    print(e);
  }
}

Future<String> getFullName(
    {required String firstName, required String lastName}) {
  if (firstName.isEmpty || lastName.isEmpty) {
    throw FirstOrLastNameMissingException();
  } else {
    return Future.value('$firstName $lastName');
  }
}

class FirstOrLastNameMissingException implements Exception {
  const FirstOrLastNameMissingException();
}
